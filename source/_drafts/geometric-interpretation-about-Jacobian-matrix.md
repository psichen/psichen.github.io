---
title: Geometric interpretation about the Jacobian determinant
tags: [Jacobian, determinant, integration by substitution]
---

In scientific computing, integration by substitution is a very common skill. [For example](https://www.psichen.com/2019/09/30/FRET-correcting/), we measured a series of practical values of a variable ($x'$), of which the distribution ($g(x')$) was unknown. But we know the theoretic distribution of the variable ($f(x)$) and the correction relationship between theoretic and practical values ($x'=c(x)$). So we can get the analytic formula of $g(x')$ as following

$$ g(x') = f(x)\frac{dx}{dx'} $$

$$ \int_{x' \in R'} g(x') dx' = \int_{x \in R} f(x) \frac{dx}{dx'} dx $$

This is the one dimension situation of Jacobian determinant in integration by substitution.

## Parallelogram area by determinant

## Infinitestimal area in integration

## Jacobian determinant in multiple integrals

$$ J = \frac{\partial(u_1, \cdots, u_n)}{\partial (x_1, \cdots, x_n)} $$
