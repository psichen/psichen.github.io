---
title: Vector calculus and spherical average in SAXS
date: 2021-04-21 23:30:47
tags: [vector, calculus, SAXS, spherical average, curvature, gradient, coordinate]
---

A vector is typically regarded as a geometric entity characterized by a magnitude and a direction. Here are some notes about vector calculus and its basic application in small-angle x-ray scattering (SAXS).

<!--more-->

## Vector derivative with respect to a scalar variable

A vector can be denoted by a function of scalar variables. At a specific point $u$, the vector from the origin to the coordinate $(a_{i}(u), a_{j}(u), a_{k}(u))$ comprises the vector $\pmb{a}(u)$. The trajectory of the moving end of $\pmb{a}(u)$ along with the changing $u$ comprises the curve of the vector function $\pmb{a}(u)$. According to the definition, we have the derivative of $\pmb{a}(u)$ by calculating the limit,
 
$$ \frac{d\pmb{a}}{du} = \lim_{\Delta u \to 0} \frac{\pmb{a}(u+\Delta u) - \pmb{a}(u)}{\Delta u} = \lim_{\Delta u \to 0} \sum_{\pmb{n}=\pmb{i},\pmb{j},\pmb{k}} \frac{a_{\pmb{n}}(u+\Delta u) - a_{\pmb{n}}(u)}{\Delta u} \pmb{n} $$

Thus,

$$ \frac{d\pmb{a}}{du} = \frac{da_{i}}{du} \pmb{i} + \frac{da_{j}}{du} \pmb{j} + \frac{da_{k}}{du} \pmb{k} $$

The chain rule also works for vector calculus,

$$ \frac{d (\pmb{a} \cdot \pmb{b})}{dt} = \pmb{a} \cdot \frac{d \pmb{b}}{dt} + \pmb{b} \cdot \frac{d \pmb{a}}{dt} $$

specifically, if $\pmb{a}=\pmb{b}$, we have,

$$ \frac{d (\pmb{a} \cdot \pmb{a})}{dt} = 2 \pmb{a} \cdot \frac{d \pmb{a}}{dt} $$

If $|\pmb{a}|=a$ is constant as $t$ varies (e.g. circles), then $\pmb{a} \cdot \frac{d \pmb{a}}{dt}=0$, thus $\pmb{a}$ is perpendicular to its derivate $\frac{d \pmb{a}}{dt}$.

## Curvature

For the curve described by $\pmb{r}(t) = x(t)\pmb{i}+y(t)\pmb{j}+z(t)\pmb{k}$, the infinitesimal displacement is,

$$ d \pmb{r} = (\dot{x} \pmb{i} + \dot{y} \pmb{j} + \dot{z} \pmb{k}) dt $$

A curve may also be described in the parametric form by the vector $\pmb{r}(s)$, where the parameter $s$ is the arc length along the curve measured from a fixed point. The infinitesimal length $s$ should be equal to the module of the infinitesimal $d \pmb{r}$,

$$ ds = \sqrt{d \pmb{r} \cdot d \pmb{r}} = \sqrt{\dot{x}^{2} + \dot{y}^{2} + \dot{z}^{2}} dt $$

Thus the unit tangent vector of the curve $\pmb{r}(t)$ at a given point is given by,

$$ \frac{d \pmb{r}}{ds} = \frac{\dot{x} \pmb{i} + \dot{y} \pmb{j} + \dot{z} \pmb{k}}{\sqrt{\dot{x}^{2} + \dot{y}^{2} + \dot{z}^{2}}} = \hat{\pmb{t}} $$

The rate at which the tangent vector $\hat{\pmb{t}}$ changes with respect to $s$ is $\frac{d \hat{\pmb{t}}}{ds}$, and its magnitude is defined as the curvature $\kappa$ of the curve at a given point,

$$ \kappa = |\frac{d \hat{\pmb{t}}}{ds}| = |\frac{d^{2} \hat{\pmb{r}}}{ds^{2}}| $$

and the quantity $\rho = \frac{1}{\kappa}$ is the radius of curvature. Since $\hat{\pmb{t}}$ is of constant unit magnitude, it is perpendicular to its derivate $\frac{d \hat{\pmb{t}}}{ds}$. The unit vector in the direction perpendicular to $\hat{\pmb{t}}$ is denoted by the principal normal vector $\hat{\pmb{n}}$,

$$ \frac{d \hat{\pmb{t}}}{ds} = \kappa \hat{\pmb{n}} $$

## Gradient

The directional derivative of a scalar function $\phi(\pmb{r})$ in the direction of $\pmb{v}$ is defined as,

$$ \frac{d \phi(\pmb{r})}{ds} = \lim_{|\delta \pmb{v}| \to 0} \frac{\phi(\pmb{r} + \delta \pmb{v}) - \phi(\pmb{r})}{|\delta \pmb{v}|} $$

where $ds$ is the infinitesimal arc length in the direcction of $\delta \pmb{v}$. Transform the above equation using the first order approxmation of the Taylor series,

$$ \frac{d \phi(\pmb{r})}{ds} = \lim_{|\delta \pmb{v}| \to 0} \frac{\phi(\pmb{r} + \delta \pmb{v}) - \phi(\pmb{r})}{|\delta \pmb{v}|} = \lim_{|\delta \pmb{v}| \to 0} (\frac{\partial \phi(\pmb{r})}{\partial x} \pmb{i} + \frac{\partial \phi(\pmb{r})}{\partial y} \pmb{j} + \frac{\partial \phi(\pmb{r})}{\partial z} \pmb{k})\frac{\delta \pmb{v}}{|\delta \pmb{v}|} $$

The gardient operator is defined as $\nabla = \frac{\partial }{\partial x} \pmb{i} + \frac{\partial }{\partial y} \pmb{j} + \frac{\partial }{\partial z} \pmb{k}$. Thus, the directional derivative in the direction of an arbitrary unit vector $\hat{\pmb{v}}$ is,

$$ \frac{d \phi(\pmb{r})}{ds} = \nabla{\phi(\pmb{r})} \cdot \frac{\delta {\pmb{v}}}{|\delta \pmb{v}|} = \nabla{\phi(\pmb{r})} \cdot \hat{\pmb{v}} $$

It has two interesting geometric properties.

### steepest descent

Since the directional derivative is $\nabla{\phi(\pmb{r})} \cdot \hat{\pmb{v}} = |\nabla{\phi(\pmb{r})}| \cos\theta$, clearly $\nabla{\phi(\pmb{r})}$ lies in the direction of largest possible rate of increase in $\phi(\pmb{r})$, and $- \nabla{\phi(\pmb{r})}$ the largest possible rate of the decrease in $\phi(\pmb{r})$.


### normal vector to surface

For a surface function $\phi(\pmb{r}) = c$ ($c$ is a constant), the directional derivative is,

$$ \frac{d \phi(\pmb{r})}{ds} = \nabla \phi \cdot \hat{\pmb{v}} = 0 $$

where $\hat{\pmb{v}}$ is the arbitrary tangent vector. In other words, $\nabla{\phi(\pmb{r})}$ is the vector normal to the surface $\phi(\pmb{r}) = c$ at every point.

## Different coordinate system

Coordinate system transformation is a fascinating skill because usually it dramatically simplifies calculations. The vector $\pmb{r}$ in the $xyz$-coordinate system can be transformed by $uvw$ as variables,

$$ \pmb{r} = x(u,v,w) \pmb{i} + y(u,v,w) \pmb{j} + z(u,v,w) \pmb{k} $$

The basis vectors, however, are not transformed because they are still the $\pmb{i}, \pmb{j}, \pmb{k}$. Since we want to find the new basis vectors in which directions the vector $\pmb{r}$ changes with new variables, let's calculate the partial derivatives of the vector $\pmb{r}$ with respect to new variables,

$$ \begin{aligned}
\frac{\partial \pmb{r}}{\partial u} &= \frac{\partial x}{\partial u} \pmb{i} + \frac{\partial y}{\partial u} \pmb{j} + \frac{\partial z}{\partial u} \pmb{k} = |\frac{\partial \pmb{r}}{\partial u}| \hat{\pmb{e}}_{u} \\
\frac{\partial \pmb{r}}{\partial v} &= \frac{\partial x}{\partial v} \pmb{i} + \frac{\partial y}{\partial v} \pmb{j} + \frac{\partial z}{\partial v} \pmb{k} = |\frac{\partial \pmb{r}}{\partial v}| \hat{\pmb{e}}_{v} \\
\frac{\partial \pmb{r}}{\partial w} &= \frac{\partial x}{\partial w} \pmb{i} + \frac{\partial y}{\partial w} \pmb{j} + \frac{\partial z}{\partial w} \pmb{k} = |\frac{\partial \pmb{r}}{\partial w}| \hat{\pmb{e}}_{w} \\
\end{aligned} $$

Thus we get the new basis vectors,

$$ \begin{aligned}
\hat{\pmb{e}}_{u} &= |\frac{\partial \pmb{r}}{\partial u}|^{-1} (\frac{\partial x}{\partial u} \pmb{i} + \frac{\partial y}{\partial u} \pmb{j} + \frac{\partial z}{\partial u} \pmb{k}) \\
\hat{\pmb{e}}_{v} &= |\frac{\partial \pmb{r}}{\partial v}|^{-1} (\frac{\partial x}{\partial v} \pmb{i} + \frac{\partial y}{\partial v} \pmb{j} + \frac{\partial z}{\partial v} \pmb{k}) \\
\hat{\pmb{e}}_{w} &= |\frac{\partial \pmb{r}}{\partial w}|^{-1} (\frac{\partial x}{\partial w} \pmb{i} + \frac{\partial y}{\partial w} \pmb{j} + \frac{\partial z}{\partial w} \pmb{k}) \\
\end{aligned}  $$

as well as the infinitesimal change in $\pmb{r}$ along three directions,

$$ d \pmb{r} = |\frac{\partial \pmb{r}}{\partial u}| \hat{\pmb{e}}_{u} du + |\frac{\partial \pmb{r}}{\partial v}| \hat{\pmb{e}}_{v} dv + |\frac{\partial \pmb{r}}{\partial w}| \hat{\pmb{e}}_{w} dw $$

### spherical corrdinates

For spherical coordinates, $xyz$ can be described by $r\phi\theta$ as,

$$ \begin{aligned}
x &= r \cos\phi \sin\theta \\
y &= r \sin\phi \sin\theta \\
z &= r \cos\theta \\
\end{aligned}  $$

$$ \frac{\partial (x,y,z)}{\partial (r,\phi,\theta)} = \begin{bmatrix}
\frac{\partial x}{\partial r} & \frac{\partial x}{\partial \phi} & \frac{\partial x}{\partial \theta} \\
\frac{\partial y}{\partial r} & \frac{\partial y}{\partial \phi} & \frac{\partial y}{\partial \theta} \\
\frac{\partial z}{\partial r} & \frac{\partial z}{\partial \phi} & \frac{\partial z}{\partial \theta} \\
\end{bmatrix} = \begin{bmatrix}
\cos\phi \sin\theta & -r \sin\phi \sin\theta & r \cos\phi \cos\theta \\
\sin\phi \sin\theta & r \cos\phi \sin\theta & r \sin\phi \cos\theta \\
\cos\theta & 0 & -r \sin\theta \\
\end{bmatrix} $$

Thus,

$$ d \pmb{r} = \hat{\pmb{e}}_{r} dr + r \sin\theta \hat{\pmb{e}}_{\phi} d\phi + r \hat{\pmb{e}}_{\theta} d\theta $$

where

$$ \begin{aligned}
\hat{\pmb{e}}_{r} &= \cos\phi \sin\theta \pmb{i} + \sin\phi \sin\theta \pmb{j} + \cos\theta \pmb{k} \\
\hat{\pmb{e}}_{\phi} &= - \sin\phi \pmb{i} + \cos\phi \pmb{j} \\
\hat{\pmb{e}}_{\theta} &= \cos\phi \cos\theta \pmb{i} + \sin\phi \cos\theta \pmb{j} - \sin\theta \pmb{k} \\
\end{aligned}  $$

These three vector are orthonormal since their dot products with each other are zero.

The infinitesimal volume $dV$ of the parallelepiped defined the vector $dr \hat{\pmb{e}}_{r}, r\sin\theta d\phi \hat{\pmb{e}}_{\phi}, r d\theta \hat{\pmb{e}}_{\theta}$ is given by,

$$ dV =  dr \hat{\pmb{e}}_{r} \cdot |r \sin\theta d\phi \hat{\pmb{e}}_{\phi} \times r d\theta \hat{\pmb{e}}_{\theta}| = r^{2} \sin\theta dr d\phi d\theta $$

The infinitesimal area $dA$ is,

$$ dA = \frac{dV}{dr} = r^{2} \sin\theta d\phi d\theta $$

The solid angle is defined as,

$$ d\Omega = \frac{dA}{r^{2}} = \sin\theta d\phi d\theta $$

### spherical average of scattering wave function in SAXS

SAXS uses x-ray's scattering and diffraction to study structural features of particles. If $\pmb{k}_{0}$ and $\pmb{k}_{1}$ are wave vectors of the incident ray and the scattered ray, respectively, for simplicity, we just describe the part about diffracted wave,

$$ \exp(i \pmb{q} \cdot \pmb{s}) $$

where $\pmb{q}$ is the displacement between two electrons that scatter x-rays, and $\pmb{s}=\pmb{k}_{1} - \pmb{k}_{0}$ is the scattering vector.

Because atoms are always in thermal motion, the detected signals should be the oriental average of the diffracted wave. Considering the geometric symmetry of sphere, we can always make the basis vector $\hat{\pmb{e}}_{\theta}$ lies in the plane comprised by $\pmb{q}$ and $\pmb{s}$,

$$ \begin{aligned}
<\exp(i \pmb{q} \cdot \pmb{s})>_{\Omega}
&= \frac{1}{4 \pi} \int_{0}^{2 \pi} d\phi \int_{0}^{\pi} \exp(iqs \cos\theta) \sin\theta d\theta \\
&= \frac{i}{2qs} \exp(iqs \cos\theta)|_{0}^{\pi} \\
&= \frac{\sin(qs)}{qs} \\
\end{aligned}  $$

which is denoted in Debye Scattering Equation.
