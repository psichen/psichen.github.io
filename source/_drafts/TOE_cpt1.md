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
\,\mathrm{d} x'_i = \,\mathrm{d} x_i + \,\mathrm{d} u_i
$$

Now let us consider the distance between two points before deformation (Einstein summation convention),
$$
\,\mathrm{d} l^2 = \,\mathrm{d} x_i^2
$$
and after deformation,
$$
\,\mathrm{d} l'^2 = \,\mathrm{d} x'{_i}^2 = (\,\mathrm{d} x_i + \,\mathrm{d} u_i)^2 = \,\mathrm{d} l^2 + 2 \,\mathrm{d} u_i \,\mathrm{d} x_i + \,\mathrm{d} u_i^2
$$

Since $\boldsymbol{u}$ is a function of $\boldsymbol{x}$, we can write,
$$
\,\mathrm{d} u_i = \frac{\partial u_i}{\partial x_k} \,\mathrm{d} x_k
$$
Substituting $du_i = (\partial u_i / \partial x_k) dx_k$ into the above equation,
$$
\,\mathrm{d} l'^2 = \,\mathrm{d} l^2 + 2 \frac{\partial u_i}{\partial x_k} \,\mathrm{d} x_i \,\mathrm{d} x_k + \frac{\partial u_i}{\partial x_k} \frac{\partial u_i}{\partial x_l} \,\mathrm{d} x_k \,\mathrm{d} x_l
$$
To note the difference of suffixes in the last term ($k$ and $l$) because it supposed to be the sum of independent partial components. We can interchange the suffixes $k$ and $l$ and wrap them up,
$$
\,\mathrm{d} l'^2 = \,\mathrm{d} l^2 + 2 \cdot \frac{1}{2} (\color{blue}{ \frac{\partial u_i}{\partial x_k} + \frac{\partial u_k}{\partial x_i} + \frac{\partial u_l}{\partial x_i} \frac{\partial u_l}{\partial x_k}  }) \,\mathrm{d} x_i \,\mathrm{d} x_k = \,\mathrm{d} l^2 + 2 \color{blue}{ u_{ik} } \,\mathrm{d} x_i \,\mathrm{d} x_k
$$
where $u_{ik}$ is the strain tensor, which gives the change in an element of length when the body is deformed.

### principal values of symmetrical tensor

The strain tensor $u_{ik} = u_{ki}$ is symmetrical, thus it can be diagonalised by changing coordinate axes so that only diagonal elements $u_{11}, u_{22}, u_{33}$ are non-zero. If a given point is under the principal axes, the length is,
$$
\,\mathrm{d} l'^2 = (\delta_{ik} + 2u_{ik}) \,\mathrm{d} x_i \,\mathrm{d} x_k = (1 + 2 u^{(i)}) \,\mathrm{d} x_i^2
$$
where $u^{(i)}$ is the principal values of the strain tensor. It means the strain can be decomposed into three mutually perpendicular (independent) principal directions. So the relative extension is,
$$
(\,\mathrm{d} x'_i - \,\mathrm{d} x_i) / \,\mathrm{d} x_i = \sqrt{1 + 2 u^{(i)}} - 1
$$

### small deformation

In most cases the deformation is small compared to the whole body, *i.e.*, the relative extensions are small compared to unity. According to Taylor expansion and ignore higher-order terms,
$$
\sqrt{1 + 2 u^{(i)}} - 1 = u^{(i)}
$$

The infinitesimal volume before deformation $\,\mathrm{d} V = \,\mathrm{d} x_1 \,\mathrm{d} x_2 \,\mathrm{d} x_3$. To find the volume $\,\mathrm{d} V'$ after the deformation, we take the principal axes of the strain tensor, so $\,\mathrm{d} V' = \,\mathrm{d} x'_1 \,\mathrm{d} x'_2 \,\mathrm{d} x'_3$ as the principal axes are mutually perpendicular. Taking the above principal values $u^{(i)}$ into account,
$$
\,\mathrm{d} V' = \,\mathrm{d} V (1+u^{(1)})(1+u^{(2)})(1+u^{(3)})
$$
and neglecting higher-order smallness,
$$
\,\mathrm{d} V' = \,\mathrm{d} V(1 + u_{ii})
$$
Thus the sum of principal values of the strain tensor is the relative volume change $(\,\mathrm{d} V' - \,\mathrm{d} V)/\mathrm{d}V$

The strain tensor can also be simplified by ignoring the second order of smallness,
$$
u_{ik} = \frac{1}{2} (\frac{\partial u_i}{\partial x_k} + \frac{\partial u_k}{\partial x_i})
$$

## stress tensor

According the Newton's third law, the required total force of a volume element $dV$ can be regarded as the sum of forces exerted on the surrounding portions, *i.e.*, an integral over the surface, because molecular forces here are assumed to have a very short range of action. According to vector analysis, a vector is the result of the divergence of a tensor of rank two,
$$
\nabla \cdot \boldsymbol{T} = \frac{\partial T_{ik}}{\partial x_k} 
$$
$$
\int F_i \,\mathrm{d} V = \int \frac{\partial \sigma_{ik}}{\partial x_k} \,\mathrm{d} V = \oint \sigma_{ik} \,\mathrm{d} f_k
$$
The stress tensor is symmetrical.

### the equation of equilibrium

The equation of equilibrium for a deformed body is,
$$
F_i = \frac{\partial \sigma_{ik}}{\partial x_k} = 0
$$
or in a gravitational field,
$$
\frac{\partial \sigma_{ik}}{\partial x_k} + \rho g_i = 0
$$

### the thermodynamics of deformation

If $\delta R$ denotes the work doen by the internal stress $F_i$ with a small deformation $\delta u_i$ per unit volume, the work for the whole body is,

\begin{align*}
\int \delta R dV &= \int (\frac{\partial \sigma_{ik}}{\partial x_k}) \delta u_i \,\mathrm{d} V \\
\color{blue}{\text{[integral by parts]}} &= \oint \sigma_{ik} \delta u_i \,\mathrm{d} f_k - \int \sigma_{ik} \frac{\partial \delta u_i}{\partial x_k} \,\mathrm{d} V \\
\color{blue}{\text{[zero stresses at infinite surface]}} &= -\frac{1}{2} \int \sigma_{ik} (\frac{\partial \delta u_i}{\partial x_k} + \frac{\partial \delta u_k}{\partial x_i}) \,\mathrm{d} V \\
\color{blue}{\text{[strain tensor]}} &= - \int \sigma_{ik} \delta u_{ik} \,\mathrm{d} V \\
\end{align*}

Thus we find the work $\delta R$ in terms of the change in the strain tensor $\delta u_{ik}$,
$$
\delta R = - \sigma_{ik} \delta u_{ik}
$$
The first principle of thermodynamics is an infinitesimal change in the internal energy $\mathrm{d} E$ is equal to the heat acquired by the body and the work done by the internal stress,
$$
\mathrm{d} E = T \,\mathrm{d} S - \,\mathrm{d} R = T \,\mathrm{d} S + \sigma_{ik} \,\mathrm{d} u_{ik}
$$

### Lame coefficients

The free energy $F$ of the *isotropic* body can be expanded into a function of the strain tensor.

(**i**) Because an undeformed body has zero strain tensor $u_{ik}=0$ and thus zero stress tensor $\sigma_{ik}=0$. So from the thermodynamic relation $(\partial F / \partial u_{ik})_{T} = \sigma_{ik} = 0$, thus there is no linear term in the expansion of $F$ in powers of $u_{ik}$.

(**ii**) Since $F$ is a scalar, each term in the expansion of $F$ should be a scalar too. Two independent scalars of the second degree can be formed from the components of the symmetrical tensor $u_{ik}$: $u_{ii}^2$ and $u_{ik}^2$.

Therefore we have $F$ in powers of $u_{ik}$ as far as terms of the second order,
$$
F = F_0 + \frac{1}{2} \lambda u_{ii}^2 + \mu u_{ik}^2
$$
The quantities $\lambda$ and $\mu$ are *Lamé coefficients*.

Any deformation can be represented as the sum of a pure shear and a hydrostatic compression,
$$
u_{ik} = (u_{ik} - \frac{1}{3} \delta_{ik} u_{ll}) + \frac{1}{3} \delta_{ik} u_{ll}
$$
We can express $F$ in terms of a pure shear and a hydrostatic compression,
$$
F = F_0 + 
$$
$$
\frac{1}{2} \lambda \delta_{ik} u_{ll}^2 + \mu \Big{(} (u_{ik} - \frac{1}{3} \delta_{ik} u_{ll}) + \frac{1}{3} \delta_{ik} u_{ll} \Big{)}^2
$$
