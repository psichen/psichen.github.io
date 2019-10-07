---
title: 自由扩散的单分子FRET中的校正
date: 2019-09-30 19:09:27
tags: [fluorescence, single-molecule, FRET, correct, free-diffusing]
mathjax: true
---

荧光共振能量转移(Förster resonance energy transfer, FRET)是生化实验中的常见手段，一般用于检测生物大分子是否有相互作用、共定位或构象变化。

单分子FRET(single-molecule FRET, smFRET)将单分子超高时空分辨率的优势和FRET对距离变化的敏感性结合起来，是研究蛋白分子构象变化的有力武器。然而由于噪音、荧光染料自身性质和仪器检测效率等原因，我们只能得到表观的测量值，所以需要对其进行校正。

##背景噪音
背景噪音在时间分辨率$dt$的情形下，光子数的分布服从Poisson分布，$I_b \sim P(\lambda)$，其中$\lambda = r \cdot dt$，$r$为背景噪音的光子产生速率。首先需要对采集到的原始信号$I_D$和$I_A$扣除背景，对于背景噪音的拟合有三种办法。

###平均值法
将收集得到的单分子荧光trace直接求平均。由于一段荧光时间序列中的大部分都是噪音，所以直接求平均值（或给定一个阈值上限，排除掉由荧光分子产生的有效信号），就可近似地得到平均噪音水平。

###对噪音的光子数分布进行拟合
在一段单分子荧光trace中，噪音会一直存在，而荧光分子只有经过聚焦体积时才会发出荧光，所以对于一段合适的荧光trace，大部分信号应该都是噪音，所以其光子数分布应该为一开始一个很高的poisson分布，再叠加上很小一部分的指数分布，该指数分布是由于荧光染料分子进入聚焦体积发光而产生的，对于噪音的poisson分布影响很小。所以我们可以对光子数分布的前面部分（例如前80%）进行Poisson拟合，从而得到平均噪音水平。

###对噪音的光子寿命进行拟合
因为$I_b \sim P(\lambda)$，所以噪音光子的抵达时间的间隔$\tau_b \sim E(\lambda)$，可以通过时间相关单光子计数卡（time-correlated single photon counting, TCSPC）根据光子的间隔时间来区分背景噪音和有效信号。

因为Poisson分布和Exponential分布密切相关，所以本质上和对光子数分布进行拟合是一样的。

##漏光

Donor染料的发射光谱通常会有一部分和Acceptor通道的滤光片透光波段重叠，使得Acceptor通道可以检测到部分来自Donor的光子。这部分信号强度和Donor在Donor通道的信号强度呈正比，通常可以采用Donor-only的样品，检测其在两个通道的信号强度，然后做比得到Donor在Acceptor通道的漏光系数$c$。也可以在测量single-molecule FRET后，通过零峰的位置进行校正。因为漏光，校正前零峰不在FRET效率=0的位置，然而既然都叫零峰，其理论值=0，所以

##量子产率与接收效率

对量子产率$Q$和接收效率$\eta$的校正需要用到TIRF。在TIRF上

$$ \gamma_T = \frac{\Delta I_A}{\Delta I_D} $$

$$ E = (1+\gamma_c \frac{I_D}{I_A})^{-1} $$

其中$I_D$与$I_A$是校正了背景和漏光后的信号。

##直接激发

##Jacobi变换
