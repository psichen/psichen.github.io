---
title: notes about complex analysis
tags: [complex analysis]
---

For the analytic complex function,
$$
f(z) = u + v i
$$
where $z=x + y i$, $u=u(x,y)$ and $v=v(x,y)$.

### Cauchy-Riemann conditions ###

$$
\begin{align*}
        \frac{\partial u}{\partial x} &= \frac{\partial v}{\partial y}  \\
        \frac{\partial v}{\partial x} &= - \frac{\partial u}{\partial y}  \\
\end{align*}
$$

According to the Green's theorem,
$$
\oint_{C} L \, dx + M \, dy = \iint_{D} (\frac{\partial M}{\partial x} - \frac{\partial L}{\partial y} ) \, dxdy
$$
the circular integral of an analytic complex function is given by,
$$
\oint_{C} f(z) \, dz = 0
$$
because of the Cauchy-Riemann conditions.

### Cauchy's integral formula ###

$$
f(a) = \frac{1}{2 \pi i} \oint_{\gamma} \frac{f(z)}{z-a} \, dz
$$

### Cauchy's differentiation formula ###

$$
f^{(n)}(a) = \frac{n!}{2 \pi i} \oint_{\gamma} \frac{f(z)}{(z-a)^{n+1}} \, dz
$$

### Laurent series ###
$$
f(z) = \sum_{n=-\infty}^{\infty} a_n (z-c)^n
$$
where $a_n$ is given by,
$$
a_n = \frac{1}{2 \pi i} \oint_{C} \frac{f(z)}{(z-c)^{n+1}} \, dz
$$

### Residue theorem ###
$$
\oint_{C} f(z) \, dz = 2 \pi i \sum_{k=1}^{n} \text{Res}(f, a_k)
$$
where the Residue at $a_k$ is given by,
$$
\text{Res}(f, a_k) = \frac{1}{2 \pi i} \oint_{C} f(z) \, dz
$$
