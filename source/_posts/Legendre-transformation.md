---
title: Legendre变换的理解和在热力学中的应用
date: 2019-09-25 20:41:00
tags: [Legendre, transformation, math, thermodynamics]
mathjax: true
---

热力学中有几个能量概念十分容易混淆：内能(U)，焓(H)，亥姆霍兹自由能(F)和吉布斯自由能(G)。都是能量的量纲，然后适用条件又不一样。其实觉得容易混淆是因为对其中的Legendre变换没有理解。

##Legendre变换

###基本形式
对于一个函数$f(x_1,...,x_k)$，其微分形式为：

$$df = \sum_{i=1}^{k} \frac{\partial f}{\partial x_i} dx_i$$

令$u_i \equiv \frac{\partial f}{\partial x_i}$，$u_i$与$x_i$就是共轭变量，Legendre变换的作用就是将函数的自变量变换为其共轭变量，同时不损失任何函数信息。Legendre变换定义为：

$$g \equiv f-\sum_{i=1}^{r} u_ix_i$$

其微分形式为：

$$
\begin{align}
dg &= df - \sum_{i=1}^{r} u_idx_i - \sum_{i=1}^{r} x_idu_i \\
&= \sum_{i=1}^{r} x_idu_i + \sum_{i=r+1}^{k} u_idx_i
\end{align}
$$

从微分形式可见，函数$g=g(u_1,...u_r,x_{r+1},...x_k)$。

###几何含义

假设存在一个凹函数$f(x)$，其Legendre变换为$g(u)=f(x(u))-ux(u)$

##热力学函数

对于内能$U$，我们选取两个entensive量，熵$S$和体积$V$作为自变量，则内能函数为$U=U(S, V)$，其微分形式：
$$ dU(S, V) = TdS-pdV $$

其中$T$和$S$是共轭变量，$-p$和$V$是共轭变量。现在我们想将其中的变量$V$变换为其共轭变量$p$，于是有：

$$H \equiv U(S, V)-(-pV) $$

其微分形式为：

$$ dH = dU(S, V)+pdV+Vdp = TdS+Vdp $$

可见定义的新函数$H=H(S, p)$。

###能量最低

根据Legendre变换的几何含义，
