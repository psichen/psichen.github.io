---
title: Common probability density functions
tags: [probability density function, poisson, exponential, gaussian, gamma, binomial, geometric, hypergeometric, bernoulli]
---

Probability and statistics are one of the most common terminologies in scientific data interpretations. They provide us ways to find truths and make conclusions from this stochastic and noisy world. These different probability distributions are heavily coupled. In order to apply these distribution properly, we should understand their origin and derivation, which are the main purpose of this post (for continuous distributions).

# Gaussian distribution

$$ f(x) = \frac{1}{\sigma \sqrt{2\pi}} e^{\frac{1}{2}(\frac{x-\mu}{\sigma})^2} $$

## moment generating function

# Log-normal distribution

If $X \sim N(\mu, \sigma^2)$, then the variable $Y = e^X$ follows the log-normal distribution.

# Exponential distribution

In a Poisson distribution, the probability that no event occurs in time interval $x$ is,

$$ P_{\emptyset} = e^{-\lambda x} $$

where $k=0$. The probaility that an event occurs in the next infinitesimal time interval $x+dx$ is,

$$ P = e^{-\lambda} \lambda dx $$

So the probaility density function of exponential distribution is,

$$ f(x) = \lambda e^{-\lambda x} $$

## moment generating function

## memoryless property

# Gamma distribution

## moment generating function

# Mean and variance

# References
[Univariate Distribution Relationships](http://www.math.wm.edu/~leemis/chart/UDR/UDR.html)
