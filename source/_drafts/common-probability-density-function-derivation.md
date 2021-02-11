---
title: Common probability density function derivation
tags: [probability density function, poisson, exponential, gaussian, gamma, binomial, geometric]
---

Probability and statistics are one of the most common terminologies in scientific data interpretations. They provide us ways to find truths and make conclusions from this stochastic and noisy world. These different probability distributions are heavily coupled. In order to apply these distribution properly, we should understand their origin and derivation, which are the main purpose of this post.

## Probability mass function for discrete variables

$X$: random variable

$p$: probability, $p\in(0,1)$

$q$: equals to $1-p$

$k$: discrete event numbers

$x$: continuous variables

$P(X)$: probability mass function

$f(x)$: probability density function

others: parameters

### Bernoulli distribution

Bernoulli distribution is associated with *one trial with two outcomes*, generally refered to as success ($k=1$) and failure ($k=0$).

$$ P(X=k) = p^k q^{1-k} $$

where $k=0, 1$.

#### probability generating function

#### mean and variance

$$ E(X) = p $$

$$ V(X) = pq $$ 

### Geometric distribution

A random variable $X$ is given by the number of trials needed to obtain the first success when the chance of success at each trial is constant and equals to $p$.

$$ P(X=k) = q^{k-1}p $$

where $k>0$ and is an integer number. The name *geometric distribution* comes from the *geometric series*.

#### probability generating function

$$ \Phi_X(t) = \sum_{k=0}^{\infty} q^{k-1} p t^k = \frac{p}{q} \sum_{k=1}^{\infty} (qt)^k = \frac{pk}{1-qk} $$

where the sum of a geometric series was used.

#### mean and variance

$$ E(X) = \frac{1}{p} $$
$$ V(X) = \frac{q}{p^2} $$

### Negative geometric distribution

### Hypergeometric distribution

### Binomial distribution

In the binomial distribution, the probability that $k$ successes in $n$ trials is given by,

$$ P(X=k) = C(n, k)p^k(1-p)^{n-k} $$

where $k=0,1,\dots,n$.

#### probability generating function

### Poisson distribution

$$ P(X=k) = \frac{e^{-\lambda}\lambda^k}{k!} $$

where $k = 0, 1, 2,\dots$

#### probability generating function

$$ \Phi_X(t) = \sum_{k=0}^{\infty} \frac{e^{-\lambda} \lambda^k}{k!} t^k = e^{\lambda(t-1)} $$

#### memoryless property

## Probability density function for continuous variables

### Gaussian distribution

$$ f(x) = \frac{1}{\sigma \sqrt{2\pi}} e^{\frac{1}{2}(\frac{x-\mu}{\sigma})^2} $$

#### moment generating function

#### Fourier transform

### Log-normal distribution

If $X \sim N(\mu, \sigma^2)$, then the variable $Y = e^X$ follows the log-normal distribution.

### Exponential distribution

In a Poisson distribution, the probability that no event occurs in time interval $x$ is,

$$ P_{\emptyset} = e^{-\lambda x} $$

where $k=0$. The probaility that an event occurs in the next infinitesimal time interval $x+dx$ is,

$$ P = e^{-\lambda} \lambda dx $$

So the probaility density function of exponential distribution is,

$$ f(x) = \lambda e^{-\lambda x} $$

#### moment generating function

## References
[Univariate Distribution Relationships](http://www.math.wm.edu/~leemis/chart/UDR/UDR.html)
