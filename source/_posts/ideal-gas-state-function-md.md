---
title: 理想气体状态方程的统计力学推导
date: 2020-01-19 19:52:15
tags: [ideal gas, statistic mechanics, phase space]
mathjax: true
---

理想气体状态方程$$pV = nRT = Nk_BT $$想必大家已经非常熟悉了。下面记一下如何从统计力学的角度推出理想气体状态方程。

## 系综
一定条件下体系可能存在的状态的集合称之为ensemble（系综），是系统状态的概率分布，可与概率空间进行类比。

**canonical ensemble（正则系综）**
可与大热源交换能量的体系集合，各体系具有相同**温度**

**grand canonical ensemble（巨正则系综）**
可与大热源交换能量和与大粒子源交换粒子的体系集合，各体系具有相同的**温度**和**化学势**

**microcanonical ensemble（微正则系综）**
能量和粒子守恒的孤立系统，各体系状态**等概率**

## 相空间
一个包含$N$个粒子的系统具有$6N$的自由度，其中由位置$\mathbb Q$组成的$3N$维空间称之为configuration space（构形空间），由动量$\mathbb P$组成的$3N$维空间称之为momentum space（动量空间）,由$(\mathbb P, \mathbb Q)$组成的$6N$维空间称之为phase space（相空间）。

### Heaviside函数
Heaviside函数，也称为阶跃函数，其定义为：
$$
\Theta(x) =
\begin{cases}
1, & x \ge 0 \\
0, & x \lt 0
\end{cases}
$$

当$\Theta$函数作用于一个检验函数$\psi(x)$时，等于如下积分：

$$ \int_{-\infty}^{+\infty} \Theta(x) \psi(x) dx = \int_0^{+\infty} \psi(x) dx $$

另外

### 相空间体积
对于能量处于$(E, \delta E)$的系统，相空间的体积可由下面的积分给出：

$$ \Omega(E) \delta E = \int_{E<\mathcal H (\mathbb P, \mathbb Q) < E+\delta E} d\mathbb P d\mathbb Q $$

##理想气体状态方程

$$ \Omega(E) = V^N \cdot \frac{ \frac{3N}{2E} \pi^{\frac{3N}{2}} (2mE)^{3N} }{ (\frac{3N}{2})! } $$
$$ S = k_B ln\Omega(E) $$
$$ \frac{1}{T} = \frac{\partial S}{\partial E}|_{V, N} $$
$$ \frac{p}{T} = \frac{\partial S}{\partial V}|_{E, N} $$
$$ pV = Nk_BT $$
