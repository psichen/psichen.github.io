---
title: Geometric interpretation about Jacobian determinant
date: 2021-02-04 18:10:26
tags: [Jacobian, determinant, integration by substitution, cross product, infinitesimal area]
---

In scientific computing, integration by substitution is a very common skill. [For example](https://www.psichen.com/2019/09/30/FRET-correcting/), we measured a series of practical values of a variable ($x'$), of which the distribution ($g(x')$) was unknown. But we know the theoretic distribution of the variable ($f(x)$) and the correction relationship or mapping relationship between theoretic and practical values ($x=h(x')$). <!--more-->So we can get the analytic formula of the distribution $g(x')$ as following

$$ g(x') = f(h(x')) \frac{dx}{dx'} $$

This is the one dimension situation of Jacobian determinant in integrals by substitution.

## Cross products for parallelogram area

Let's consider two vectors $\mathbf{a}^T = [a_i,a_j, a_k], \mathbf{b}^T = [b_i, b_j, b_k]$. We are very familar with the dot product or the inner product of the two vectors,

$$ \mathbf{a} \cdot \mathbf{b} = \mathbf{a}^T\mathbf{b} = a_ib_i+a_jb_j+a_kb_k $$

which is a scaler value. The name *inner* comes from the transpose symbol $T$ inside the two vectors. The inner product can also be calculated as

$$ \mathbf{a} \cdot \mathbf{b} = |\mathbf{a}||\mathbf{b}|\cos\theta $$

The cross product of two vectors, however, generally produces a new vector which is perpendicular to the plane consist of the two original vectors. If $\mathbf{i}, \mathbf{j}, \mathbf{k}$ are orthogonal unitary vectors, they satisify the following relationship via cross product,

$$ \mathbf{i} \times \mathbf{j} = \mathbf{k},~~ \mathbf{j} \times \mathbf{i} = -\mathbf{k} $$
$$ \mathbf{j} \times \mathbf{k} = \mathbf{i},~~ \mathbf{k} \times \mathbf{j} = -\mathbf{i} $$
$$ \mathbf{k} \times \mathbf{i} = \mathbf{j},~~ \mathbf{i} \times \mathbf{k} = -\mathbf{j} $$

Thus

$$ \begin{aligned}
\mathbf{a} \times \mathbf{b} &= (a_i\mathbf{i}+a_j\mathbf{j}+a_k\mathbf{k}) \times (b_i\mathbf{i}+b_j\mathbf{j}+b_k\mathbf{k}) \\
                             &= \begin{vmatrix} a_j & b_j \\ a_k & b_k \end{vmatrix} \mathbf{i} + \begin{vmatrix} a_k & b_k \\ a_i & b_i \end{vmatrix} \mathbf{j} + \begin{vmatrix} a_i & b_i \\ a_j & b_j \end{vmatrix} \mathbf{k} \\
                             &= \begin{vmatrix} \mathbf{i} & a_i & b_i \\ \mathbf{j} & a_j & b_j \\ \mathbf{k} & a_k & b_k \end{vmatrix}
\end{aligned} $$

The magnitude of the cross product of two vectors can also be calculated by
$$ |\mathbf{a} \times \mathbf{b}| = |\mathbf{a}||\mathbf{b}|\sin\theta $$

which is the area of the parallelogram having $\mathbf{a}$ and $\mathbf{b}$ as sides ($0 < \theta < \pi$).

## Infinitesimal area in integration

For double integrals $\iint f(x,y) dxdy$, we take an infinitesimal area as the integral element. Usually it was written as the direct product as $dxdy$ because $x$-axis and $y$-axis are orthogonal ($|dx \times dy| = |dxdy\sin\frac{\pi}{2}|$).

Now let's consider the variables substitution $dxdy \to dudv$ where $x=x(u,v)$ and $y=y(u,v)$. So the function $f(x,y) = f(x(u,v),y(u,v))$. Similarily, if we want to calculate the integral $\iint f(x,y) dxdy$ after substitution, we should change the infinitesimal area $dxdy$ to the infinitesimal area $dudv$.

Let's first decompse $dx$ and $dy$ on the $u$-axis and $v$-axis,

$$ dx = \frac{dx}{du}du+\frac{dx}{dv}dv $$
$$ dy = \frac{dy}{du}du+\frac{dy}{dv}dv $$

It's analogous that vector $\mathbf{x}$ has vector components $\frac{dx}{du}du$ or $\frac{dx}{dv}dv$ on $u$-axis or $v$-axis direction respectively, and same for $\mathbf{y}$.

It's a wrong way to get the infinitesimal area by multiplying the vector components of $dx$ and $dy$ directly. Because $u$-axis and $v$-axis are not guaranteed to be orthogonal ($|du \times dv| \neq |du||dv|$). But we can get the infinitesimal area by calculating the cross product of $dx$ and $dy$. Thus the infinitesimal area $dxdy$ can be described in terms of variables $du$ and $dv$,

$$ |dx \times dy| = |\begin{bmatrix} x_u du \\ x_v dv \end{bmatrix} \times \begin{bmatrix} y_u du \\ y_v dv \end{bmatrix}| = (x_uy_v-x_vy_u)dudv = \frac{\partial(x,y)}{\partial(u,v)} dudv $$

$\frac{\partial(x,y)}{\partial(u,v)}$ is called the Jacobian determinant. It can be seen as the scaling factor of area (or volume *etc.*) after variables substitution. The analytic form of the interand function after variable substitution is equal to

$$ g(u,v) = f(x(u,v),y(u,v)) \frac{\partial (x,y)}{\partial (u,v)} $$

## Appendix
### proof of two dot product expressions

Because two vectors compose a plane. We can always choose two orthogonal basis vectors to describe all vectors in the plane. Let's consider two vectors $\mathbf{a}$ and $\mathbf{b}$.

$$ \mathbf{a}^T = [a_1, a_2] $$
$$ \mathbf{b}^T = [b_1, b_2] $$

$\theta_{\mathbf{a}}$ and $\theta_{\mathbf{b}}$ are the respective angel between the vector and $x$-axis.

$$ \theta_{\mathbf{a}} = \arcsin{\frac{a_2}{|\mathbf{a}|}} = \arccos{\frac{a_1}{|\mathbf{a}|}} $$
$$ \theta_{\mathbf{b}} = \arcsin{\frac{b_2}{|\mathbf{b}|}} = \arccos{\frac{b_1}{|\mathbf{b}|}} $$

So the angel between vectors $\mathbf{a}$ and $\mathbf{b}$ is $\theta = \theta_{\mathbf{b}} - \theta_{\mathbf{a}}$. According to the trigonometric function,

$$ \cos\theta = \cos(\theta_{\mathbf{a}} - \theta_{\mathbf{b}}) = \cos\theta_{\mathbf{a}}\cos\theta_{\mathbf{b}} + \sin\theta_{\mathbf{a}}\sin\theta_{\mathbf{b}} = \frac{a_1}{|\mathbf{a}|} \frac{b_1}{|\mathbf{b}|}+ \frac{a_2}{|\mathbf{a}|} \frac{b_2}{|\mathbf{b}|} $$

Thus we get the two expressions of dot product of vectors,

$$ |\mathbf{a}||\mathbf{b}|\cos\theta = a_1b_1+a_2b_2 $$

### proof of two cross product expressions

Similarly, let's consider the trigonometric functions of $\sin\theta$,

$$ \sin(\theta) = \sin(\theta_{\mathbf{b}} - \theta_{\mathbf{a}}) = \sin\theta_{\mathbf{b}}\cos\theta_{\mathbf{a}}-\cos\theta_{\mathbf{b}}\sin\theta_{\mathbf{a}} = \frac{a_1}{|\mathbf{a}|}\frac{b_2}{|\mathbf{b}|}-\frac{a_2}{|\mathbf{a}|}\frac{b_1}{|\mathbf{b}|} $$

Thus we get the two expressions of the magnitude of the cross product of vectors,

$$ |\mathbf{a}||\mathbf{b}|\sin\theta = a_1b_2-a_2b_1 $$

### proof of trigonometric functions
$$ \begin{aligned}
e^{i(\theta_1-\theta_2)} &= \cos(\theta_1-\theta_2) + i \sin(\theta_1-\theta_2) \\
e^{i(\theta_1-\theta_2)} &= e^{i\theta_1}/e^{i\theta_2} \\
                         &= \frac{\cos\theta_1 + i \sin\theta_1}{\cos\theta_2 + i \sin\theta_2} \\
                         &= (\cos\theta_1+i\sin\theta_1)(\cos\theta_2-i\sin\theta_2) \\
                         &= (\cos\theta_1 \cos\theta_2 + \sin\theta_1 \sin\theta_2) + i(\sin\theta_1 \cos\theta_2 - \cos\theta_1 \sin\theta_2)
\end{aligned} $$

The real part and imaginary part should be identical, thus

$$ \cos(\theta_1-\theta_2) = \cos\theta_1 \cos\theta_2 + \sin\theta_1 \sin\theta_2 $$
$$ \sin(\theta_1-\theta_2) = \sin\theta_1 \cos\theta_2 - \cos\theta_1 \sin\theta_2 $$
