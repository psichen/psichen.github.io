---
title: residue therom and inverse Laplace transform
tags: [Laplace transform]
---

## Fundamentals of complex analysis ##

## Exponential order ##

We say $f(t)$ is of exponential order if there exist numbers $c$, $M>0$ and $T>0$ so that
$$
 |f(t)| \le M e^{ct} \,\,\,\, \text{for} \,\,\,\, t > T
$$

## Region of convergence ##

absolute convergence for integral
$$
\int_0^{\infty} |f(t) e^{-st}| \, dt < \infty
$$

## Inverse Laplace transform ##

The inverse Laplace transform is,
$$
\mathcal{L}^{-1}[F(s)] = \lim_{\omega \to \infty} \int_{\sigma-\omega j}^{\sigma+\omega j} F(s) e^{st} \, ds
$$
where $\sigma$ is the the abscissa of absolute convergence.

