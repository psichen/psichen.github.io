---
title: Notes about complex analysis
tags:
  - complex analysis
date: 2024-03-23 12:05:25
---


For a complex function,
$$
f(z) = u + v i
$$
where $z=x + y i$, $u=u(x,y)$ and $v=v(x,y)$.

## Cauchy-Riemann relations ##

if the complex function $f(z) = u + vi$ is analytic, then the necessary condition is given by,
$$
\begin{align*}
        \frac{\partial u}{\partial x} &= \frac{\partial v}{\partial y}  \\
        \frac{\partial v}{\partial x} &= - \frac{\partial u}{\partial y}  \\
\end{align*}
$$
which is known as the Cauchy-Riemann relations.

### Harmonicity ###

By differentating the Cauchy-Riemann relations with respect to independ variables, we can get the harmonicity of analytic complex function,
$$
\nabla^2 u = \nabla^2 v = 0
$$
which means the second-order derivatives of real part or imaginary parts on $x$- and $y$-dimensions have opposite signs, if they are not equal to zero. It's useful in the saddle approximation.

### Cauchy's theorem ###

According to the Green's theorem,
$$
\oint_{C} L \, dx + M \, dy = \iint_{D} (\frac{\partial M}{\partial x} - \frac{\partial L}{\partial y} ) \, dxdy
$$
with the analytic complex function $f(z) = u + vi$, the circular integral of an analytic complex function is given by,
$$
\oint_{C} f(z) \, dz = 0
$$
due to the Cauchy-Riemann conditions, if $f'(z)$ is continuous at each point within and on a closed contour $C$.

## Cauchy's integral formula ##

The value of an analytic function and its derivatives inside a closed contour $C$ is uniquely determined by its values on the contour,
$$
\begin{align*}
f(z_0) &= \frac{1}{2 \pi i} \oint_{C} \frac{f(z)}{z-z_0} \, dz \\
f^{(n)}(z_0) &= \frac{n!}{2 \pi i} \oint_{C} \frac{f(z)}{(z-z_0)^{n+1}} \, dz \\
\end{align*}
$$

### Liouville's theorem ###

From the Cauchy's integral formula, the inequality is given by,
$$
\begin{align*}
\mid f^{(n)}(z_0) \mid &= \frac{n!}{2 \pi} \mid \oint_{C} \frac{f(z)}{(z-z_0)^{n+1}} \, dz \mid \\
&\leq \frac{n!}{2 \pi} \frac{M}{R^{n+1}} 2 \pi R \\
&= \frac{M n!}{R^n}
\end{align*}
$$
Thus if $f(z)$ is analytic and bounded for all $z$ then $f$ is constant, because when $n=1$ and $R \to \infty$, $\mid f'(z_ n) \mid=0$.

## Laurent series ##

The Laurent series is an extension of the Taylor expansion,
$$
f(z) = \sum_{n=-\infty}^{\infty} a_n (z-z_0)^n
$$
where $z_0$ is a pole of $f(z)$ and $a_n$ is given by,
$$
a_n = \frac{1}{2 \pi i} \oint_{C} \frac{f(z)}{(z-z_0)^{n+1}} \, dz
$$
The terms with $n \geq 0$ are called the analytic part and the terms with $n \lt 0$ are called the principal part. The value of $a_{-1}$ is called the residue of $f(z)$ at the pole $z=z_0$.

### Residue theorem ###

By differentating both sides of Laurent series multiple times, we can get the coefficient before the term $(z-z_0)^{-1}$, *i.e.*, the residue,
$$
\text{Res}(z_0) = \lim_{z \to z_0} \left\{ \frac{1}{(m-1)!} \frac{d^{m-1}}{dz^{m-1}} [(z-z_0)^m f(z)] \right\}
$$
where $m$ is the order of poles. If $m=1$ and $f(z)$ has a form $g(z)/h(z)$, the residue is given by,
$$
\text{Res}(z_0) = g(z_0) \lim_{z \to z_0} \frac{z-z_0}{h(z)} = \frac{g(z_0)}{h'(z_0)}
$$
When there are singular points within the closed contour $C$,
$$
\sum_{k=1}^{n} \text{Res}(z_k) = \frac{1}{2 \pi i} \oint_{C} f(z) \, dz
$$
where the Residue at singularity $z_k$ is given by,
$$
\text{Res}(z_k) = \frac{1}{2 \pi i} \oint_{C'} f(z) \, dz
$$
Recall the Cauchy's integral theorem, if the closed contour $C$ doesn't contain singularities, then the Laurent series of $f(z)$ only have analytic part, so the residue $a_{-1}=\oint_{C}f(z)\,dz=0$,
