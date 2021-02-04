---
title: 鞍点近似
date: 2019-11-29 13:52:53
tags: [saddle point, approximation, stationary phase, asymptotic, complex analysis]
mathjax: true
---

鞍点法近似(saddle point approximation)，又称为stationary phase approximation，用于计算下列积分在$ N \to \infty $时的渐进行为。

$$ I(N) = \int_C e^{Nf(x)} dx $$

其中涉及到复变函数的一些基本性质。

## 复数及复变函数性质

复变量$z$在复平面可表示为$ z = x+yi $，其复变函数可表示为$ f(z) = u + vi $，其中$ u = u(x, y)， v = v(x, y) $。

另外也可以用极坐标来表示：$ z = |z|e^{i \phi} $，其中$\phi$决定了复变量的方向。

当$f(z)$在区域内处处可导，则称$f(z)$为该区域内解析。而解析函数的充要条件为函数$f(z)$在该区域内连续，同时满足C-R条件(Cauchy-Riemann condition)。

<!--more-->

### C-R条件

复变函数$f(z)$的极限存在的必要条件之一为与$z$逼近极限的路径无关，所以我们可以考虑分别从实轴和虚轴去逼近函数极限来求$f(z)$的导数。

从实轴求导：$ z+\Delta z = (x+\Delta x) + yi $
$$
\begin{aligned}
f'(z) & = \lim_{\Delta z \to 0} \frac{f(z+\Delta z)-f(z)}{\Delta z} \nonumber \\
&= \lim_{\Delta x \to 0} \frac{\Delta u + \Delta vi}{\Delta x} \nonumber \\
&= u_x + v_xi
\end{aligned}
$$

从虚轴求导：$z+\Delta z = x+(y+\Delta y)i $
$$
\begin{align}
f'(z) & = \lim_{\Delta z \to 0} \frac{f(z+\Delta z)-f(z)}{\Delta z} \nonumber \\
&= \lim_{\Delta y \to 0} \frac{\Delta u + \Delta vi}{\Delta yi} \nonumber \\
&= v_y - u_yi
\end{align}
$$

比较$(1)$和$(2)$，我们就可以得到可导函数的Cauchy-Riemann条件：
$$
\begin{cases}
u_x = v_y \\
u_y = -v_x
\end{cases}
$$

###调和性
满足解析条件的复变函数$f(z)$，其实部函数$u(x, y)$和虚部函数$v(x, y)$具有调和性（Harmonicity）:

$$ \nabla^2 u = \nabla^2 v = 0 $$

根据C-R定理：

$$
\begin{align}
\nabla^2 u &= \frac{\partial u_x}{\partial x} + \frac{\partial u_y}{\partial y} \nonumber \\
&= \frac{\partial v_y}{\partial x} - \frac{\partial v_x}{\partial y}\nonumber \\
&= v_{yx} - v_{xy} \nonumber \\
&= 0 \nonumber
\end{align}
$$

对于$v$同理可证。

根据调和性，我们可以知道函数的实部$u(x,y)$在两个方向上的二阶导数是异号（如果不为0的话）的，这表明了鞍点的存在。

## 鞍点近似法

对于积分$ I = \int e^{Nf(z)} dz $，要求$f(z) = u + vi $为解析复变函数，根据解析函数的调和性，$f(z)$有鞍点$z_0$。我们将积分路径$C$变为$C'$，使其沿一个固定幅角$\phi$经过$z_0$。

由于$f(z)$在指数函数上，因此可以想象，当$N$极大时，在鞍点$z_0$附近，$e^{Nf(z)}$的图像非常陡峭，因此该函数的积分主要由$z_0$的邻域所贡献。

将$f(z)$在$z_0$处进行Tayler展开，于是积分$I$变为：

$$ I = e^{Nf(z_0)} \int_{C'} e^{\frac{1}{2} N f''(z_0)(z-z_0)^2} dz $$

然后我们将复变量$(z-z_0)$和$f''(z_0)$均用极坐标来表示：

$$ z-z_0 = re^{i\phi} $$
$$ f''(z_0) =  |f''(z_0)|e^{i\theta} $$

于是上述积分变为：

$$ I = e^{Nf(z_0)} \int_{C'} e^{\frac{1}{2} N |f''(z_0)| r^2 e^{i(\theta+2\phi)}} e^{i\phi} dr $$

被积函数中$e^{i(\theta+2\phi)} = \cos(\theta+2\phi)+i\sin(\theta+2\phi)$，可知当$\theta+2\phi = \pi$时，上述积分变为一个Gauss积分，于是最终得到积分近似：

$$ I = \int_C e^{Nf(z)}dz \approx e^{Nf(z_0)+i\phi}\cdot\sqrt{\frac{2\pi}{N|f''(z_0)|}} $$

其中$ \phi = \frac{\pi}{2}-\frac{arg(f''(z_0))}{2} $

### Stirling近似

$$ \Gamma(x) = \int_0^\infty e^{-t}t^{x-1} dt $$

当$x >> 1$时，可使用鞍点近似。首先将$\Gamma(x)$变为$\int e^{xf(t)} dt$的形式：

$$ \Gamma(x+1) = \int_0^{\infty} e^{xlnt-t} dt $$

令$ t = xs $，有：

$$ \Gamma(x+1) = x \int_0^{\infty} e^{xlnx+x(lns-s)} ds $$

因为有$ \Gamma(x+1) = x\Gamma(x) $，所以：

$$ \Gamma(x) = x^x \int_0^{\infty} e^{x(lns-s)} ds $$

考虑复平面上的积分$ I = \int e^{x(lnz-z)} dz $，其中$f(z) = lnz-z$，$z_0 = 1$，$f(z_0) = -1$，$f''(z_0) = -1$，$arg(f''(z_0)) = \pi $，故积分路径的幅角$\theta = 0$，恰好为沿着正实轴。

代入近似公式，得：

$$ \Gamma(x) \approx x^x e^{-x} \sqrt{\frac{2\pi}{x}} = x^{x-\frac{1}{2}}e^{-x}\sqrt{2\pi} $$
