---
title: state functions and master equations
tags: [state functions, Laplace transform, Z transform, master equations, law of mass action]
---

In chemistry, the law of mass action states that the reaction rates are proportional to the product of reactants' concentrations. Here I'm trying to investigate the similarity between state space in the control theory and master equations in stochastic reactions, which would converge to the law of mass action at the thermodynamic ensemble limit.

<!-- more -->

## Continuous ##

### State space ###

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

Assuming $\boldsymbol{x}(0)=\boldsymbol{0}$, we can get the transfer function in $s$-domain from $U(s)$ to $Y(s)$ by transforming the state-space representation Eqs. $\eqref{state}$ and $\eqref{output}$,
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

### Master equation ###

Let's consider a reaction network in closed system under equilibrium,
```tikz
\usetikzlibrary{arrows.meta}
\begin{document}
\begin{tikzpicture}
\node (X) {\Large $x_i$};
\node [xshift=2cm] (Y) {\Large $x_j$};
\draw [arrows={-Stealth[left]}] (X) to [bend left=5] node [midway, above] {\large $k_{ij}$} (Y);
\draw [arrows={-Stealth[left]}] (Y) to [bend left=5] node [midway, below] {\large $k_{ji}$} (X);
\end{tikzpicture}
\end{document}
```

the master equations is given by,
$$
\dot{\boldsymbol{x}} = \boldsymbol{A} \boldsymbol{x}
$$
where $\boldsymbol{x} = [x_1, ..., x_n]^T$ is the concentration matrix and $A$ is the kinetic matrix given by,
$$
\boldsymbol{A} =
\begin{bmatrix}
-\sum_{i \neq 1} k_{1i} & k_{21} & \cdots & k_{n1} \\
k_{12} & -\sum_{i \neq 2} k_{2i} & \cdots & k_{n2} \\
\vdots & \vdots & \ddots & \vdots \\
k_{1n} & k_{2n} & \cdots & -\sum_{i \neq n} k_{ni} \\
\end{bmatrix} 
$$

## References ##

1. Qian, Hong. "Open-system nonequilibrium steady state: statistical thermodynamics, fluctuations, and chemical oscillations." The Journal of Physical Chemistry B 110.31 (2006): 15063-15074.
