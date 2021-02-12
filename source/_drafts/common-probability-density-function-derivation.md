---
title: Common probability function derivation
tags: [probability density function, probability mass function, poisson, exponential, gaussian, gamma, binomial, geometric, hypergeometric, bernoulli]
---

Probability and statistics are one of the most common terminologies in scientific data interpretations. They provide us ways to find truths and make conclusions from this stochastic and noisy world. These different probability distributions are heavily coupled. In order to apply these distribution properly, we should understand their origin and derivation, which are the main purpose of this post.

# Probability mass function for discrete variables

$X$: random variable

$p$: probability, $p\in(0,1)$

$q$: equals to $1-p$

$k$: discrete event numbers

$x$: continuous variables

$P(X)$: probability mass function

$f(x)$: probability density function

others: parameters

## Bernoulli distribution

Bernoulli distribution is associated with *one trial with two outcomes*, generally refered to as success ($k=1$) and failure ($k=0$).

$$ P(X=k) = p^k q^{1-k} $$

where $k=0, 1$.

### the moment generating function

$$  M_X(t) = E[e^{Xt}] = q+pe^t $$

## Binomial distribution

In the binomial distribution, the probability that $k$ successes in $n$ trials is given by,

$$ P(X=k) = C(n, k)p^kq^{n-k} $$

where $k=0,1,\dots,n$.

### the moment generating function

The random variable $X$ in binomial distribution is the sum of random variables $X_i$ in the same Bernoulli distribution. So the moment generating function of binomial distribution is given by

$$ M_X(t) = \prod_{i=1}^{n} q+pe^t = (q+pe^t)^n $$

## Geometric distribution

A random variable $X$ is given by the number of trials needed to obtain the first success when the chance of success at each trial is constant and equals to $p$.

$$ P(X=k) = q^{k-1}p $$

where $k>0$ and is an integer number. The name *geometric distribution* comes from the *geometric series*.

### the moment generating function

$$ M_X(t) = E(e^{Xt}) = \sum_{k=1}^{\infty} q^{k-1}pe^{kt} = pe^t \sum_{k=0}^{\infty} (qe^t)^k = \frac{pe^t}{1-qe^t} $$

where the sum of a geometric series was used and $t<-\ln q$.

### hypergeometric distribution

An equivalent scenario for binomial distribution is the number of drawn red balls $X=k$ *with replacement* in $n$ trials from a set of $N$ balls of which $M$ are red and the rest are white. If the balls, however, are drawn *without replacement*, the distribution is called hypergeometric distribution and its probability mass function is given by

$$ P(X=k) = \frac{C(M, k)C(N-M,n-k)}{C(N, n)} $$

The ratio between $P(X=k)$ and $P(X=k+1)$ is a rational function of $k$, so it's called *hypergeometric* series,

$$ \frac{P(X=k+1)}{P(X=k)} = \frac{(M-k)(n-k)}{(k+1)(N-M-n+k+1)} $$

## Negative binomial distribution

Another closely related distribution geometric distribution is negative binomial distribution where the variable $X$ is the number of *fail* trials when $r$ successes are obtained. Geometric distribution is a special case of negative binomial distribution in which $r=1$.

$$ P(X=k) = C(k+r-1, k)q^{k}p^r $$

### the moment generating function

In negative binomial distribution, the random variable $X=\sum_{i=1}^{r} X_i$, where $X_i$ follows the same geometric distribution. So the moment generating function of negative binomial distribution can be obtained from the product,

$$ M_X(t) = \prod_{i=1}^{r} M_{X_i}(t) = (\frac{pe^t}{1-qe^t})^r $$

where $t<-\ln q$.

## Poisson distribution

Binomial distribution describe the number of occured events in $n$ trials with probability $p$. When $n \to \infty$ and $p \to 0$, we define $np=\lambda$ and substitute it into the probability mass function of binomial distribution,

$$ \begin{aligned}
P(X=k) &= \lim_{n \to \infty} \frac{n!}{k!(n-k)!} (\frac{\lambda}{n})^k (1-\frac{\lambda}{n})^{n-k} \\
       &= \frac{\lambda^k}{k!} \lim_{n \to \infty} \frac{n!}{(n-k)!} \frac{1}{n^k} (1-\frac{\lambda}{n})^{n-k} \\
       &= \frac{\lambda^k}{k!} \lim_{n \to \infty} \frac{n(n-1)\cdots(n-k+1)}{n^k} (1-\frac{\lambda}{n})^{n-k}
\end{aligned} $$

Recall the define that $e=\lim_{x \to \infty} (1+\frac{1}{x})^x$, so we get

$$ P(X=k) = \frac{\lambda^k e^{-\lambda}}{k!} $$

where $k = 0, 1, 2,\dots$

### moment generating function

The moment generating function of Poisson distribution can also be derived from that of binomial distribution,

$$ \begin{aligned}
M_X(t) &= \lim_{n \to \infty} (1-\frac{\lambda}{n}+\frac{\lambda}{n} e^t)^n \\
       &=  \lim_{n \to \infty} (1+\frac{\lambda (e^t-1)}{n})^n \\
       &= e^{\lambda (e^t-1)}
\end{aligned} $$

### memoryless property

# Probability density function for continuous variables

## Gaussian distribution

$$ f(x) = \frac{1}{\sigma \sqrt{2\pi}} e^{\frac{1}{2}(\frac{x-\mu}{\sigma})^2} $$

### moment generating function

## Log-normal distribution

If $X \sim N(\mu, \sigma^2)$, then the variable $Y = e^X$ follows the log-normal distribution.

## Exponential distribution

In a Poisson distribution, the probability that no event occurs in time interval $x$ is,

$$ P_{\emptyset} = e^{-\lambda x} $$

where $k=0$. The probaility that an event occurs in the next infinitesimal time interval $x+dx$ is,

$$ P = e^{-\lambda} \lambda dx $$

So the probaility density function of exponential distribution is,

$$ f(x) = \lambda e^{-\lambda x} $$

### moment generating function

## Gamma distribution

# References
[Univariate Distribution Relationships](http://www.math.wm.edu/~leemis/chart/UDR/UDR.html)
