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

For inhomogeneous linear ODE,
$$
\sum_{i=0}^n a_i y^{(n)} = f(t)
$$

where $f(t) \neq 0$. First we need to find general solutions $y_g$ for the corresponding homogeneous linear ODEs. Then we can use undetermined coefficients to find particular solutions $y_p$ for different $f(t)$. So the final solution for the inhomogeneous linear ODE is the linear combination of $y_g$ and $y_p$ because,
$$
\begin{align*}
        \sum_{i=0}^n a_i (C_g y_g + y_p)^{(n)} &= \sum_{i=0}^n a_i C_g y_g^{(n)} + \sum_{i=0}^n a_i y_p^{(n)} \\
        &= 0 + f(t) \\
        &= f(t) \\
\end{align*}
$$
There are different type of $f(t)$ and corresponding forms of particular solutions,

$$ \text{Table 1 undetermined coefficient form} $$
$$ \begin{array}{ll}
\hline
f(t) & y_p(t) \\
\hline
\alpha \exp(\beta t) & A \exp(\beta t) \\
\alpha \cos(\beta t) & A \cos(\beta t) + B \sin(\beta t) \\
\alpha \sin(\beta t) & A \cos(\beta t) + B \sin(\beta t) \\
\sum_{i=0}^n \alpha_i x^i & \sum_{i=0}^n A_i x^i \\
\exp(\beta t) \sum_{i=0}^n \alpha_i x^i & \exp(\beta t) \sum_{i=0}^n A_i x^i \\
\hline
\end{array} $$

Although we can solve these ODEs, it's too tedious and tricky to understand the method for solving differential equations systematically. Fortunately, Laplace transform can give a better explanation.

## Laplace transform ##

A transform is a mapping of a function from one domain to another. The Laplace transform is defined as, 
$$
G(s) = \mathscr{L}[g(t)] = \int_0^{\infty} g(t) \exp(-st) \,dt
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
By applying the above property to $g(t)$ and $\int_0^t g(\tau) \,d\tau$, we have the Laplace transform of integral,
$$
\mathscr{L}[\int_0^t g(\tau)\,d\tau] = \frac{1}{s} \mathscr{L}[g(t)]
$$
Also, we can treat $\int_0^t g(\tau)\,d\tau$ as the convolution $\int_{0}^{\infty} u(t-\tau) g(\tau)\,d\tau$, where $u(t)$ is the *Heaiside step function*,
$$
u(t) = \begin{cases}
        0, & t \lt 0 \\
        1, & t \geq 0 \\
\end{cases}
$$
Besides, the Laplace transform of Heaiside step functino is,
$$
\mathscr{L}[u(t)] = \int_0^{\infty} \exp(-st)\,dt = -\frac{1}{s} \exp(-st)|_0^{\infty} = \frac{1}{s}
$$
Therefore, similar to Fourier transform, the Laplace transform of convolution is equal to the product of their respective Laplace transforms,
$$
\mathscr{L}[g(t)*f(t)] = \mathscr{L}[g(t)] \cdot \mathscr{L}[f(t)]
$$

### Laplace transform of ODEs ###

For simplicity, let's consider a second order ODE,
$$
y'' + p y' + q y = f(t)
$$
with the initial condition $y(0)=y_0$ and $y'(0)=y_1$.

[List of Laplace transform of common functions](https://en.wikipedia.org/wiki/List_of_Laplace_transforms#Table)

## References ##

1. [section 3: Laplace transforms & transfer functions](https://web.engr.oregonstate.edu/~webbky/ESE499_files/)
