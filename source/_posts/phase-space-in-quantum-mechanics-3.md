---
title: 量子力学里的相空间体积(三)
date: 2019-10-31 10:08:07
tags: [phase space, quantum mechanics, operator, entropy, uncertainty principle]
mathjax: true
---

##量子力学基础

物质波为概率波，将单色平面波写为如下形式：

$$ \psi(r, t) = \frac{1}{ (2\pi \hbar)^{3/2} } e^{i/\hbar(p \cdot r - Et)} $$

方便之后归一化为$\delta$函数。其振幅的平方$|\psi(r,t)|^2$对应于粒子坐标的概率密度，因此对于粒子的平均位置$<r>$可以从下式求出：

$$ <r> = \int r |\psi(r, t)|^2 dr = \int \psi^*(r, t) r \psi(r, t) dr $$

###动量算符

根据波函数的叠加性和Fourier变换，我们可以得到波函数的两种变换形式($r$和$p$均为三维矢量)：

$$ \psi(r, t) = \frac{1}{(2 \pi \hbar)^{3/2}} \int \phi(p, t)e^{i/\hbar p \cdot r} dp $$

$$ \phi(p, t) = \frac{1}{(2 \pi \hbar)^{3/2}} \int \psi(r, t)e^{-i/\hbar p \cdot r} dr $$

其中$|\phi(p, t)|^2$为粒子动量$p$的概率密度分布，所以我们可以得到平均动量$<p>$：

$$
\begin{align}
<p> &= \int p |\phi(p)|^2 dp \nonumber \\
    &= \int \phi(p,t)p dp \left[ \frac{1}{(2 \pi \hbar)^{3/2}}\int \psi^*(r, t) e^{i/\hbar p \cdot r} dr \right] \nonumber \\
    &= \int \psi^*(r, t) dr \left[ \frac{1}{(2 \pi \hbar)^{3/2}}\int p \phi(p, t) e^{i/\hbar p \cdot r} dp \right] \nonumber \\
    &= \int \psi^*(r, t) dr \left[ \frac{1}{((2 \pi \hbar)^{3/2}}\int \phi(p, t) (-i \hbar \nabla e^{i/\hbar p \cdot r}) dp \right] \nonumber \\
    &= \int \psi^*(r, t) dr (-i \hbar \nabla ) \left[ \frac{1}{(2 \pi \hbar)^{3/2}} \int \phi(p,t) e^{i/\hbar p \cdot r} dp \right] \nonumber \\
    &= \int \psi^*(r, t) (-i \hbar \nabla ) \psi(r, t) dr \nonumber \\
\end{align}
$$

由此我们可以得到动量的算符表达式。类似的，动能$T = p^2/2m$，角动量$L = r \times p$，我们可以得到动能$T$和角动量$L$的算符表达式：

$$
\begin{align}
\hat r &= r \nonumber \\
\hat p &= -i \hbar \nabla \nonumber \\
\hat T &= -\frac{\hbar^2}{2m} \nabla^2 \nonumber \\
\hat L &= -i\hbar \hat r \times \nabla \nonumber \\
\end{align}
$$

###不确定关系

不确定关系来源于Fourier变换，是Fourier变换的内禀性质，与测量与否无关，与函数的具体形式无关。

假设函数$f(x)$存在Fourier变换，考虑积分：

$$ I = \int |\eta x f(x) + f'(x)|^2 dx \ge 0 $$

其中积分符号内的式子等于：

$$
\begin{align}
|\eta x f(x) + f'(x)|^2 &= [\eta x f(x) + f'(x)][\eta x f(x) + f'(x)]^* \nonumber \\
&= \eta^2 x^2 |f(x)|^2 + \eta x [f(x)f'^*(x)+f^*(x)f'(x)] + |f'(x)|^2 \nonumber \\
\end{align}
$$

所以$I$可以分为三个部分$I_1, I_2, I_3$：

$$
\begin{align}
I &= I_1+I_2+I_3 \nonumber \\
I_1 &= \eta^2 \int x^2 |f(x)|^2 dx \nonumber \\
I_2 &= \eta \int x [f(x)f'^*(x)+f^*(x)f'(x)] dx \nonumber \\
I_3 &= \int |f'(x)|^2 dx \nonumber \\
\end{align}
$$

对于$I_1$，$\int x^2 |f(x)|^2 dx$归一化后即为$\Delta x^2$。

对于$I_2$：

$$
\begin{align}
I_2 &= \eta \int x [f(x)f^*(x)]'dx \nonumber \\
&= \eta \int x d|f(x)|^2 \nonumber \\
&= \eta \left( x|f(x)|^2|_{-\infty}^{+\infty} - \int |f(x)|^2 dx \right) \nonumber \\
&= - \eta \int |f(x)|^2 dx \nonumber \\
\end{align}
$$

因为积分$\int x |f(x)|^2 dx$，也就是x的期望存在，所以$x|f(x)|^2$在$x \to \infty$时一定为0，否则积分不收敛。

对于$I_3$：

$$
\begin{align}
I_3 &= \int \left( \frac{1}{2\pi} \int i \omega' g(\omega') e^{i \omega' x} d\omega' \right) \left( \frac{1}{2\pi} \int (-i) \omega g^*(\omega) e^{-i \omega x} d\omega \right) dx \nonumber \\
&= \frac{1}{4\pi^2} \iiint \omega \omega' g(\omega)g^*(\omega') e^{i(\omega' - \omega)x} dx d\omega d\omega' \nonumber \\
&= \frac{1}{2\pi} \iint \omega \omega' g(\omega) g^*(\omega') \delta(\omega' - \omega) d\omega d\omega' \nonumber \\
&= \frac{1}{2\pi} \int \omega^2 |g(\omega)|^2 d\omega \nonumber \\
\end{align}
$$

所以$I_3 \sim \Delta \omega^2$。根据Parseval定理：$ \int |f(x)|^2 dx = \frac{1}{2\pi} \int |g(\omega)|^2 d\omega $，对$I$同时除以$\int |f(x)|^2 dx$，可得：

$$ \eta^2 \Delta x^2 - \eta + \Delta \omega^2 \ge 0 $$

上式是关于$\eta$的二次函数，其二阶导数$2 \Delta x^2 \ge 0$，所以当$\eta = \frac{1}{2 \Delta x^2}$时，函数取最小值，代入上式得：

$$ \Delta \omega^2 - \frac{1}{4 \Delta x^2} \ge 0 $$
$$ \Delta x \Delta \omega \ge \frac{1}{2} $$

将动量和波数的色散关系$p = \hbar \omega $代入，可得量子力学中的不确定性原理表达式：
$$ \Delta x \cdot \Delta p \ge \frac{\hbar}{2} $$

##相空间最小单元

相空间中的一个点用于表示系统所处的一个状态，对于力学系统通常用三维方位和三维动量来表示，如果系统中有$N$个粒子，则相空间为$6N$维。根据不确定关系，方位和动量不可同时确定，所以相空间有最小单元体积：
