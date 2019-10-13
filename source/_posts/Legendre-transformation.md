---
title: Legendre变换的理解和在热力学中的应用
date: 2019-09-25 20:41:00
tags: [Legendre, transformation, math, thermodynamics]
mathjax: true
---

热力学中有几个函数概念十分容易混淆：内能($U$)，焓($H$)，亥姆霍兹自由能($A$)和吉布斯自由能($G$)，。其实觉得容易混淆是因为对其中的Legendre变换没有理解。

##Legendre变换

###基本形式
对于一个函数$f(x_1,...,x_k)$，其微分形式为：

$$df = \sum_{i=1}^{k} \frac{\partial f}{\partial x_i} dx_i$$

令$u_i \equiv \frac{\partial f}{\partial x_i}$，$u_i$与$x_i$就是共轭变量，Legendre变换的作用就是将函数的自变量变换为其共轭变量，同时不损失任何函数信息。Legendre变换定义为：

$$g \equiv f-\sum_{i=1}^{r} u_ix_i \quad (r \le k)$$

其微分形式为：

$$
\begin{align}
dg &= df - \sum_{i=1}^{r} u_idx_i - \sum_{i=1}^{r} x_idu_i \nonumber \\
&= \sum_{i=r+1}^{k} u_idx_i - \sum_{i=1}^{r} x_idu_i \nonumber \\
\end{align}
$$

从微分形式可见，函数$$g=g(u_1,...u_r,x_{r+1},...x_k)$$，前$r$个自变量已经由 $x_i$变换为$u_i$。

###几何含义

假设存在一个凹函数$f(x)$，其Legendre变换为$g=f-ux$，我们可以将$ux+g$看做是经过($x$, $f(x)$)的函数$f$的切线，其截距为$g$，斜率为$u=\frac{\partial f}{\partial x}$。

##热力学函数

对于内能$U$，我们选取两个extensive量，熵$S$和体积$V$作为自变量，则内能函数为$U=U(S, V)$，其微分形式：
$$ dU(S, V) = TdS-pdV $$

其中$T$和$S$是共轭变量，$-p$和$V$是共轭变量。现在我们想将其中的变量$V$变换为其共轭变量$p$，于是有：

$$H \equiv U(S, V)-(-pV) $$

其微分形式为：

$$ dH = dU(S, V)+pdV+Vdp = TdS+Vdp $$

可见定义的新函数$H=H(S, p)$。

类似地，通过Legendre变换，我们可以得到另外两个热力学函数$F(T, V)$和$G(T, p)$：

$$
\begin{align}
&F \equiv U(S, V) - TS \nonumber \\
&G \equiv U(S, V) - TS + pV \nonumber \\
&dA = -SdT-pdV \nonumber \\
&dG = -SdT+Vdp \nonumber \\
\end{align}
$$

在实际当中，体系的温度、压强和体积比较好控制，因此$A(T, V)$和$G(T, p)$较为常用。
