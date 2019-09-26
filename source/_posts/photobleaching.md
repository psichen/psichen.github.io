---
title: 荧光猝灭的原理与避免方法
date: 2019-09-25 09:28:15
tags: [fluorescence, bleaching]
mathjax: true
---

荧光染料分子被激发后，会从ground state(S<sub>0</sub>)变到first excited singlet state (S<sub>1</sub>)，之后会包含以下几个过程：

1. 重新回到S<sub>0</sub>，并在ns的时间尺度内发出fluorescence
2. 经过inter-system crossing弛豫到first excited triplet state (T<sub>1</sub>)，并在μs的时间尺度内发出phosphorescence
3. 如果存在FRET，则会将能量传递给acceptor,令acceptor从S<sub>0</sub>到S<sub>1</sub>,然后acceptor染料同样也会经历相同的弛豫过程

染料分子达到triplet state或发生猝灭，都会降低光子产生速率，对成像、荧光单分子检测，特别是对快过程的研究都会造成影响。

##猝灭原理

###化学因素
当染料处于S<sub>1</sub>时，其化学活性较高，容易与溶液中的singlet oxygen或自由基发生反应，造成染料化学结构改变，从而发生荧光猝灭，永久失去发光能力。

###光物理因素

在较低的激发光强下，染料只经历three-level体系(S<sub>0</sub>, S<sub>1</sub>, T<sub>1</sub>)，而在较高激发光强下(> ~70 kW/cm<sup>2</sup>)，染料经历five-level体系(S<sub>0</sub>, S<sub>1</sub>, T<sub>1</sub>, S<sub>n</sub>, T<sub>n</sub>)<sup>1</sup>。

<%- img https://wx2.sinaimg.cn/mw690/007XD662ly1g7d73m1jh5j30er0aujrj.jpg 'three/five-level system' %>

处于第一激发态的染料(S<sub>1</sub>或T<sub>1</sub>)，还可吸收短波长的激光光子，进一步被激发到更高的能级(S<sub>n</sub>或T<sub>n</sub>)，从而增大染料猝灭的概率<sup>2</sup>。

###猝灭概率singlet > triplet

通过不同调控频率的ALEX激光，来研究染料singlet和triplet的猝灭概率<sup>2</sup>。

当ALEX激光的频率在ns尺度时，正好落在荧光寿命的时间尺度。红光先对acceptor染料分子激发，在ns尺度的延迟之后，蓝光进行激发，此时acceptor荧光分子处于S<sub>1</sub>，吸收蓝光光子，进一步激发到更高能级(S<sub>n</sub>或T<sub>n</sub>)，发生猝灭，荧光信号降低。当延迟时间超过ns尺度后，acceptor的荧光信号得到恢复。

<%- img https://wx1.sinaimg.cn/mw690/007XD662ly1g7d73mulg9j30cw0aqmz4.jpg ns-delay %>

当ALEX的延迟时间在μs尺度时，此时染料分子应处于triplet state，而荧光信号改变不大。说明在smFRET中，猝灭主要是由acceptor染料的S<sub>1</sub>吸收短波长的光子带来的，可见染料猝灭的很大一部分原因，都是因为singlet state不能稳定地弛豫到ground state。

<%- img https://wx1.sinaimg.cn/mw690/007XD662ly1g7d73oe4igj30d10abgn2.jpg us-delay %>

##影响

如果荧光分子的猝灭时间尺度和分子在confocal显微镜的聚焦体积内的扩散时间相当的话（~ 10<sup>2</sup> μs)，那么single-molecule FRET的分布会有拖尾，因为分子在聚焦体积内，acceptor猝灭，此时donor仍发光，造成表观的FRET效率减小<sup>2</sup>，**拖尾有时容易让人误以为是新组分的存在。**

<%- img https://wx1.sinaimg.cn/mw690/007XD662ly1g7d73ner5yj30t70db0vg.jpg 'FRET trailing' %>

##解决方法

###除氧+Trolox
常用的除氧体系是葡萄糖+葡萄糖氧化酶+过氧化氢酶。然而氧气是非常高效的triplet quencher，因此将氧气除去后，需要再加入Trolox作为染料的triplet quencher。该配方一般用于表面固定的实验，减少荧光染料blinking和bleaching的概率。

###Trolox cocktail

2010年的一篇Nature methods指出，buffer不除氧而是添加10 mM半胱胺($\ce{ NH2-CH2-CH2-SH }$)和1 mM Trolox，其中半胱胺作为singlet oxygen和自由基的quencher，Trolox作为染料triplet quencher，可以大大增加染料的光子产生速率<sup>3</sup>，单分子FRET实验可以达到50 μs的时间分辨率<sup>4</sup>。

<%- img https://wx1.sinaimg.cn/mw690/007XD662ly1g7d73nt3hpj309y08b752.jpg 'Trolox cocktail' %>

##references

1. Eggeling, Christian, et al. "Photobleaching of fluorescent dyes under conditions used for single-molecule detection: Evidence of two-step photolysis." Analytical chemistry 70.13 (1998): 2651-2659.
2. Kong, Xiangxu, et al. "Photobleaching pathways in single-molecule FRET experiments." Journal of the American Chemical Society 129.15 (2007): 4643-4654
3. Campos, Luis A., et al. "A photoprotection strategy for microsecond-resolution single-molecule fluorescence spectroscopy." Nature methods 8.2 (2011): 143.
4. Liu, Jianwei, et al. "Exploring one-state downhill protein folding in single molecules." Proceedings of the National Academy of Sciences 109.1 (2012): 179-184.
