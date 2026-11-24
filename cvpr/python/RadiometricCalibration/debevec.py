import cv2
import numpy as np
import matplotlib.pyplot as plt

# -------------------------- 1. 数据准备（与算法输入一致） --------------------------
def load_aligned_exposure_seq(img_dir, exposure_times):
    """
    加载并对齐多曝光图像序列（必须对齐，否则采样像素对应场景错误）
    :param img_dir: 图像路径前缀，如"exp_"，图像命名为"exp_0.jpg","exp_1.jpg"...
    :param exposure_times: 曝光时间数组，单位秒，如[0.033, 0.1, 1.0, 3.0]
    :return: 对齐后的图像列表，曝光时间数组
    """
    images = []
    for i in range(len(exposure_times)):
        img = cv2.imread(f"{img_dir}_{i}.jpg", cv2.IMREAD_COLOR)
        if img is None:
            raise FileNotFoundError(f"图像exp_{i}.jpg加载失败")
        images.append(img)
    
    # 用MTB算法对齐图像（Debevec算法要求像素级对齐）
    alignMTB = cv2.createAlignMTB(max_bits=6, exclude_range=4)
    aligned_images = []
    alignMTB.process(images, aligned_images)
    return aligned_images, np.array(exposure_times, dtype=np.float32)

# -------------------------- 2. 核心手工标定函数 --------------------------
def calibrate_debevec_manual(images, exposure_times, samples=70, lambda_=10.0):
    """
    手工实现Debevec逆响应函数标定
    :param images: 对齐后的多曝光图像列表（N张，3通道8位）
    :param exposure_times: 曝光时间数组（N个，单位秒）
    :param samples: 采样像素数（从图像中选samples个场景点）
    :param lambda_: 平滑权重
    :return: 逆响应曲线（256x3矩阵，对应R/G/B通道）
    """
    N = len(images)  # 图像数量
    height, width = images[0].shape[:2]
    channels = 3  # 固定处理R/G/B三通道
    
    # 步骤1：从图像中采样S个场景像素点（矩形网格采样，与OpenCV默认一致）
    sample_step = int(np.sqrt(height * width / samples))  # 均匀采样
    sample_coords = []
    for y in range(0, height, sample_step):
        for x in range(0, width, sample_step):
            if len(sample_coords) < samples:
                sample_coords.append((y, x))
            else:
                break
        if len(sample_coords) >= samples:
            break
    S = len(sample_coords)  # 实际采样数（可能略小于输入的samples）

    # 步骤2：对每个颜色通道单独求解（Debevec算法通道独立）
    crf = np.zeros((256, channels), dtype=np.float32)  # 存储逆响应曲线（0~255像素值对应g(Z)）
    for c in range(channels):
        # 提取采样点在所有图像中的像素值（Z_ij：第i个采样点，第j张图像的像素值）
        Z = np.zeros((S, N), dtype=np.int32)
        for i in range(S):
            y, x = sample_coords[i]
            for j in range(N):
                Z[i, j] = images[j][y, x, c]
        
        # 步骤3：构造加权超定方程组（对应Debevec目标函数）
        # 变量定义：[g(0), g(1), ..., g(255), ln(E_0), ln(E_1), ..., ln(E_{S-1})]
        # 变量总数：256 + S
        var_count = 256 + S
        # 矩阵A：行数 = 数据项(S*N) + 平滑项(254) + 约束项(1)；列数 = var_count
        A = np.zeros((S * N + 254 + 1, var_count), dtype=np.float64)
        b = np.zeros((S * N + 254 + 1, 1), dtype=np.float64)

        # -------------------------- 数据项：对应算法的最小二乘约束 --------------------------
        # 权重函数w(Z)：三角权重，抑制暗部/亮部噪声
        def weight(z):
            return min(z, 255 - z)
        
        row_idx = 0
        for i in range(S):  # 第i个采样点
            for j in range(N):  # 第j张图像
                z_ij = Z[i, j]
                w = weight(z_ij)
                # 方程：w*g(z_ij) - w*ln(Δt_j) = w*ln(E_i)
                # 对应矩阵A的行：g(z_ij)的系数为w，ln(E_i)的系数为 -w，其余为0
                A[row_idx, z_ij] = w  # g(z_ij)的系数
                A[row_idx, 256 + i] = -w  # ln(E_i)的系数
                b[row_idx, 0] = w * np.log(exposure_times[j])  # 右边项：w*ln(Δt_j)
                row_idx += 1

        # -------------------------- 平滑项：对应算法的二阶差分约束 --------------------------
        for z in range(1, 255):  # 遍历0~254的像素值（对应g(z)的二阶差分）
            # 方程：lambda*(g(z+1) - 2g(z) + g(z-1)) = 0
            A[row_idx, z-1] = lambda_  # g(z-1)的系数
            A[row_idx, z] = -2 * lambda_  # g(z)的系数
            A[row_idx, z+1] = lambda_  # g(z+1)的系数
            b[row_idx, 0] = 0.0
            row_idx += 1

        # -------------------------- 约束项：消除尺度歧义（固定g(128)=0） --------------------------
        # 方程：g(128) = 0，消除"整体加常数"的自由度
        A[row_idx, 128] = 1.0
        b[row_idx, 0] = 0.0
        row_idx += 1

        # 步骤4：用SVD求解超定方程组（最小二乘解，对应Debevec算法的求解方式）
        # 超定方程组Ax = b，解x为[g(0),...,g(255), ln(E_0),...,ln(E_{S-1})]
        x, _, _, _ = np.linalg.lstsq(A, b, rcond=None)
        # 提取逆响应曲线g(Z)（前256个变量）
        crf[:, c] = x[:256, 0]

    return crf

# -------------------------- 3. 结果可视化与验证 --------------------------
def plot_crf(crf, channel_names=["R", "G", "B"]):
    """可视化逆响应曲线（对数域）"""
    z = np.arange(256)
    plt.figure(figsize=(8, 5))
    for c in range(3):
        plt.plot(z, crf[:, c], label=channel_names[c])
    plt.xlabel("Pixel Value (0~255)")
    plt.ylabel("Inverse Response (log scale)")
    plt.title("Manual Debevec Inverse Camera Response Function")
    plt.legend()
    plt.grid(True)
    plt.show()

# -------------------------- 4. 主函数（示例使用） --------------------------
if __name__ == "__main__":
    # 示例：假设图像命名为"exp_0.jpg"到"exp_3.jpg"，曝光时间为[0.033, 0.1, 1.0, 3.0]
    # 请替换为你自己的图像路径和曝光时间
    img_dir_prefix = "exp"
    exposure_times = [0.033, 0.1, 1.0, 3.0]  # 4张包围曝光的时间（秒）
    
    # 加载并对齐图像
    aligned_imgs, times = load_aligned_exposure_seq(img_dir_prefix, exposure_times)
    
    # 手工标定逆响应曲线
    crf_manual = calibrate_debevec_manual(aligned_imgs, times, samples=70, lambda_=10.0)
    
    # 可视化结果
    plot_crf(crf_manual)
    
    # （可选）与OpenCV自带标定结果对比（验证正确性）
    # cv_cal = cv2.createCalibrateDebevec(samples=70, lambda=10.0, random=False)
    # crf_cv = cv_cal.process(aligned_imgs, times=times)
    # print("手工实现与OpenCV自带结果的最大误差：", np.max(np.abs(crf_manual - crf_cv)))
