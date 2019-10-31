---
title: 量子力学里的相空间体积
date: 2019-10-29 10:08:07
tags: [phase space, quantum mechanics, operator, entropy, wave function]
mathjax: true
---

最近学到统计力学中熵的微观含义，恶补了一顿量子力学。起因是在统计力学中，熵$S$和相空间$\Gamma$的体积有关：

$$ S = k_Bln(|\Gamma|) $$

根据热力学第三定律（Nernst假设），温度趋于绝对零度时，任何系统的熵为0。所以热力学第三定律应该同时也规定了描述相空间体积的单位，否则当改变$\Gamma$的体积单位时，会在$S$加上一个常数，熵就不再为0了，与热力学第三定律矛盾。

##波函数基础

平面单色波函数：

$$ \psi(r,t) = Ae^{i(k \cdot r-\omega t)} $$

其中$k=2\pi/\lambda$为波数，$\omega=2\pi f$为角频率。其振幅$A$不随时间变化，为定态波函数（并不意味着波函数不随时间变化）。

波函数来自于下面的二阶偏微分方程，平面单色波是其一个特解：

$$ \frac{\omega^2}{k^2} \nabla^2 \psi = \frac{\partial^2 \psi}{\partial t^2} $$

对于平面波，等相位面$ k \cdot r-\omega t = const $，对时间求导可得**相速度**：

$$ \frac{dr}{dt} = \frac{\omega}{k} $$

也就是波的相位传播速度。

###波包

实际情况中波动的振幅只在空间的有限区域内不为零，所以形象地称之为波包。通常波包可由不同波数$k$的波叠加而成，可写为：

$$ \psi(r, t) = \sum_k \phi(k) e^{i(k \cdot r-\omega(k)t)} $$

或将波数$k$考虑为连续变化，写为积分形式：

$$ \psi(r, t) = \int \phi(k)e^{i(k \cdot r - \omega(k)t)} dk $$

其中$ \phi(k) $为每一个单色波的振幅，角频率$\omega(k)$与波数$k$的函数关系称为波的**色散关系**。


所以我们可以考虑对处于$t=0$时刻的波包$\psi(r, 0)$乘以某一个单色波相因子的共轭：$e^{-ik \cdot r}$，根据三角函数的正交性，我们就可以得到该单色波的振幅$\phi(k)$：

$$ \phi(k) = \int \psi(r, 0)e^{-ik \cdot r} dr $$

即波函数的**Fourier变换与逆变换**。

##量子力学基础

物质波为概率波，

$$ \psi(r, t) = Ae^{i/\hbar(p \cdot r - Et)} $$

###动量空间波函数

$$ \psi(r, t) = \int \phi(p)e^{i/\hbar(p \cdot r - Et)} dp $$

$$ \phi(p) = \int \psi(r, 0)e^{-i/\hbar(p \cdot r)} dr $$

$$
\begin{align}
<p> &= \int p |\phi(p)|^2 dp \nonumber \\
    &= \int \phi^*(p) p \phi(p)dp \nonumber \\
\end{align}
$$

###算符

$$
\begin{align}
\hat r &= r \nonumber \\
\hat p &= i\hbar \nabla \nonumber \\
\hat T &= -\frac{\hbar^2}{2m} \nabla^2 \nonumber \\
\hat L &= -i\hbar \hat r \times \nabla \nonumber \\
\end{align}
$$

###不确定关系

$$ \Delta r \cdot \Delta p \ge \hbar $$

##相空间体积

###Dirac函数
