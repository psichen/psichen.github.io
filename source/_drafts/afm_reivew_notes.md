---
title: AFM review notes
tags: [AFM]
---

## natural/damped frequency of oscillation ##

If an oscillation system is damped, the damped term will bring to an exponential decay term in the output function in time domain.

|time domain|Laplace $s$-domain|
|---|---|
|$\sin(\omega t) \cdot u(t)$|$\omega / (s^2 + \omega^2)$|
|$\cos(\omega t) \cdot u(t)$|$s / (s^2 + \omega^2)$|
|$\exp(-\alpha t) \sin(\omega t) \cdot u(t)$|$\omega / \big((s+\alpha)^2 + \omega^2\big)$|
|$\exp(-\alpha t) \cos(\omega t) \cdot u(t)$|$s / \big((s+\alpha)^2 + \omega^2\big)$|

In general, an oscillation system in Laplace $s$-domain is,
$$
F(s) = \frac{A}{(s+\alpha)^2 + \omega_d^2} = \frac{A}{s^2 + 2 \alpha s + \alpha^2 + \omega_d^2}
$$
We can also rewrite it as,
$$
F(s) = \frac{A}{s^2+2 \zeta \omega_n s + \omega_n^2}
$$
where $\zeta = \frac{\alpha}{\omega_n}$ is the damping ratio and $\omega_d = \omega_n \sqrt{1-\zeta^2}$. The poles are $s = -\zeta \omega_n \pm \omega_n \sqrt{\zeta^2 - 1}$ and now it's easy to classify the dynamics of oscillation based on $\zeta$,

|$\zeta$|Laplace $s$-domain|time domain|poles|class|
|---|---|---|---|---|
|0|$A / (s^2+\omega_n^2)$|$B \sin(\omega_n t) \cdot u(t)$|two pure, conjugated imaginary roots|undamped|
|(0,1)|$A / \big( (s+\alpha)^2 + \omega_d^2 \big)$|$B \exp(-\alpha t) \sin(\omega_d t) \cdot u(t)$|two conjugated complex roots|under damped|
|1|$A / (s+\omega_n)^2$|$B t \exp(-\omega_n t) \cdot u(t)$|two identical real roots|critically damped|
|(1,$+\infty$)|$A / \big( (s+\sigma_1)(s+\sigma_2) \big)$|$B\exp(-\sigma_1 t)+C\exp(-\sigma_2 t)$|two different real roots|over damped|

## Contact mode AFM ##

```tikz
\usepackage{tikz}
\usetikzlibrary{patterns}
\usepackage{circuitikz}
\begin{document}
\begin{tikzpicture}
\node (M) at (0,0) [draw, minimum width=3.6cm, minimum height=2cm] {$m$};
\draw [pattern=north east lines] (-2,4) rectangle ++(4,.2);
\draw ($(M.north west)+(1, 3)$) to[spring, l_=$k$] ++(0,-3);
\draw ($(M.north east)+(-1, 3)$) to[damper, l^=$b$] ++(0,-3);
\draw ($(M.south west)+(1, 0)$) to[spring, -*, l_=$k_s$] ++(0,-3);
\draw [thick, Latex-] ($(M.south east)+(-1, 0)$) -- ++(0,-2.4) node [midway, right] {$F_0$};
\draw [] ($(M.north east)+(.4,0)$) -- ($(M.north east)+(1,0)$);
\draw [-Latex] ($(M.north east)+(1,0)$) -- ++(0,1) node [midway, right] {$z$};
\draw [] ($(M.south west)+(1.4,-3)$) -- ($(M.south east)+(1,-3)$);
\draw [-Latex] ($(M.south east)+(1,-3)$) -- ++(0,1) node [midway, right] {$s(x)$};
\end{tikzpicture}
\end{document}
```

$$
\begin{equation}
m \ddot{z} = -b \ddot{z} - (k+k_s) z + k_s B \sin(\frac{2\pi \dot{x} t}{\lambda}) + F_0
\label{CM-AFM}
\end{equation}
$$
where $x$ and $z$ are lateral and vertical positions of the tip, $\dot{x}$ represents the scaning spped, $\lambda$ is sample spatial frequency, $m$, $k$ and $b$ are mass, stiffness and dumping coefficient of the cantilever, $k_s$ is the sample stiffness and $F_0$ is exteral force.

The equation $\eqref{CM-AFM}$ can be solved generally by [Laplace transform](https://psichen.github.io/2023/09/01/solving-differential-equations-by-transform/), and the solution is,

## References ##
1. [Yang, Chen, et al. "High-speed atomic force microscopy in ultra-precision surface machining and measurement: challenges, solutions and opportunities." Surface Science and Technology 1.1 (2023): 7.](https://link.springer.com/article/10.1007/s44251-023-00006-5)
2. [A system dynamics approach to user independence in high speed atomic force microscopy](https://dspace.mit.edu/handle/1721.1/61594)
