---
title: Notes about TOE chapter 1
tags: [tensor, strain, stress]
---

## strain tensor

The *displacement vector* $\boldsymbol{u}$ is defined as,
$$
u_i = x'_i - x_i
$$
where $x_i$ and $x'_i$ are coordinates before and after deformation. For two points which are very close, the change of coordinates is,
$$
dx'_i = dx_i + du_i
$$

Now let us consider the distance between two points before deformation (Einstein summation convention),
$$
dl^2 = dx_i^2
$$
and after deformation,
$$
dl'^2 = dx'{_i}^2 = (dx_i + du_i)^2 = dl^2 + 2 du_i dx_i + du_i^2
$$

Since $\boldsymbol{u}$ is a function of $\boldsymbol{x}$, we can write,
$$
du_i = \frac{\partial u_i}{\partial x_k} dx_k
$$
Substituting $du_i = (\partial u_i / \partial x_k) dx_k$ into the above equation,
$$
dl'^2 = dl^2 + 2 \frac{\partial u_i}{\partial x_k} dx_i dx_k + \frac{\partial u_i}{\partial x_k} \frac{\partial u_i}{\partial x_l} dx_k dx_l
$$
To note the difference of suffixes in the last term ($k$ and $l$) because it supposed to be the sum of independent partial components. We can interchange the suffixes $k$ and $l$ and wrap them up,
$$
dl'^2 = dl^2 + 2 \cdot \frac{1}{2} (\color{blue}{ \frac{\partial u_i}{\partial x_k} + \frac{\partial u_k}{\partial x_i} + \frac{\partial u_l}{\partial x_i} \frac{\partial u_l}{\partial x_k}  }) dx_i dx_k = dl^2 + 2 \color{blue}{ u_{ik} } dx_i dx_k
$$
where $u_{ik}$ is the strain tensor, which gives the change in an element of length when the body is deformed.

### principal values of symmetrical tensor

The strain tensor $u_{ik} = u_{ki}$ is symmetrical, thus it can be diagonalised by changing coordinate axes so that only diagonal elements $u_{11}, u_{22}, u_{33}$ are non-zero. If a given point is under the principal axes, the length is,
$$
dl'^2 = (\delta_{ik} + 2u_{ik}) dx_i dx_k = (1 + 2 u^{(i)}) dx_i^2
$$
where $u^{(i)}$ is the principal values of the strain tensor. It means the strain can be decomposed into three mutually perpendicular (independent) principal directions. So the relative extension is,
$$
(dx'_i - dx_i) / dx_i = \sqrt{1 + 2 u^{(i)}} - 1
$$

### small deformation

In most cases the deformation is small compared to the whole body, *i.e.*, the relative extensions are small compared to unity. According to Taylor expansion and ignore higher-order terms,
$$
\sqrt{1 + 2 u^{(i)}} - 1 = u^{(i)}
$$

The infinitesimal volume before deformation $dV = dx_1 dx_2 dx_3$. To find the volume $dV'$ after the deformation, we take the principal axes of the strain tensor, so $dV' = dx'_1 dx'_2 dx'_3$ as the principal axes are mutually perpendicular. Taking the above principal values $u^{(i)}$ into account,
$$
dV' = dV (1+u^{(1)})(1+u^{(2)})(1+u^{(3)})
$$
and neglecting higher-order smallness,
$$
dV' = dV(1 + u_{ii})
$$
Thus the sum of principal values of the strain tensor is the relative volume change $(dV' - dV)/dV$

The strain tensor can also be simplified by ignoring the second order of smallness,
$$
u_{ik} = \frac{1}{2} (\frac{\partial u_i}{\partial x_k} + \frac{\partial u_k}{\partial x_i})
$$

## stress tensor

According the Newton's third law, the required total force of a volume element $dV$ can be regarded as the sum of forces exerted on the surrounding portions, *i.e.*, an integral over the surface.
$$
\int F_i dV = \int \frac{\partial \sigma_{ik}}{\partial x_k} dV = \oint \sigma_{ik} df_k
$$
