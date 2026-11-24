import cv2
import numpy as np

# 1. 加载同场景不同曝光的图像序列（需提前准备多曝光对齐图像）
# 要求：所有图像尺寸一致、场景完全对齐，同时提供每张图像对应的曝光时间
image_paths = ["exposure_1s.jpg", "exposure_2s.jpg", "exposure_4s.jpg", "exposure_8s.jpg"]
exposure_times = np.array([1.0, 2.0, 4.0, 8.0], dtype=np.float32)  # 曝光时间单位：秒

# 读取图像并转换为OpenCV适配的色彩空间（OpenCV默认读BGR，需转RGB以统一处理）
images = []
for path in image_paths:
    img = cv2.imread(path)
    img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    images.append(img_rgb)

# 2. 执行Debevec辐射标定，求解相机辐射响应曲线
calibrator = cv2.createCalibrateDebevec()
response_curve = calibrator.process(images, exposure_times)

# 3. 生成线性辐射图（完成辐射校正，将非线性图像值映射为真实辐射值）
merger = cv2.createMergeDebevec()
radiance_map = merger.process(images, exposure_times, response_curve)

# 4. 可视化校正结果（将浮点辐射图归一化到0-255的8位区间）
radiance_8bit = cv2.normalize(radiance_map, None, 0, 255, cv2.NORM_MINMAX).astype(np.uint8)
vis_result = cv2.cvtColor(radiance_8bit, cv2.COLOR_RGB2BGR)

# 显示原始图与校正结果对比
cv2.imshow("原始曝光图像（最后一帧）", cv2.imread(image_paths[-1]))
cv2.imshow("辐射校正后结果", vis_result)
cv2.waitKey(0)
cv2.destroyAllWindows()
