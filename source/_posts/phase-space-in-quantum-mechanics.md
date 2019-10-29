---
title: 量子力学里的相空间体积
date: 2019-10-29 10:08:07
tags: [phase space, quantum mechanics, operator, entropy, wave function]
mathjax: true
---

最近学到统计力学中熵的微观含义，恶补了一顿量子力学。起因是在统计力学中，熵$S$和相空间$\Gamma$的体积有关：

$$ S = k_Bln(|\Gamma|) $$

根据热力学第三定律（Nernst假设），温度趋于绝对零度时，任何系统的熵为0。所以热力学第三定律应该同时也规定了描述相空间体积的单位，否则当改变$\Gamma$的体积单位时，会在$S$加上一个常数，熵就不再为0了，与热力学第三定律矛盾。

##量子力学基础

###波函数

平面单色波函数：

$$ \psi_k(x,t) = Ae^{i(\boldsymbol k \cdot \boldsymbol r-\omega t)} $$

###波包

###群速度与相速度

等相位面$ kx-\omega t = const $，对时间求导可得相速度：$ \frac{dx}{dt} = \frac{\omega}{k} $

###算符

$$
\begin{align}
\hat {\boldsymbol r} &= r \nonumber \\
\hat {\boldsymbol p} &= i\hbar \boldsymbol \nabla \nonumber \\
\hat T &= -\frac{\hbar^2}{2m} \boldsymbol \nabla^2 \nonumber \\
\hat {\boldsymbol L} &= -i\hbar \hat {\boldsymbol r} \times \boldsymbol\nabla \nonumber \\
\end{align}
$$

###不确定关系

$$ \Delta \boldsymbol r \cdot \Delta \boldsymbol p \ge \hbar $$

###Fourier变换



###Dirac函数

##相空间体积
