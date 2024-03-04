---
title: state functions and master equations
tags: [state functions, Laplace transform, Z transform, master equations, law of mass action]
---

In chemistry, the law of mass action states that the reaction rates are proportional to the product of reactants' concentrations. Here I'm trying to investigate the similarity between state space in the control theory and master equations in stochastic reactions, which would converge to the law of mass action at the thermodynamic ensemble limit.

<!-- more -->

## State space ##

For a linear time-invariant (LTI) and single input single output (SISO) system, the state-space representation is,
$$
\begin{align}
\dot{\boldsymbol{x}} =&  \boldsymbol{A} \boldsymbol{x} + \boldsymbol{B} u \label{state} \\
y =& \boldsymbol{C} \boldsymbol{x} + D u \label{output} \\
\end{align}
$$
where\
$\boldsymbol{x} = \boldsymbol{x}(t) \in \mathbb{R}^{n \times 1}$ is the state vector,\
$u = u(t) \in \mathbb{R}^{1}$ is the input signal,\
$y = y(t) \in \mathbb{R}^{1}$ is the output signal,\
$\boldsymbol{A} \in \mathbb{R}^{n \times n}$ is the state matrix,\
$\boldsymbol{B} \in \mathbb{R}^{n \times 1}$ is the input matrix,\
$\boldsymbol{C} \in \mathbb{R}^{1 \times n}$ is the output matrix,\
$D \in \mathbb{R}^{1}$ is the feedthrough,\
and the Eq $\eqref{state}$ is called the *state equation* and the Eq $\eqref{output}$ is called the *output equation*.

We can get the transfer function in $s$-domain from $U(s)$ to $Y(s)$ by transforming the state-space representation Eqs. $\eqref{state}$ and $\eqref{output}$,
$$
\begin{align*}
s \boldsymbol{X} &= \boldsymbol{A} \boldsymbol{X} + \boldsymbol{B} U \\
\boldsymbol{X} &= (s \boldsymbol{I} - \boldsymbol{A})^{-1} \boldsymbol{B} U = \boldsymbol{\Phi} \boldsymbol{B} U \\
\boldsymbol{Y} &= \big{(} \boldsymbol{C} \boldsymbol{\Phi} \boldsymbol{B}+ D \big{)} U \\
\end{align*}
$$
then we have the transfer function $H(s) \in \mathbb{C}^{1}$ in $s$-domain,
$$
\begin{equation}
H(s) = \boldsymbol{C} \boldsymbol{\Phi} \boldsymbol{B} + D \label{tf}
\end{equation}
$$
where $\boldsymbol{\Phi} = (s \boldsymbol{I} - \boldsymbol{A})^{-1}$ is called the *state transition matrix*.

## Z transform ##

Z transform can be considered as the discrete-time equivalent of the [Laplace transform](http://psichen.github.io/tags/Laplace-transform/). It's defined as,
$$
\begin{equation}
X(z) = \mathcal{Z}\{x[n]\} = \sum_{n=-\infty}^{\infty} x[n] z^{-n} \label{z-transform}
\end{equation}
$$
where $z$ is a complex variable. If we let $z=r \exp(i \omega)$ and let $r=1$, the Z-transform would degenerate to the discrete Fourier transform,
$$
X(\omega) = \mathcal{F} \{ x[n] \} = \sum_{n=-\infty}^{\infty} x[n] \exp(-i \omega n) \label{Fourier}
$$
Thus, the discrete Fourier transform is a specialized Z transform which is evaluated on the unit circle in the complex $z$ domain.

```tikz
\begin{document}
\begin{tikzpicture}
\draw [thick, ->] (-3,0) to ++(6,0) node [below] {\Large Re($z$)};
\draw [thick, ->] (0,-3) to ++(0,6) node [right] {\Large Im($z$)};
\draw [ultra thick] (0,0) circle [radius=2];
\draw [thick, dashed] (0,0) to ({2*cos(45)}, {2*sin(45)});
\draw [thick] (.5,0) arc (0:45:.5) node [midway, right] {\Large $\omega$};
\node at (2,-2) {\Large $|z|=1$};
\node at (0,-3.5) {\large unit circle};
\end{tikzpicture}
\end{document}
```

## References ##

1. Qian, Hong. "Open-system nonequilibrium steady state: statistical thermodynamics, fluctuations, and chemical oscillations." The Journal of Physical Chemistry B 110.31 (2006): 15063-15074.
