---
jupyter:
  jupytext:
    formats: ipynb,md
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.13.1
  kernelspec:
    display_name: Python 3
    language: python
    name: python3
---

<!-- #region slideshow={"slide_type": "slide"} -->
# 误差反传算法
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "slide"} -->
# 向量描述
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
## $\Delta E,\Delta O,\Delta W$
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->

对于第i层网络：
\begin{align*}
\vec O_i &=F_i(W_i\vec X_i+\vec b_i)\\
&=\begin{bmatrix}
f_i(\vec w_1 \vec X_i+b_{i,1})  &  f_i(\vec w_2 \vec X_i+b_{i,2}) & \cdots & f_i(\vec w_n \vec X_i +b_{i,n})
\end{bmatrix}^T
\end{align*}
其中：

- $\vec O_i$ 为第i层网络输出 ，
- $\vec X_i$ 为第i层网络输入，等于第 $i-1$ 层网络输出 $\vec O_{i-1}$
- $\vec w_j$ 为第i层网络权值矩阵 $W_i$ 的第j行， 
- $b_{i,j}$ 为向量 $\vec b_i$ 的第j个元素。

<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->

对于 $W_i$ 的一个微小变化 $\Delta W_i$ ，得：
\begin{align*}
\Delta \vec O_i &=\begin{bmatrix}
f'_i(\vec w_1 \vec X_i+b_{i,1})\Delta \vec w_1 \vec X_i  &  f'_i(\vec w_2 \vec X_i+b_{i,2})\Delta \vec w_2 \vec X_i & \cdots & f'_i(\vec w_n \vec X_i +b_{i,n})\Delta \vec w_n \vec X_i
\end{bmatrix}^T \\
&=diag[F'_i(W_i\vec X_i+\vec b_i)]\Delta W\vec X_i \\
&=diag(F'_i)\Delta W_i \vec X_i
\end{align*}


其中 $diag(F)$ 表示主对角元素为向量 F的元素的方阵。


<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->


对于N层网络的误差函数：

$$ E=(\vec{Y}-\vec O_N)^T(\vec{Y}-\vec O_N)$$


误差函数的增量：
\begin{align*}
\Delta E &=-2(\vec Y-\vec O_N)^T\cdot \Delta\vec O_N\\
&=-2(\vec Y-\vec O_N)^T\cdot diag(F'_N)\Delta W_N \vec X_N\\
\frac{\partial E}{\partial W_N}&=-2 diag(F'_N)\cdot(\vec Y-\vec O_N)\cdot \vec X_N^T
\end{align*}
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
## 反向传播
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
根据链式法则：
\begin{align*}
\Delta \vec O_i&=\begin{bmatrix}
f'_i(\vec w_1 \vec X_i+b_{i,1}) \vec w_1 \Delta\vec X_i  &  f'_i(\vec w_2 \vec X_i+b_{i,2}) \vec w_2 \Delta\vec X_i & \cdots & f'_i(\vec w_n \vec X_i +b_{i,n}) \vec w_n \Delta\vec X_i
\end{bmatrix}^T \\
&=diag(F'_i)W_i \Delta\vec X_i\\
\Delta E &= 2(\vec O_N-\vec Y)^T\cdot diag(F'_N) \cdot W_N \cdot \Delta \vec X_N\\
&= 2(\vec O_N-\vec Y)^T\cdot diag(F'_N) \cdot W_N \cdot \Delta \vec O_{N-1}\\
&=2(\vec O_N-\vec Y)^T\cdot diag(F'_N) \cdot W_N \cdot diag(F'_{N-1})\cdot \Delta W_N \cdot \vec X_{N-1}
\end{align*}


<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
对于N层网络可得：
\begin{align*}
\Delta E &= \vec{\alpha}^T\cdot\Delta W_i\cdot \vec{\beta} \\
\frac{\partial E}{\partial W_i} &= \vec{\alpha}\cdot\vec \beta^T
\end{align*}
其中：
\begin{align*}
\vec{\alpha}^T&=2(\vec O_N-\vec Y)^T\cdot diag(F'_N) \cdot \left[\prod_{n=i+1}^{N} W_n \cdot diag(F'_{n-1})\right] \\
\vec{\beta}&=\vec{X_i}\qquad (\text{ inputs of the i'th layer})
\end{align*}

<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
反向传播：
\begin{align*}
\vec\delta_N&=[2(\vec Y_o-\vec Y_E)^T\cdot diag(F'_N)]^T \\
            &= diag(F'_N)\cdot 2(\vec Y_o-\vec Y_E) \\
\vec\delta_n&=  diag(F'_n)\cdot W_{n+1}^T \cdot\vec\delta_{n+1} \\
\Delta W_i &=\delta_i \cdot \vec X_i^T
\end{align*}

<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
## 偏置向量
对偏置向量的更新可考虑增广权植矩阵 $[W|b]$ ,增广输入 $\begin{bmatrix} \vec X_o  \\ 1\end{bmatrix}$ 。令 $\beta=\begin{bmatrix} \vec X_o \\ 1\end{bmatrix}$ 即可得到增广权值矩阵的更新公式。


<!-- #endregion -->

<!-- #region slideshow={"slide_type": "slide"} -->
# 递推描述
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
## 符号表示
考虑神经元 $q$ ，有：
\begin{align*}
q_x &= \sum_{p \in \{p'|p'\rightarrow q\}}w_{qp}p_o \\
q_o &= f(q_x) \\
\end{align*}
其中：

- $q_x$ 表示神经元 $q$ 的输入
- $q_o$ 表示神经元 $q$ 的输出
- $p_o$ 表示神经元 $p$ 的输出
- $f(\cdot)$ 表示神经元的非线性函数
- $w_{qp}$ 表示连接神经元 $q$ 输出端到 $p$ 输入端 的网络权值
- $\{p'|p'\rightarrow q\}$ 表示神经元 $p'$ 的集合， $p'$ 的输出端连接到 $q$ 输入端的


<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->

## 输出层神经元 $t$：
\begin{align*}
\frac{\partial E}{\partial t_x} &=\frac{\partial E}{\partial t_o} \frac{\partial t_o}{\partial t_x}\\
&=\frac{\partial }{\partial t_o}[\frac{1}{2}(t_o-t_y)^2] \frac{\partial t_o}{\partial t_x}\\
&=(t_o-t_y) \frac{\partial t_o}{\partial t_x}\\
&=(t_o-t_y) f'(t_x)\\
\frac{\partial E}{\partial w_{tq}} &=\frac{\partial E}{\partial t_x}\frac{\partial t_x}{\partial w_{tq}}\\
&=\frac{\partial E}{\partial t_x}q_o
\end{align*}

其中：

- $t_y$ 为输出神经元 $t$ 的期望输出
- $f'(t_x)=\left.\frac{df(t_x)}{dt_x}\right|_{t_x}$
- $q$ 为输出端连接到 $t$ 的输入端的某个神经元



<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->

## 其它神经元 $q$:
\begin{align*}
\frac{\partial E}{\partial q_x}&=\sum_{r\in\{r'|q\rightarrow r'\}}\frac{\partial E}{\partial r_x}\frac{\partial r_x}{\partial q_x}\\
&=\sum_{r\in\{r'|q\rightarrow r'\}}\frac{\partial E}{\partial r_x}\frac{\partial r_x}{\partial q_o}\frac{\partial q_o}{\partial q_x} \\
&=\sum_{r\in\{r'|q\rightarrow r'\}}\frac{\partial E}{\partial r_x}w_{rq}f'(q_x) \\
\frac{\partial E}{\partial w_{qp}} &=\frac{\partial E}{\partial q_x}\frac{\partial q_x}{\partial w_{qp}} \\
&=\frac{\partial E}{\partial q_x}p_o
\end{align*}

<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->

## 反向传播
输出层神经元：
\begin{align*}
t_{\delta}&=\frac{\partial E}{\partial t_x}\\
&=(t_o-t_y) f'(t_x)\\
\Delta w_{tq}&=-\eta t_{\delta}q_o
\end{align*}
其它神经元：
\begin{align*}
q_{\delta}&=\frac{\partial E}{\partial q_x}\\
&=\sum_{\{r|q\rightarrow r\}}r_{\delta}w_{rq}f'(q_x)\\
\Delta w_{qp}&=-\eta q_{\delta}p_o
\end{align*}


<!-- #endregion -->
