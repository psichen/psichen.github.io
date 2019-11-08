---
title: 量子力学里的相空间体积(三)
date: 2019-10-31 10:08:07
tags: [phase space, quantum mechanics, operator, entropy, uncertanity relation]
mathjax: true
---

##量子力学基础

物质波为概率波，将单色平面波写为如下形式：

$$ \psi(r, t) = \frac{1}{ (2\pi \hbar)^{3/2} } e^{i/\hbar(p \cdot r - Et)} $$

<<<<<<< HEAD
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
    &= \int \phi^*(p,t) p \phi(p,t)dp \nonumber \\
    &= \int \phi(p,t)p dp \left[ \frac{1}{(2 \pi \hbar)^{3/2}}\int \psi^*(r, t) e^{i/\hbar p \cdot r} dr \right] \nonumber \\
    &= \int \psi^*(r, t) dr \left[ \frac{1}{(2 \pi \hbar)^{3/2}}\int p \phi(p, t) e^{i/\hbar p \cdot r} dp \right] \nonumber \\
    &= \int \psi^*(r, t) dr \left[ \frac{1}{((2 \pi \hbar)^{3/2}}\int \phi(p, t) (-i \hbar \nabla e^{i/\hbar p \cdot r}) dp \right] \nonumber \\
    &= \int \psi^*(r, t) dr (-i \hbar \nabla ) \left[ \frac{1}{(2 \pi \hbar)^{3/2}} \int \phi(p,t) e^{i/\hbar p \cdot r} dp \right] \nonumber \\
    &= \int \psi^*(r, t) (-i \hbar \nabla ) \psi(r, t) dr
=======
方便之后归一化为$\delta$函数。$|\psi^2|$为微观粒子位置分布的概率密度，所以我们可以得到微观粒子的平均位置：

$$ <r> = \int r |\psi|^2 dr = \int \psi^* r \psi dr $$

###动量空间波函数
由于波函数的叠加性，我们可以将$\psi(r, t)$看成是由多个动量为$p$，能量为$E$的波函数叠加而成，写为：
$$ \psi(r, t) = \int \phi(p)e^{i/\hbar(p \cdot r - Et)} dp $$

为方便取$t=0$，其振幅$\phi(p)$的平方为粒子动量的概率分密度，根据Fourier变换，有：
$$ \phi(p) = \frac{1}{2 \pi} \int \psi(r, 0)e^{-i/\hbar(p \cdot r)} dr $$

所以粒子的平均动量可以表示为：

$$
\begin{align}
<p> &= \int p |\phi|^2 dp \nonumber \\
    &= \int \phi^* p \phi dp \nonumber \\
    &= 
>>>>>>> 9edfcf3a0bb7fe64540594b9fd5f833d3a18d208
\end{align}
-  
$$

由此我们可以得到动量的算符表达式。类似的我们可以得到动能$T$和角动量$L$的算符表达式：

$$
\begin{align}
\hat r &= r \nonumber \\
\hat p &= -i \hbar \nabla \nonumber \\
\hat T &= -\frac{\hbar^2}{2m} \nabla^2 \nonumber \\
\hat L &= -i\hbar \hat r \times \nabla \nonumber \\
\end{align}
$$

###不确定关系

$$ \Delta r \cdot \Delta p \ge \hbar $$

##相空间体积
