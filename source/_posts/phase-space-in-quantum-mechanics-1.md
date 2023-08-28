---
title: 量子力学里的相空间体积--Fourier变换
date: 2019-10-29 10:08:07
tags: [Fourier transform, Dirac function]
---

最近学到统计力学中熵的微观含义，恶补了一顿量子力学。起因是在统计力学中，熵$S$和相空间$\Gamma$的体积有关：

$$ S = k_Bln(|\Gamma|) $$

根据热力学第三定律（Nernst假设），温度趋于绝对零度时，任何系统的熵为0。所以热力学第三定律应该同时也规定了描述相空间体积的单位，否则当改变$\Gamma$的体积单位时，会在$S$加上一个常数，熵就不再为0了，与热力学第三定律矛盾。下面分为三篇，分别记录Fourier变换与Dirac函数、波函数以及相空间的内容。

<!--more-->

## Fourier变换与逆变换
Fourier变换将目标函数$f(t)$变为周期为$T/n$的正余弦函数的线性组合。

### 三角函数形式的Fourier级数：

$$ f(t) = \frac{a_0}{2} + \sum_{n=1}^{+\infty} a_n \cos (n \omega t) + b_n \sin (n \omega t) $$

根据三角函数在周期区间内积分的正交性：

$$
\begin{aligned}
&\int_{-\frac{T}{2}}^{\frac{T}{2}} \cos (nt) dt = 0 \\
&\int_{-\frac{T}{2}}^{\frac{T}{2}} \sin (nt) dt = 0 \\
&\int_{-\frac{T}{2}}^{\frac{T}{2}} \cos (nt) \sin (mt) dt = 0 \\
&\int_{-\frac{T}{2}}^{\frac{T}{2}} \cos (nt) \cos (mt) dt =
\begin{cases}
\frac{T}{2} & (n = m) \\
0 & (n \neq m) \\
\end{cases}
\\
&\int_{-\frac{T}{2}}^{\frac{T}{2}} \sin (nt) \sin (mt) dt =
\begin{cases}
\frac{T}{2} & (n = m) \\
0 & (n \neq m) \\
\end{cases}
\\
\end{aligned}
$$

我们在Fourier级数的两边同时对$t$积分：

$$ \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) dt = \frac{T}{2}a_0 $$

所以

$$ a_0 = \frac{2}{T} \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) dt $$

然后我们在Fourier级数的两边同时乘上$\cos (n \omega t)$，再同时对$t$积分，可得到：

$$ \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) \cos (n \omega t) dt = \frac{T}{2} a_n $$

同理，乘上$\sin (n \omega t)$，积分后可得到：

$$ \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) \sin (n \omega t) dt = \frac{T}{2} b_n $$

整理之后，我们就可以得到Fourier级数展开的系数项：

$$
\begin{aligned}
a_n = \frac{2}{T} \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) \cos (n \omega t) dt \\
b_n = \frac{2}{T} \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) \sin (n \omega t) dt \\
\end{aligned}
$$

其中$a_n$为偶函数，$b_n$为奇函数。

### 指数函数形式的Fourier级数
根据Euler公式：$e^{ikx} = \cos kx + i\sin kx$，所以三角函数可以表达为：

$$
\begin{aligned}
\cos (n \omega t) &= \frac{1}{2} (e^{i n \omega t}+e^{-i n \omega t}) \\
\sin (n \omega t) &= \frac{1}{2i} (e^{i n \omega t}-e^{-i n \omega t}) \\
\end{aligned}
$$

代入Fourier级数的表达式，合并指数项，并根据$a_n$和$b_n$的奇偶性，可得指数形式的Fourier级数：

$$
\begin{aligned}
f(t) &= \frac{a_0}{2}+\sum_{n=1}^{+\infty} \frac{a_n-i b_n}{2}e^{i n \omega t}+\frac{a_n+i b_n}{2}e^{-i n \omega t} \\
&=\sum_{n=-\infty}^{+\infty} F(n \omega) e^{i n \omega t} \\
\end{aligned}
$$

注意两个求和符号中$n$的取值范围，其中$F(n \omega) = \frac{a_n-ib_n}{2}$为指前因子。将$a_n$和$b_n$的表达式代入，得：

$$
\begin{aligned}
F(n \omega) &= \frac{1}{2}\left[ \frac{2}{T} \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) \cos (n \omega t) dt - \frac{2i}{T} \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) \sin (n \omega t) dt \right] \\
&= \frac{1}{T} \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) e^{-i n \omega t} dt \\
\end{aligned}
$$

### Fourier积分变换
因为周期$T$与角频率$\omega$满足关系：$T \omega = 2 \pi$，当$T \to +\infty$时，$\omega \to 0$。

对无穷小量的求和满足如下关系：

$$ \sum_{-\infty}^{+\infty} f(n \delta x) = \frac{1}{\delta x} \int_{-\infty}^{+\infty} f(x) dx $$

于是上文的指数形式的Fourier级数，可以扩展为积分形式：

$$
\begin{aligned}
f(t) &= \sum_{-\infty}^{+\infty} F(n \omega) e^{i n \omega t} \\
     &= \int_{-\infty}^{+\infty} \frac{F(\omega)}{\omega} e^{i \omega t} d\omega \\
\end{aligned}
$$

其中令$g(\omega) = \frac{F(\omega)}{\omega}$。

根据上面$F(n \omega) = \frac{1}{T} \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) e^{-i n \omega t} dt$，将 $\omega$ 记为 $\omega'$，根据$T\omega' = 2\pi$，可得：

$$ \frac{F(\omega')}{\omega'} = \frac{1}{2\pi} \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) e^{-i \omega' t} dt $$

当$\omega' \to 0$时，有：

$$ g(\omega') = \frac{1}{2\pi} \int_{-\infty}^{+\infty} f(t) e^{-i \omega' t} dt $$

整理一下，我们就得到了可析函数f(t)的Fourier变换与逆变换：

$$
\begin{aligned}
g(\omega) &= \frac{1}{2\pi} \int_{-\infty}^{+\infty} f(t) e^{-i \omega t} dt \\
f(t)      &= \int_{-\infty}^{+\infty} g(\omega) e^{i \omega t} d\omega \\
\end{aligned}
$$

或改变一下函数前面的系数：

$$
\begin{aligned}
g(\omega) &= \int_{-\infty}^{+\infty} f(t) e^{-i \omega t} dt \\
f(t)      &= \frac{1}{2\pi} \int_{-\infty}^{+\infty} g(\omega) e^{i \omega t} d\omega \\
\end{aligned}
$$

因为频率$f$与角频率$\omega$满足关系：$\omega = 2 \pi f$，所以上式可以改写为：

$$
\begin{aligned}
g(f) &= \int_{-\infty}^{+\infty} f(t) e^{-i 2 \pi f t} dt \\
f(t) &= \int_{-\infty}^{+\infty} g(f) e^{i 2 \pi f t} df \\
\end{aligned}
$$

物理上更多地使用如下形式：

$$
\begin{aligned}
g(\omega) &= \frac{1}{\sqrt{2\pi}} \int_{-\infty}^{+\infty} f(t) e^{-i \omega t} dt \\
f(t)      &= \frac{1}{\sqrt{2\pi}} \int_{-\infty}^{+\infty} g(\omega) e^{i \omega t} d\omega \\
\end{aligned}
$$

## Dirac函数
Dirac函数为一种广义函数，定义为：

$$
\delta(x) =
\begin{cases}
+\infty & (x = 0) \\
0 & (x \neq 0) \\
\end{cases}
$$

并且满足$\int_{-\infty}^{+\infty} \delta(x)dx = 1$。

Dirac函数的性质：

$$ \int f(x)\delta(x-a)dx = f(a) $$

称之为Dirac函数的挑选性。根据挑选性，我们对Dirac函数进行Fourier变换：

$$ \mathscr F[\delta(x)] = \frac{1}{2\pi} \int\delta(x) e^{-i k x} dx = \frac{1}{2\pi} $$

再进行Fourier逆变换，我们就可以得到$\delta$函数的表达式之一：

$$ \delta(x) = \frac{1}{2\pi} \int e^{i k x} dk $$
