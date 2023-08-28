---
title: Solving differential equations by transforms
tags: [transformation, Fourier transform, Laplace transform, differential equaiton, Green's function]
---

## Laplace transform ##

A transform is a mapping of a function from one domain to another. The Laplace transform is defined as, 
$$
F(s) = \mathscr{L}[f(t)] = \int_0^{\infty} f(t) \exp(-st) \,dt
$$
where $s=\sigma+i \omega$ is a complex variable.

One of important properties of Laplace transform is to transform derivatives,
$$
\begin{align*}
        \mathscr{L}[\dot{g}(t)] &= \int_0^\infty \dot{g}(t) \exp(-st) \,dt \\
        \color{blue}{\text{[integration by parts]}} &= \exp(-st)g(t)|_{t=0}^\infty - (-s) \int_0^\infty g(t) \exp(-st) \,dt \\
        \color{blue}{\text{[integrable functions decay at infinity]}} &= s \int_0^\infty g(t) \exp(-st) \,dt - g(0) \\
        &= s \cdot \mathscr{L}[g(t)] - g(0) \\
\end{align*}
$$
In general, the Laplace transform of $n^{th}$ derivatives is,
$$
\mathscr{L}[g^{(n)}] = s \cdot \mathscr{L}[g^{(n-1)}] - g^{(n-1)}(0) \\
\Big \downarrow \\
\mathscr{L}[g^{(n)}] = s^n \cdot \mathscr{L}[g] - \sum_{i=1}^{n} s^{i-1} \cdot g^{(n-i)}(0) \\
$$
