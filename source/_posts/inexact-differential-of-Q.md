---
title: 热力学中热量的非恰当微分
date: 2019-10-13 10:27:58
tags: [thermodynamics, inexact differential, integrating factor, entropy, temperature]
mathjax: true
---
热力学中都会提到，热量$Q$不是一个恰当微分，写为$\delta Q$，这是因为$\delta Q$的积分和积分路径有关，也就是说对于两条起点和终点都是$A$和$B$，但是中间过程不同的路径$L_1$和$L_2$而言，有：

$$ \int_{L_1} \delta Q \neq \int_{L_2} \delta Q $$

类似的，体积功$\delta W$的积分也与路径有关，这一点很好理解。假设有2个过程A, B：

![path function](http://muchongimg.xmcimg.com/data/bcs/2014/0701/w108h1175073_1404207867_483.jpg#opennewwindow)

由于$W=\int PdV$，曲线A, B下方与x轴形成的面积即对应的体积功，很容易看出：

$$ W_A \neq W_B $$

在没有非体积功的情况下，系统都是从状态1 $(P_1, V_1)$到状态2 $(P_2, V_2)$。因此状态函数内能的改变量$\Delta U$应相等。根据热力学第一定律：

$$ \Delta U = Q-W $$

所以$ Q_A \neq Q_B $。

##积分因子

对于非恰当微分方程

$$ du = Pdx + Qdy $$

其中$ \frac{\partial P}{\partial y} \neq \frac{\partial Q}{\partial x} $，若存在一个函数$ \mu(x, y) \neq 0 $，使得$ \mu Pdx + \mu Qdy = 0 $成为全微分方程，即满足：

$$ \frac{\partial (\mu P)}{\partial y} = \frac{\partial (\mu Q)}{\partial x} $$

则称$\mu$为方程$du$的积分因子。

所以我们现在来找$ \delta Q $的积分因子。设想由2个物体组成的孤立体系，2个物体之间有热接触，因此温度均为$t$（经验温度），设想一个状态函数$\sigma$，用于表示系统所处的状态。在**绝热可逆**过程中：

$$
\begin{align}
\delta Q_1 &= \tau_1(\sigma_1, t)d\sigma_1 \nonumber \\
\delta Q_2 &= \tau_2(\sigma_2, t)d\sigma_2 \nonumber \\
\delta Q &=  \tau(\sigma, t)d\sigma \nonumber \\
\tau(\sigma, t)d\sigma &= \tau_1(\sigma_1, t)d\sigma_1 + \tau_2(\sigma_2, t)d\sigma_2 \nonumber \\
\end{align}
$$

其中$1/\tau_1, 1/\tau_2, 1/\tau$为我们要找的积分因子。我们将$\sigma_1, \sigma_2, t$视为独立变量，分别对$\sigma$求导，有：

$$
\begin{align}
\frac{\partial \sigma}{\partial \sigma_1} &= \frac{\tau_1}{\tau} \nonumber \\
\frac{\partial \sigma}{\partial \sigma_2} &= \frac{\tau_2}{\tau} \nonumber \\
\frac{\partial \sigma}{\partial t} &= 0 \nonumber \\
\end{align}
$$

可见$\sigma$不是$t$的函数，因为$\sigma$是状态函数，具有全微分的性质，所以二阶导数与微分的顺序无关，所以

$$ \frac{\partial}{\partial t}\left(\frac{\partial \sigma}{\partial \sigma_1}\right) = \frac{1}{\tau^2} (\tau \frac{\partial \tau_1}{\partial t}-\tau_1\frac{\partial \tau}{\partial t}) = 0 $$
$$ \frac{1}{\tau} \frac{\partial \tau}{\partial t} = \frac{1}{\tau_1} \frac{\partial \tau_1}{\partial t} $$

同理，

$$ \frac{1}{\tau} \frac{\partial \tau}{\partial t} = \frac{1}{\tau_2} \frac{\partial \tau_2}{\partial t} $$

所以

$$ \frac{1}{\tau} \frac{\partial \tau}{\partial t} = \frac{1}{\tau_1} \frac{\partial \tau_1}{\partial t} = \frac{1}{\tau_2} \frac{\partial \tau_2}{\partial t} $$

因为$ \tau_1 = \tau_1(\sigma_1, t) $，并不含有$\sigma_2$，同理$ \tau_2 = \tau_2(\sigma_2, t) $，并不含有$\sigma_1$，所以上面等式成立的条件为等式各方只是$t$的函数，而与$\sigma_1, \sigma_2$无关，将该函数设为$g(t)$，于是

$$ \tau_i = e^{\int g(t)dt}h_i(\sigma_i), (i = 1, 2)$$
$$ \tau = e^{\int g(t)dt}h(\sigma_1, \sigma_2) $$

###温度定义（之一）
令绝对温度$ T = C \cdot e^{\int g(t)dt} $，该函数只与经验温度$t$有关，常数$C$可通过人为指定来固定（如水的沸点和凝固点之间平均划分为100份）。将$\tau_i$代入$\delta Q_i$的公式，有

$$ \delta Q_i = T \frac{h_i(\sigma_i)}{C} d\sigma_i, (i=1, 2) $$

###熵定义（之一）
令$dS_i = \frac{h_i(\sigma_i)}{C} d\sigma_i$，只依赖于状态函数$\sigma_i$，因此$S_i$也是一个状态函数，所以这就找到了非恰当微分$\delta Q$的积分因子：

$$ \frac{\delta Q_i}{T} = dS_i $$

对于有热接触的2个物体：

$$ \delta Q = \delta Q_1 + \delta Q_2 = T(dS_1 + dS_2) = TdS $$

即可逆过程的热力学第二定律数学式。

##References
1. 黄子卿. "热力学第二定律从物理说法导出数学说法." 化学通报 5 (1974): 56-59.
