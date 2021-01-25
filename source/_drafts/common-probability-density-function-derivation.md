---
title: Common probability density function derivation
tags: [probability density function, poisson, exponential, gaussian]
mathjax: true
---

Probability and statistics are one of the most common terminologies in scientific data interpretations. They provide us ways to find truths and make conclusions from this stochastic and noisy world. These different probability distributions are heavily coupled. In order to apply these distribution properly, we should understand their origin and derivation, which are the main purpose of this post.

## Probability mass function for discrete variables

$X$: random variable

$P$: probability

$x$: event numbers

others: parameters

### Bernoulli distribution

$$ P(x) = p^x(1-p)^{(1-x)} $$

where $0<p<1, x=0, 1$.

Bernoulli distribution is associated with *one trial with two outcomes*, generally refered to as success ($x=1$) and failure ($x=0$).

#### Mean and variance

$$ E(X) = \sum_{x=0,1} xp^x(1-p)^{(1-x)} = p $$

$$ V(X) = \sum_{x=0,1} (x-p)^2p^x(1-p)^{(1-x)} = p(1-p) $$ 

### Binomial distribution

#### moments 

### Poisson distribution

$$ P(k) = \frac{e^{-\lambda}\lambda^k}{k!} $$

where $k = 0, 1, 2,...$

#### moments

#### memoryless property

## Probability density function for continuous variables

### Gaussian distribution

$$ f(x) = \frac{1}{\sigma \sqrt{2\pi}} e^{\frac{1}{2}(\frac{x-\mu}{\sigma})^2} $$

#### moments 

#### Fourier transform

### Exponential distribution

$$ f(x) = \lambda e^{-\lambda x} $$

#### moments 

## References
[Univariate Distribution Relationships](http://www.math.wm.edu/~leemis/chart/UDR/UDR.html)
