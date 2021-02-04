---
title: Geometric interpretation about Jacobian determinant
date: 2021-02-04 18:10:26
tags: [Jacobian, determinant, integration by substitution, cross product, infinitesimal area]
mathjax: true
---

In scientific computing, integration by substitution is a very common skill. [For example](https://www.psichen.com/2019/09/30/FRET-correcting/), we measured a series of practical values of a variable ($x'$), of which the distribution ($g(x')$) was unknown. But we know the theoretic distribution of the variable ($f(x)$) and the correction relationship or mapping relationship between theoretic and practical values ($x'=c(x)$). <!--more-->So we can get the analytic formula of the distribution $g(x')$ as following

$$ \int_{x' \in R'} g(x') dx' = \int_{x \in R} f(x) \frac{dx'}{dx} dx $$

This is the one dimension situation of Jacobian determinant in integration by substitution.

## Cross product for parallelogram area

Let's consider two vectors $\mathbf{a}^T = [a_1,a_2], \mathbf{b}^T = [b_1, b_2]$. We are very familar with the dot product or the inner product of the two vectors,

$$ \mathbf{a} \cdot \mathbf{b} = \mathbf{a}^T\mathbf{b} = a_1b_1+a_2b_2 $$

the name *inner* comes from the transpose symbol $T$ inside the two vectors. The inner product can also be calculated as

$$ \mathbf{a} \cdot \mathbf{b} = |\mathbf{a}||\mathbf{b}|\cos\theta $$

The cross product of two vectors generally produces a new vector which is perpendicular to the plane consist of the two original vectors. If $\mathbf{i}, \mathbf{j}, \mathbf{k}$ are orthogonal unitary vectors, they satisify the following relationship via cross product,

$$ \mathbf{i} \times \mathbf{j} = \mathbf{k} $$
$$ \mathbf{j} \times \mathbf{k} = \mathbf{i} $$
$$ \mathbf{k} \times \mathbf{i} = \mathbf{j} $$

So vectors $\mathbf{a}$ and $\mathbf{b}$ can be rewritten as $\mathbf{a} = a_1\mathbf{i}+a_2\mathbf{j}+0\mathbf{k}$ and $\mathbf{b} = b_1\mathbf{i}+b_2\mathbf{j}+0\mathbf{k}$. Thus

$$ \mathbf{a} \times \mathbf{b} = (a_1\mathbf{i}+a_2\mathbf{j}+0\mathbf{k}) \times (b_1\mathbf{i}+b_2\mathbf{j}+0\mathbf{k}) = (a_1b_2-a_2b_1)\mathbf{k} = \begin{vmatrix} a_1&a_2\\b_1&b_2 \end{vmatrix} \mathbf{k} $$

The magnitude of the cross product of two vectors can also be calculated by
$$ |\mathbf{a} \times \mathbf{b}| = |\mathbf{a}||\mathbf{b}|\sin\theta $$

which is the area of the parallelogram having $\mathbf{a}$ and $\mathbf{b}$ as sides ($0 < \theta < \pi$).

## Infinitesimal area in integration

For double integrals, we take a infinitesimal area as the integral element. Usually it was written as the direct product as $dxdy$ because x-axis and y-axis are orthogonal ($\sin\theta=1$).

Now let us consider a function $g(u,v)$ of variables $u$ and $v$ while $u=u(x,y)$ and $v=v(x,y)$.If we want to calculate the integral $\int g(u,v) dudv$, we must firstly know the infinitesimal area $dudv$. Because $u, v$ are functions of $x,y$, they have following relationship,

$$ du = \frac{du}{dx}dx+\frac{du}{dy}dy $$
$$ dv = \frac{dv}{dx}dx+\frac{dv}{dy}dy $$

It's analogous that vector $\mathbf{u}$ has vector components $\frac{du}{dx}dx$ or $\frac{du}{dy}dy$ on x-axis or y-axis direction respectively, and same for $\mathbf{v}$.

It's a wrong way to get the infinitesimal area by multiplying $du$ and $dv$ directly. Because $u$ and $v$ are not guaranteed to be orthogonal. But we can get the infinitesimal area by calculating the cross product of $du$ and $dv$,

$$ du \times dv = (u_xv_y-u_yv_x)dxdy = \begin{vmatrix} u_x & u_y \\ v_x & v_y \end{vmatrix} dxdy = \frac{\partial(u,v)}{\partial(x,y)} dxdy $$

$\frac{\partial(u,v)}{\partial(x,y)}$ is called the Jacobian determinant. It can be seen as the chage ratio of area (or volume *etc.*) after variables mapping.

## Appendix
### proof of two dot product expression

Let's consider two vectors $\mathbf{a}$ and $\mathbf{b}$.

$$ \mathbf{a} = a_1\mathbf{i} + a_2\mathbf{j} $$
$$ \mathbf{b} = b_1\mathbf{i} + b_2\mathbf{j} $$

$\theta_{\mathbf{a}}$ and $\theta_{\mathbf{b}}$ are the respective angel between the vector and x-axis.

$$ \theta_{\mathbf{a}} = \arcsin{\frac{a_2}{|\mathbf{a}|}} = \arccos{\frac{a_1}{|\mathbf{a}|}} $$
$$ \theta_{\mathbf{b}} = \arcsin{\frac{b_2}{|\mathbf{b}|}} = \arccos{\frac{b_1}{|\mathbf{b}|}} $$

So the angel between vectors $\mathbf{a}$ and $\mathbf{b}$ is $\theta = \theta_{\mathbf{b}} - \theta_{\mathbf{a}}$. According to the trigonometric function,

$$ \cos\theta = \cos(\theta_{\mathbf{a}} - \theta_{\mathbf{b}}) = \cos\theta_{\mathbf{a}}\cos\theta_{\mathbf{b}} + \sin\theta_{\mathbf{a}}\sin\theta_{\mathbf{b}} = \frac{a_1}{|\mathbf{a}|} \frac{b_1}{|\mathbf{b}|}+ \frac{a_2}{|\mathbf{a}|} \frac{b_2}{|\mathbf{b}|} $$

Thus we get the two expressions of dot product of vectors,

$$ |\mathbf{a}||\mathbf{b}|\cos\theta = a_1b_1+a_2b_2 $$

### proof of two cross product expression

Similarly, let's consider the trigonometric functions of $\sin\theta$,

$$ \sin(\theta) = \sin(\theta_{\mathbf{b}} - \theta_{\mathbf{a}}) = \sin\theta_{\mathbf{b}}\cos\theta_{\mathbf{a}}-\cos\theta_{\mathbf{b}}\sin\theta_{\mathbf{a}} = \frac{a_1}{|\mathbf{a}|}\frac{b_2}{|\mathbf{b}|}-\frac{a_2}{|\mathbf{a}|}\frac{b_1}{|\mathbf{b}|} $$

Thus we get the two expressions of the magnitude of the cross product of vectors,

$$ |\mathbf{a}||\mathbf{b}|\sin\theta = a_1b_2-a_2b_1 $$

### proof of trigonometric functions
$$ \begin{aligned}
e^{i(\theta_1-\theta_2)} &= \cos(\theta_1-\theta_2) + i \sin(\theta_1-\theta_2)\\
e^{i(\theta_1-\theta_2)} &= e^{i\theta_1}/e^{i\theta_2}\\
                         &= \frac{\cos\theta_1 + i \sin\theta_1}{\cos\theta_2 + i \sin\theta_2}\\
                         &= (\cos\theta_1+i\sin\theta_1)(\cos\theta_2-i\sin\theta_2)\\
                         &= (\cos\theta_1 \cos\theta_2 + \sin\theta_1 \sin\theta_2) + i(\sin\theta_1 \cos\theta_2 - \cos\theta_1 \sin\theta_2)
\end{aligned} $$

The real part and imaginary part should be identical, thus

$$ \cos(\theta_1-\theta_2) = \cos\theta_1 \cos\theta_2 + \sin\theta_1 \sin\theta_2 $$
$$ \sin(\theta_1-\theta_2) = \sin\theta_1 \cos\theta_2 - \cos\theta_1 \sin\theta_2 $$
