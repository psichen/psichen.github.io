---
title: 热力学中热量的非恰当微分
date: 2019-10-13 10:27:58
tags: [thermodynamics, inexact differential, second law of thermodynamics, integrating factor, entropy]
mathjax: true
---
热力学中都会提到，热量$Q$不是一个恰当微分，写为$\delta Q$，这是因为$\delta Q$的积分和积分路径有关，也就是说对于两条起点和终点都是$A$和$B$，但是中间过程不同的路径$L_1$和$L_2$而言，有：

$$ \int_{L_1} \delta Q \neq \int_{L_2} \delta Q $$

这是由热力学第二定律所决定的。

##热力学第二定律表述

热力学第二定律是由大量的实验事实总结出来的定律，表述了一个孤立体系的总熵不会随着时间减少。热力学第二定律有两种最常见的表述：

Clausius表述：
>在一个循环过程中，热量不可能从低温热源传给高温热源，同时不使某量的功转化为热

Kelvin表述：
>在一个循环过程中，不可能将单一热源的热转变为功，同时没有热量从高温热源传递给低温热源

不同的表述之间是等价的。现在来说明为什么热量$Q$不是状态函数，而是与过程有关。

###熵增

###Carnot定律


##积分因子

$$ dS = \frac{\delta Q}{T} $$
$\frac{1}{T}$ 为 $\delta Q$的积分因子。

##References
1. 黄子卿. "热力学第二定律从物理说法导出数学说法." 化学通报 5 (1974): 56-59.
