---
title: Solving differential equations by transforms
tags: [transformation, Fourier transform, Laplace transform, differential equaiton, Green's function, vector space, vector]
---

Ordinary differential equations (ODE) can be solved via roots of auxiliary equations or complement equations, but the rationale is not so clear in text books I read.

<!--more-->

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
\begin{equation}
\sum_{i=0}^n a_i r^n = 0 \label{auxiliary}
\end{equation}
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
\begin{equation}
\mathscr{L}[g(t)] = G(s) = \int_0^{\infty} g(t) \exp(-st) \,dt \label{laplace}
\end{equation}
$$
where $s=\sigma+i \omega$ is a complex variable.

### transform of derivatives ###


One of important properties of Laplace transform is to transform derivatives,
$$
\begin{align*}
        \mathscr{L}[\dot{g}(t)] &= \int_0^\infty \dot{g}(t) \exp(-st) \,dt \\
        \color{blue}{\text{[integration by parts]}} &= \exp(-st)g(t)|_{t=0}^\infty - (-s) \int_0^\infty g(t) \exp(-st) \,dt \\
        \color{blue}{\text{[integrable functions decay at infinity]}} &= s \int_0^\infty g(t) \exp(-st) \,dt - g(0) \\
        &= s \cdot G(s) - g(0) \\
\end{align*}
$$
In general, the Laplace transform of $n^{th}$ derivatives is,
$$
\begin{align}
\mathscr{L}[g^{(n)}]
&= s \cdot \mathscr{L}[g^{(n-1)}] - g^{(n-1)}(0) \\
&= s^n \cdot G(s) - \sum_{i=1}^{n} s^{i-1} \cdot g^{(n-i)}(0) \label{derivative} \\
\end{align}
$$

### convolution property ###

By applying the above property to $g(t)$ and $\int_0^t g(\tau) \,d\tau$, we have the Laplace transform of integral,
$$
\mathscr{L}[\int_0^t g(\tau)\,d\tau] = \frac{1}{s} \mathscr{L}[g(t)]
$$
Also, we can treat $\int_0^t g(\tau)\,d\tau$ as the convolution $\int_{0}^{\infty} u(t-\tau) g(\tau)\,d\tau$, where $u(t)$ is the *Heaviside step function*,
$$
u(t) = \begin{cases}
        0, & t \lt 0 \\
        1, & t \geq 0 \\
\end{cases}
$$
Besides, the Laplace transform of Heaviside step function is,
$$
\mathscr{L}[u(t)] = \int_0^{\infty} \exp(-st)\,dt = -\frac{1}{s} \exp(-st)|_0^{\infty} = \frac{1}{s}
$$
Therefore, similar to Fourier transform, the Laplace transform of convolution is equal to the product of their respective Laplace transforms,
$$
\begin{equation}
\mathscr{L}[g(t)*f(t)] = \mathscr{L}[g(t)] \cdot \mathscr{L}[f(t)] \label{convolution}
\end{equation}
$$

### Laplace transform of ODEs ###

For simplicity, let's consider a second order ODE,
$$
y'' + p y' + q y = f(t)
$$
with the initial condition $y(0)=y_0$ and $y'(0)=y_1$. Apply Laplace transform to both sides of the equation and we get,
$$
s^2 Y(s) - s \cdot y(0) - y'(0) + p (s \cdot Y(s) - y(0)) + q Y(s) = F(s)
$$
So the solution in $s$-domain is,
$$
\begin{equation}
Y(s) = \frac{F(s) + s \cdot y_0 + y_1 + p \cdot y_0}{s^2 + p \cdot s + q} \label{solution}
\end{equation}
$$
Next we need to decompose $Y(s)$ by *partial fraction expansion* so we can get $Y(s)$ as the linear combination of some typical Laplace transformed functions and eventually $y(t)$ by inverse Laplace transform. For example,
$$
Y(s) = \sum_{i=0}^{n} C_i \cdot Y_i(s) \\
y(t) = \sum_{i=0}^n C_i \cdot \mathscr{L}^{-1}[Y_i(s)]
$$

Here is the [List of Laplace transform of common functions](https://en.wikipedia.org/wiki/List_of_Laplace_transforms#Table).

### Partial fraction expansion ###

Similar to the auxiliary polynomial equation, there are three different scenarios according to the denominator,

1. roots are all different and real
2. roots are real but some are duplicated
3. some roots are complex

For the first scenario, we can get the coefficients of each term by multiplying the corresponding denominator and set the value to zero,
$$
\begin{align*}
        \prod_i \frac{f(s)}{(s - r_i)} &= \sum_i \frac{A_i}{s-r_i} = F(s) \\
        A_j &= (s-r_j) F(s) |_{s=r_i} \\
\end{align*}
$$
For the second scenario, besides the coefficients determined by the above methods, the additional coefficient from the repeated root is determined by the equvialence of the coefficient before the variable at the same order $n$,
$$
\begin{align*}
       f(s) &= \prod_i (s-r_i) F(s) \\
       f(s) &= \sum_n C_n s^n = \prod_i (s-r_i) F(s) = \sum_n C'_n s^n \\
       \iff C_n &= C'_n
\end{align*}
$$
For the third scenario, we can try to construct a homogeneous numerator, e.g.,
$$
F(s) = \frac{f(s)}{(s+\gamma)^2+\omega^2} \prod \frac{1}{(s-r_i)} = \frac{B(s+\gamma)+C\omega}{(s+\gamma)^2+\omega^2} + \sum_i \frac{A_i}{s-r_i}
$$
The coefficients can be found through comparing coefficients before varibales at the same order $n$ between both sides of the polynomial equation.


According to the Laplace transform of derivatives $\eqref{derivative}$, the denominator of $\eqref{solution}$ was only determined by coefficients of the ODE (here $p$ and $q$), and the roots of the denominator determine the form of partial fractions and thus the inverse Laplace transform. The numerator of $\eqref{solution}$ only affects coefficients $C_i$.

In fact, the denominator of $\eqref{solution}$ has the same form with the ODE's auxiliary equation $\eqref{auxiliary}$. So Laplace transform explains the tricky way to solve ODEs.

## Green's function ##

Another powerful way to solve ODEs is Green's function, which introduces the concept of infinte-dimensional vector space.

In general, $n$-dimensional vector can be expressed as,
$$
\boldsymbol{v} = \sum_{i=1}^n c_i \hat{\boldsymbol{e}}_i
$$
where $\boldsymbol{\hat{e}}_i$ is the unitary orthonormal vector. So the inner product of two vectors is,
$$
\left< \boldsymbol{v} \mid \boldsymbol{v}' \right> = \sum_{i=1}^n \sum_{j=1}^n c_i c_j' \left< \hat{\boldsymbol{e}}_i \mid \hat{\boldsymbol{e}}_j \right> = \sum_{i=1}^n c_i c_i'
$$
If we expand the $n$-dimensional space to infinite-dimensional space, the vector $\boldsymbol{v}$ can be represented by function $f(x)$. Namely, the discrete dimensions where $\hat{\boldsymbol{e}}_i$ stays become the continuous dimension where $x$ stays. So we can define the inner product of two functions,
$$
\left< f \mid f' \right> = \int_a^b f^*(x) f'(x) \,dx
$$
Therefore, a linearly independent and orthonormal functions $\hat{\phi}_n(x)$ can be used as the basis of an infinite-dimensional vector space of functions, which is called *Hilbert space*.

### sets of functions ###

If the function $f(x)$ is expressed in terms of an orthonormal basis $\hat{\phi}_n(x)$ as,
$$
f(x) = \sum_{n=0}^{\infty} c_n \hat{\phi}_n(x)
$$
then the cofficients $c_n$ are given by the inner product,
$$
c_n = \left \langle \hat{\phi}_n \mid f \right \rangle = \int_a^b \hat{\phi}_n^*(x) f(x) \,dx
$$
which is reminiscent of Fourier transform again.

### eigenfunctions ###

The inhomogeneous ODE can be expressed as,
$$
\begin{equation}
\mathcal{L} y(x) = f(x) \label{operator}
\end{equation}
$$
where $\mathcal{L}$ stands for a linear differential operator acting upon the function $y(x)$.

The eigenfunction $y_i(x)$ of $\mathcal{L}$ exists, it should satisfies,
$$
\begin{equation}
\mathcal{L} y_i(x) = \lambda_i y_i(x) \label{eigenfunction}
\end{equation}
$$
which is an homogeneous ODE and can be solved by Laplace transform.

### superposition of eigenfunctions ###

Now we concern the full solution $y(x)$ as a superposition of eigenfunctions $y_i(x)$ of $\mathcal{L}$,
$$
y(x) = \sum_{i=0}^{\infty} c_i y_i(x)
$$
where the operator $\mathcal{L}$ should be Hermitian operator and thus the eigenfunctinos $y_i(x)$ are orthogonal and complete.

Substituting the above $y(x)$ into the differential equation $\eqref{operator}$,
$$
f(x) = \mathcal{L} \left( \sum_{i=0}^{\infty} c_i y_i(x) \right) = \sum_{i=0}^{\infty} c_i \lambda_i y_i(x)
$$
Considering that eigenfunctions $y_i(x)$ are orthogonal,
$$
\left< y_j^* \mid f \right> = \sum_{i=0}^{\infty} c_i \lambda_i \left< y_j^* \mid y_i \right> = c_j \lambda_j \left| y_j \right|^2
$$
So we obtain the coefficients before eigenfunctions,
$$
c_j = \frac{1}{\lambda_j} \frac{ \left< y_j^* \mid f \right> }{ |y_j(x)|^2 }
$$
If we use normalized eigenfunctions $|\hat{y}_i(x)|^2=1$, the full solution $y(x)$ is,
$$
\begin{align*}
y(x)
&= \sum_{j=0}^{\infty} \frac{ \left< \hat{y}_j^* \mid f \right> }{\lambda_j} \hat{y}_j(x) \\
\color{blue}{ \text{[interchange summation and integration]} }&= \int_a^b \left\{ \sum_{j=0}^{\infty} \left[ \frac{\hat{y}_j(x) \hat{y}_j^*(z)}{\lambda_j} \right] \right\} f(z) \,dz \\
&= \int_a^b G(x,z) f(z) \,dz \\
\end{align*}
$$
where $G(x,y)=\sum_{j=0}^{\infty} \left[ \frac{1}{\lambda_j} \hat{y}_j(x) \hat{y}_j^*(z) \right]$ is the *Green's function*. So the full solution $y(x)$ has the form of an integral transform where the Green's function is the kernel.

## References ##

1. [section 3: Laplace transforms & transfer functions](https://web.engr.oregonstate.edu/~webbky/ESE330_files/Section%205%20Laplace%20Transforms.pdf)
2. Riley, Kenneth Franklin, Michael Paul Hobson, and Stephen John Bence. "Mathematical methods for physics and engineering." (1999): 165-169.
