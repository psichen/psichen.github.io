---
title: Vesicle mechanics
tags: [surface tension]
---

## Lame constants

Both strain and stress are second-order tensors, so they are related by a fourth-order tensor, which is isotropic because the relationship between strain and stress should be an intrinsic property and independent from the selection of coordinates. Given the most general form of a fourth-order tensor,
$$
c_{ijkl} = \lambda \delta_{ij} \delta_{kl} + \eta \delta_{ik} \delta_{jl} + \nu \delta_{il} \delta_{jk}
$$
and the symmetric strain tensor,
$$
\epsilon_{kl} = \frac{1}{2} ( \frac{\partial u_k}{\partial x_l} + \frac{\partial u_l}{\partial x_k}   )
$$
The stress tensor should be,
$$
\sigma_{ij} = c_{ijkl} \epsilon_{kl} = \lambda \delta_{ij} \epsilon_{kk} + \eta \epsilon_{ij} + \nu \epsilon_{ji}
$$
By substituting $\eta + \nu = 2 \mu$,
$$
\sigma_{ij} = \lambda \delta_{ij} \epsilon_{kk} + 2 \mu \epsilon_{ij}
$$
in which $\lambda$ and $\mu$ are *Lame constants*.

## Surface tension

We begin with Young-Laplace equation of an interface separating two phases,

```tikz
\begin{document}
\begin{tikzpicture}

\draw (10,0) ..controls (12,8) and (18,8) .. (20,0);
\draw[dashed] (15,3) ellipse (3.85 and 0.5);

\node at (12,2.3){\bf{C}};
\draw [thick, ->] (18.9,3) to (20,4) node[above] {\bf{n}};
\draw [thick, ->] (18.9,3) to (19.5,2) node[below,right] {\bf{b}};
\draw [thick, ->] (18.9,3) to (18,3.6) node[above] {\bf{t}};
\node [font=\LARGE] at (13.8,3){\(\bf{\gamma}\)};

\draw [dashed,->] (11.5,5.5) node[above]{\(\sigma_2\)} to (12,5);
\draw [dashed,->] (13.5,4.5) node[below]{\(\sigma_1\)} to (13,5);

\end{tikzpicture}
\end{document}
```

where $\sigma_i$ are stress of the interface, $\boldsymbol{n}$ is the normal vector of the surface, $\boldsymbol{b}$ and $\boldsymbol{t}$ are the normal vector and the tangent vector of an infinitesimal closed path $\boldsymbol{C}$, respectively. $\boldsymbol{\gamma}$ is the surface tension. Note that surface tension $\boldsymbol{\gamma}$ is a third-order tensor and $\boldsymbol{n} = \boldsymbol{t} \times \boldsymbol{b}$.

When the system is under force balance,
$$
\iint_S \sigma_1 \cdot \boldsymbol{n} dS + \oint_{\boldsymbol{C}} \boldsymbol{\gamma} \cdot \boldsymbol{b} dl - \iint_S \sigma_2 \cdot \boldsymbol{n} dS = 0
$$

According to Gauss divergence theorem, we can convert the path integral $\oint$ over the loop $\boldsymbol{C}$ to a double integral $\iint$ over the surface $S$, and remove the integrals as $S$ is arbitrary,
\begin{equation}
(\sigma_1 - \sigma_2) \cdot \boldsymbol{n} = - \nabla \cdot \boldsymbol{\gamma}
\end{equation}

The above is the generalized Laplace's equation. If the surface tension is isotropic $\boldsymbol{\gamma} = \gamma \boldsymbol{I}$,

The reduced Laplace's equation,
\begin{equation}
\Delta p = \gamma (\kappa_1 + \kappa_2)
\end{equation}
