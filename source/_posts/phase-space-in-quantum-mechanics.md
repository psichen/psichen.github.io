---
title: 量子力学里的相空间体积(一)
date: 2019-10-29 10:08:07
tags: [phase space, quantum mechanics, operator, entropy, wave function]
mathjax: true
---

最近学到统计力学中熵的微观含义，恶补了一顿量子力学。起因是在统计力学中，熵$S$和相空间$\Gamma$的体积有关：

$$ S = k_Bln(|\Gamma|) $$

根据热力学第三定律（Nernst假设），温度趋于绝对零度时，任何系统的熵为0。所以热力学第三定律应该同时也规定了描述相空间体积的单位，否则当改变$\Gamma$的体积单位时，会在$S$加上一个常数，熵就不再为0了，与热力学第三定律矛盾。下面分为三篇，分别记录Fourier变换与Dirac函数、波函数以及相空间的内容。

##Fourier变换与逆变换
Fourier变换将目标函数$f(t)$变为周期为$T/n$的正余弦函数的线性组合。

###三角函数形式的Fourier级数：

$$ f(t) = \frac{a_0}{2} + \sum_{n=1}^{+\infty} a_n \cos (n \omega t) + b_n \sin (n \omega t) $$

根据三角函数在周期区间内积分的正交性：

$$
\begin{align}

&\int_{-\frac{T}{2}}^{\frac{T}{2}} \cos (nt) dt = 0 \nonumber \\

&\int_{-\frac{T}{2}}^{\frac{T}{2}} \sin (nt) dt = 0 \nonumber \\

&\int_{-\frac{T}{2}}^{\frac{T}{2}} \cos (nt) \sin (mt) dt = 0 \nonumber \\

&\int_{-\frac{T}{2}}^{\frac{T}{2}} \cos (nt) \cos (mt) dt =
\begin{cases}
\frac{T}{2} & (n = m) \\
0 & (n \neq m) \\
\end{cases}
\nonumber \\

&\int_{-\frac{T}{2}}^{\frac{T}{2}} \sin (nt) \sin (mt) dt =
\begin{cases}
\frac{T}{2} & (n = m) \\
0 & (n \neq m) \\
\end{cases}
\nonumber \\

\end{align}
$$

我们在Fourier级数的两边同时对$t$积分：

$$ \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) dt = \frac{T}{2}a_0 $$

所以$a_0 = \frac{2}{T} \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) dt$。

然后我们在Fourier级数的两边同时乘上$\cos (n \omega t)$，再同时对$t$积分，可得到：

$$ \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) \cos (n \omega t) dt = \frac{T}{2} a_n $$

同理，乘上$\sin (n \omega t)$，积分后可得到：

$$ \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) \sin (n \omega t) dt = \frac{T}{2} b_n $$

整理之后，我们就可以得到Fourier级数展开的系数项：

$$
\begin{align}
a_n = \frac{2}{T} \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) \cos (n \omega t) dt \nonumber \\
b_n = \frac{2}{T} \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) \sin (n \omega t) dt \nonumber \\
\end{align}
$$

其中$a_n$为偶函数，$b_n$为奇函数。

###指数函数形式的Fourier级数
根据Euler公式：$e^{ikx} = \cos kx + i\sin kx$，所以三角函数可以表达为：

$$
\begin{align}
\cos (n \omega t) &= \frac{1}{2} (e^{i n \omega t}+e^{-i n \omega t}) \nonumber \\
\sin (n \omega t) &= \frac{1}{2i} (e^{i n \omega t}-e^{-i n \omega t}) \nonumber \\
\end{align}
$$

代入Fourier级数的表达式，合并指数项，并根据$a_n$和$b_n$的奇偶性，可得指数形式的Fourier级数：

$$
\begin{align}
f(t) &= \frac{a_0}{2}+\sum_{n=1}^{+\infty} \frac{a_n-i b_n}{2}e^{i n \omega t}+\frac{a_n+i b_n}{2}e^{-i n \omega t} \nonumber \\
&=\sum_{n=-\infty}^{+\infty} F(n \omega) e^{i n \omega t} \nonumber \\
\end{align}
$$

注意两个求和符号中$n$的取值范围，其中$F(n \omega) = \frac{a_n-ib_n}{2}$为指前因子。将$a_n$和$b_n$的表达式代入，得：

$$
\begin{align}
F(n \omega) &= \frac{1}{2}\left[ \frac{2}{T} \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) \cos (n \omega t) dt - \frac{2i}{T} \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) \sin (n \omega t) dt \right] \nonumber \\
&= \frac{1}{T} \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) e^{-i n \omega t} dt \nonumber \\
\end{align}
$$

###Fourier积分变换
因为周期$T$与角频率$\omega$满足关系：$T \omega = 2 \pi$，当$T \to +\infty$时，$\omega \to 0$，在对$n$的求和中，成为无穷小量$d (n \omega$)，于是由上文的指数形式的Fourier级数，扩展为积分形式，并令$\omega' = n \omega$，可得：
$$
\begin{align}
f(t) &= \sum_{-\infty}^{+\infty} F(n \omega) e^{i n \omega t} \nonumber \\
&= \sum_{-\infty}^{+\infty} \frac{F(n \omega)}{\omega} e^{i n \omega t} \omega \nonumber \\
&= \int_{-\infty}^{+\infty} \frac{F(n \omega)}{\omega} e^{i \omega' t} d\omega' \nonumber \\
&= \int_{-\infty}^{+\infty} g(\omega')e^{i \omega' t} d\omega' \nonumber \\
\end{align}
$$

其中令$g(\omega') = \frac{F(n \omega)}{\omega}$。

根据上面$F(n \omega) = \frac{1}{T} \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) e^{-i n \omega t} dt$以及$T\omega = 2\pi$，可得：

$$ \frac{F(n \omega)}{\omega} = \frac{1}{2\pi} \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) e^{-i n \omega t} dt $$

当$\omega \to 0$时，有：

$$ g(\omega') = \frac{1}{2\pi} \int_{-\infty}^{+\infty} f(t) e^{-i \omega' t} dt $$

整理一下，我们就得到了可析函数f(t)的Fourier变换与逆变换：

$$
\begin{align}
g(\omega) &= \frac{1}{2\pi} \int_{-\infty}^{+\infty} f(t) e^{-i \omega t} dt \nonumber \\
f(t) &= \int_{-\infty}^{+\infty} g(\omega) e^{i \omega t} d\omega \nonumber \\
\end{align}
$$

或改变一下函数前面的系数：

$$
\begin{align}
g(\omega) &= \int_{-\infty}^{+\infty} f(t) e^{-i \omega t} dt \nonumber \\
f(t) &= \frac{1}{2\pi} \int_{-\infty}^{+\infty} g(\omega) e^{i \omega t} d\omega \nonumber \\
\end{align}
$$

因为频率$f$与角频率$\omega$满足关系：$\omega = 2 \pi f$，所以上式可以改写为：

$$
\begin{align}
g(f) &= \int_{-\infty}^{+\infty} f(t) e^{-i 2 \pi f t} dt \nonumber \\
f(t) &= \int_{-\infty}^{+\infty} g(f) e^{i 2 \pi f t} df \nonumber \\
\end{align}
$$

物理上更多地使用如下形式：

$$
\begin{align}
g(\omega) &= \frac{1}{\sqrt{2\pi}} \int_{-\infty}^{+\infty} f(t) e^{-i \omega t} dt \nonumber \\
f(t) &= \frac{1}{\sqrt{2\pi}} \int_{-\infty}^{+\infty} g(\omega) e^{i \omega t} d\omega \nonumber \\
\end{align}
$$

##Dirac函数
Dirac函数为一种广义函数，定义为：

$$
\delta(x) =
\begin{cases}
+\infty & (x = 0) \\
0 & (x \neq 0) \\
\end{cases}
$$

并且满足$ \int_{-\infty}^{+\infty} \delta(x)dx = 1 $。

Dirac函数的性质：

$$ \int f(x)\delta(x-a)dx = f(a) $$

称之为Dirac函数的挑选性。根据挑选性，我们对Dirac函数进行Fourier变换：

$$ \mathscr F[\delta(x)] = \frac{1}{2\pi} \int\delta(x) e^{-i k x} dx = \frac{1}{2\pi} $$

再进行Fourier逆变换，我们就可以得到$\delta$函数的表达式之一：

$$ \delta(x) = \frac{1}{2\pi} \int e^{i k x} dk $$

##波函数基础

平面单色波函数：

$$ \psi(r,t) = \phi e^{i(k \cdot r-\omega t)} $$

其中$k=2\pi/\lambda$为波数，$\omega=2\pi f$为角频率。其振幅$\phi$不随时间变化，为定态波函数（并不意味着波函数不随时间变化）。

波函数来自于下面的二阶偏微分方程，平面单色波是其一个特解：

$$ \frac{\omega^2}{k^2} \nabla^2 \psi = \frac{\partial^2 \psi}{\partial t^2} $$

对于平面波，等相位面$ \phi = k \cdot r-\omega t = const $，将坐标对时间求导可得**相速度**：

$$ \frac{dr}{dt} = \frac{\omega}{k} $$

###波包

实际情况中波动的振幅只在空间的有限区域内不为零，所以形象地称之为波包。

![wavepacket.png](https://i.loli.net/2019/11/03/Xu8MKqIgdv3o1G5.png)

蓝色实线为波包，红色虚线为包络线。

通常波包可由不同波数$k$的波叠加而成，可写为：

$$ \psi(r, t) = \sum_k \phi(k) e^{i(k \cdot r-\omega(k)t)} $$

或将波数$k$考虑为连续变化，写为积分形式（Fourier逆变换)：

$$ \psi(r, t) = \int \phi(k)e^{i(k \cdot r - \omega(k)t)} dk $$

其中$ \phi(k) $为每一个单色波的振幅，角频率$\omega(k)$与波数$k$的函数关系称为波的**色散关系**。

考虑在$ (r_c, t) $处波包的振幅达到最大，那么波包经过传播，在$ (r_c+\Delta x, t+\Delta t) $时再现$ (r_c, t) $处的各个频率的相位，所以相位对于频率的导数应为0：

$$ \frac{d \phi}{d k} = r_c - \frac{d \omega}{d k}t = 0 $$

再对时间求导可得**群速度**：$ \frac{d r_c}{d t} = \frac{d \omega}{d k} $。


###波函数的Fourier变换

所以我们可以考虑对处于$t=0$时刻的波包$\psi(r, 0)$乘以某一个单色波相因子的共轭：$e^{-ik \cdot r}$，根据三角函数积分的正交性，我们就可以得到该单色波的振幅$\phi(k)$：

$$ \phi(k) = \frac{1}{2 \pi} \int \psi(r, 0)e^{-ik \cdot r} dr $$

$\frac{1}{2\pi}$来自于对三角函数周期区间积分所得结果。另外如果将$\psi(r, t)$的表达式代入，根据$\delta$函数的性质，可以得到相同结果：

$$
\begin{align}
\frac{1}{2 \pi} \int \psi(r, 0) e^{-i k \cdot r} dr &= \frac{1}{2 \pi} \int e^{-i k \cdot r} dr \int \phi(k') e^{i k' \cdot r} dk' \nonumber \\
&= \int \phi(k') dk' \int \frac{1}{2 \pi} e^{i(k'-k) \cdot r} dr \nonumber \\
&= \int \phi(k') \delta(k'-k) dk' \nonumber \\
&= \phi(k)
\end{align}
$$
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
    &= \int \phi^*(p,t) p \phi(p,t)dp \nonumber \\
    &= \int \phi(p,t)p dp \left[ \frac{1}{(2 \pi \hbar)^{3/2}}\int \psi^*(r, t) e^{i/\hbar p \cdot r} dr \right] \nonumber \\
    &= \int \psi^*(r, t) dr \left[ \frac{1}{(2 \pi \hbar)^{3/2}}\int p \phi(p, t) e^{i/\hbar p \cdot r} dp \right] \nonumber \\
    &= \int \psi^*(r, t) dr \left[ \frac{1}{((2 \pi \hbar)^{3/2}}\int \phi(p, t) (-i \hbar \nabla e^{i/\hbar p \cdot r}) dp \right] \nonumber \\
    &= \int \psi^*(r, t) dr (-i \hbar \nabla ) \left[ \frac{1}{(2 \pi \hbar)^{3/2}} \int \phi(p,t) e^{i/\hbar p \cdot r} dp \right] \nonumber \\
    &= \int \psi^*(r, t) (-i \hbar \nabla ) \psi(r, t) dr
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
