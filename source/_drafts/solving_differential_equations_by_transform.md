---
title: Solving differential equations by transforms
tags: [transformation, Fourier transform, Laplace transform, differential equaiton, Green's function]
---

## Solving ODE in hard way ##

### homogeneous linear ODE ###

Let's start with the following homogeneous ODE,
$$
\sum_{i=0}^n a_i y^{(n)} = 0
$$
To solve such the differential equation, we can assume the solution will be the form $y(t)=\exp(rt)$ and substitute it into the ODE,
$$
\exp(rt) \cdot \sum_{i=0}^{n} a_n r^n = 0
$$
In order for the above eqaution to be zero we need to require the auxiliary polynomial equation to be zero,
$$
\sum_{i=0}^n a_i r^n = 0
$$
According to the roots, we have

1. **roots are all different and real**

Suppose roots for the auxiliary polynomial equaiton are $r_i\,(i=1,2,...,n)$, the solution $y(t)$ is the linear combination of individual solution,
$$
y(t) = \sum_{i=1}^n C_i \exp(r_i t)
$$

2. **roots are real but some are duplicated**

Suppose the duplicated roots are $r$ with the multiplicity $k$ and other roots are $r_i$, the solution $y(t)$ is the linear combination,
$$
y(t) = \sum_{i=1}^{n-k} C_i \exp(r_i t) + \sum_{j=1}^k C_j t^{j-1} \exp(r t)
$$

3. **some roots are complex**

If the roots $r=\lambda \pm \mu i$ are complex with multiplicity $k$, the solution $y(t)$ is the set of solutions,
$$
\begin{align*}
        \exp((\lambda + \mu i) t) && t \exp((\lambda + \mu i) t) && ... && t^{k-1} \exp((\lambda + \mu i) t) \\
        \exp((\lambda - \mu i) t) && t \exp((\lambda - \mu i) t) && ... && t^{k-1} \exp((\lambda - \mu i) t) \\
\end{align*}
$$
The imaginary parts can be cancelled according to Euler's rule, so the solution $y(t)$ is a linear combination,
$$
y(t) = \sum_{i=1}^k t^{i-1} \exp(\lambda t) \big ( C_i \cos(\mu t) + C_i^{'} \sin(\mu t) \big )
$$

### inhomogeneous linear ODE ###


Although we can solve these ODEs, it's too tricky to understand the method for solving differential equations systematically. However, Laplace transform can give a better explanation.

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
