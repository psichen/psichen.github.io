---
title: Common probability density functions
date: 2021-03-10 00:58:51
tags: [probability density function, exponential, gaussian, gamma, beta, chi-squared, log-normal, bayesian]
---

Probability and statistics are one of the most common terminologies in scientific data interpretations. They provide us ways to find truths and make conclusions from this stochastic and noisy world. These different probability distributions are heavily coupled. In order to apply these distribution properly, we should understand their origin and derivation, which are the main purpose of this post (for continuous distributions).

<!--more-->

# Gaussian distribution

Gaussian distribution is probably the most famous probability distribution. It's defined as

$$ f(x) = \frac{1}{\sigma \sqrt{2\pi}} e^{- \frac{1}{2}(\frac{x-\mu}{\sigma})^2} $$

where $\mu$ is the mean and $\sigma^2$ is the variance. 

## moment generating function

The moment generating function of Gaussian distribution can be directly calculated from the definition by just changing the integral to the form $a \int e^{-b(x-c)^2} dx$,

$$ M_X(t) = E[e^{Xt}] = \frac{1}{\sigma \sqrt{2\pi}} \int e^{- \frac{1}{2} (\frac{x-\mu}{\sigma})^2 + xt} dx = e^{\mu t+\frac{1}{2} \sigma^2 t^2} $$

## central limit theorem

Suppose that $X_i,~~i=1,2,\dots,n$ are independent random variables, each of which is described by a probability density function $f(x_i)$ (these functions may be all different) with a mean $\mu_i$ and a variance $\sigma_i$. The variable $Z = \frac{\sum_i X_i}{n}$ follows Gaussian distribution when $n \to \infty$,

$$ f(z) = \frac{1}{\sigma_z \sqrt{2\pi}} e^{\frac{1}{2} (\frac{x-\mu_z}{\sigma_z})^2} $$

where $\mu_z=\frac{\sum_i \mu_i}{n}$ and $\sigma_z^2=\frac{\sum_i \sigma_i^2}{n^2}$.

Let's consider this property from moment generating function of every random variable $X_i$, namely, $M_{X_i}(t)$. So for $Z=\frac{\sum_i X_i}{n}$, we have

$$ M_Z(t) = \prod_i M_{X_i}(\frac{t}{n}) $$

Recall that $M_{X_i}(\frac{t}{n})=E[e^{X_i \frac{t}{n}}]$ and expand the exponential component, we can get

$$ \begin{aligned}
M_{X_i}(\frac{t}{n}) &= 1 + \frac{t}{n} E[X_i] + \frac{1}{2!} \frac{t^2}{n^2} E[X_i^2] + \cdots \\
                     &= 1 + \frac{t}{n} \mu_i + \frac{1}{2!} \frac{t^2}{n^2} (\mu_i^2+\sigma_i^2) + \cdots
\end{aligned} $$

When $n \to \infty$,

$$ M_{X_i}(\frac{t}{n}) \approx e^{\frac{\mu_i t}{n} + \frac{1}{2} \frac{\sigma_i^2 t^2}{n^2} } $$

as approximated to the second term $(\frac{t^2}{n^2})$. So the moment generating function of $Z$ can be easily gotten by the product,

$$ M_Z(t) = \prod_i M_{X_i}(\frac{t}{n}) = e^{\frac{\sum_i \mu_i}{n}t + \frac{1}{2} \frac{\sum_i \sigma_i^2}{n^2} t^2} $$

which is exactly the form of Gaussian distribution, regardless of the type of probability distribution of random variables $X_i$.

# Log-normal distribution

If $X \sim N(\mu, \sigma^2)$, then the variable $Y = e^X$ follows the log-normal distribution, and $\ln Y$ follows the normal distribution, hence the name. According to the [Jacobian determinant](https://www.psichen.com/2021/02/04/geometric-interpretation-about-Jacobian-determinant/), the probability density function of $Y$ is the following equation,

$$ f(y) = f(x(y)) \frac{\partial x}{\partial y} = \frac{1}{\sigma \sqrt{2\pi}} \frac{1}{y} e^{-\frac{1}{2} (\frac{\ln y-\mu}{\sigma})^2} $$

The $\mu$ and $\sigma^2$ are not mean and variance but parameters of log-normal distribution. the mean and variance of log-normal distribution can be calculated from the moment generating function of Gaussian distribution,

$$ \begin{aligned}
E[Y] &= E[e^X] = M_X(1) = e^{\mu+\frac{1}{2}\sigma^2} \\
V[Y] &= E[Y^2] - E^2[Y] = E[e^{2X}] - E^2[e^X] = M_X(2) - M_X^2(1) \\
&= e^{2\mu+2\sigma^2} - e^{2\mu+\sigma^2}
\end{aligned} $$

## Log-normal central limit theorem

Let's consider the variable $Y=(\prod_i X_i)^{\frac{1}{n}},~~i=1,2,\dots,n$. So the variable $\ln Y=\frac{1}{n} \sum_i^n \ln X_i$ and satisfies the central limit theorem when $n \to \infty$. In other words, the random variable $Y$ follows the log-normal distribution.

# Exponential distribution

Exponential distribution describes the waiting time between two successive independent events in a Poisson process. The probability density function of exponential distribution can be derived from Poisson distribution.

If the average number of events per unit interval is $\lambda$, then on average there are $\lambda x$ events in interval $x$ according to the sum property of Poisson distributions. From the Poisson distribution the probability that no event occurs in interval $x$ is,

$$ P_0 = \frac{(\lambda x)^k}{k!} e^{-\lambda x} |_{k=0} = e^{-\lambda x} $$

The probaility that an event occurs in the next infinitesimal interval $dx$ is,

$$ P_1 = \frac{(\lambda dx)^k}{k!} e^{-\lambda dx} |_{k=1} = \lambda dx e^{-\lambda dx} \approx \lambda dx $$

So the probability that the first event occur in interval $[x, x+dx]$ is the product of $P_0$ and $P_1$,

$$ f(x) = \lambda e^{-\lambda x} dx $$

which is the probability density function of exponential distribution ($x>0$).

## moment generating function

By definition,

$$ M_X(t) = E[e^{Xt}] = \lambda \int_0^{\infty} e^{-\lambda x} e^{x t} dx = \frac{\lambda}{\lambda-t} $$

where $t<\lambda$.

## memorylessness

We say a random variable has memorylessness when it has following property,

$$ P(X>t+x|X>t) = P(X>x) $$

For the Poisson process, its waiting time satifies exponential distribution. According to the conditional probability rule, we have

$$ \begin{aligned}
P(X>t+x|X>t) &= \frac{P((X>t+x) \cap (X>t))}{P(X>t)} = \frac{P(X>t+x)}{P(X>t)} \\
             &= \frac{\int_{t+x}^{\infty} \lambda e^{-\lambda x} dx}{\int_t^{\infty} \lambda e^{-\lambda x}dx} = \frac{e^{-\lambda (t+x)}}{e^{-\lambda t}} \\
             &= e^{-\lambda x} = \int_x^{\infty} \lambda e^{-\lambda x} dx = P(X>x)
\end{aligned} $$

An application of memorylessness is to join two signal series of Poisson processes. Signal series consist of a series of discrete values. For simplicity, every value belongs to some states. In order to avoid artifacts, we should select such signal series of which the state of the tail of the first signal series should be the same as the state of the head of the second signal series. Then the tail of the first signal series is superposed with the head of the second signal series. Because of the memorylessness, the state transition probability of the head of the first signal series should be the same as that of the head of the second signal series. This join way keeps the stochastic property around the joint point.

# Gamma distribution

Exponential distribution can be extended to Gamma distribution by considering the waiting time when $r$ events occur. The probability density function of Gamma function can be derived by considering Poisson distribution where $r-1$ events occur in interval $x$,

$$ P_{r-1} = \frac{(\lambda x)^{r-1}}{(r-1)!} e^{-\lambda x} $$

Similarly, the probability that $r$th event occurs in interval $[x, x+dx]$ is

$$ P_r = \frac{(\lambda x)^{r-1}}{(r-1)!} e^{-\lambda x} \lambda dx $$

Thus, the probability density function of Gamma distribution is

$$ f(x) = \frac{\lambda (\lambda x)^{r-1}}{(r-1)!} e^{-\lambda x} $$

The gamma distribution can be defined for all positive real number $r$ by replacing $(r-1)!$ by Gamma function $\Gamma(r)$,

$$ f(x) = \frac{\lambda^r x^{r-1}}{\Gamma(r)} e^{-\lambda x} $$

and we write $X \sim \Gamma(r, \lambda)$ if the random variable $X$ follows Gamma distributon with the shape parameter $r$ and the rate parameter $\lambda$.

## moment generating function

The moment generating function for gamma function is obtained from that for exponential distribution,

$$ M_X(t) = (\frac{\lambda}{\lambda-t})^r $$

In other words, exponential distribution is a special case of gamma distribution $\Gamma(\lambda, 1)$.

## continuation from Poisson distribution

[Poisson distribution](https://www.psichen.com/2021/02/13/common-porobability-mass-functions/) describes the probability of the number of independent random events occurring. It's a discrete distribution in which the random variable must be integers. We can extend the Poisson distribution from integer space to real space by replacing factorial $k!$ with gamma function $\Gamma(k+1)$,

$$ P(x=k) = \frac{\lambda^k e^{-\lambda}}{\Gamma(k+1)} = \Gamma(k+1, 1) $$

# Beta distribution

Beta distribution describes the probability distribution of a probability. We can derive the beta distribution via Bayesian inference.

Let's first consider the probability of an event occuring $p$. We do not know the exact value of the $p$, so we just have a probability distribution of $p$ in which some values are more likely. When we don't have any sampling information about the $p$, we have no expectation but rather randomly guess what the $p$ is. So the prior probability $P(p<x<p+\Delta p)$ is uniform distribution $f(p)=1$ times $\Delta p$ (shorthand for $P(p)$).

Then we can add new information to the $p$ by counting success trials and failure trials according to the Bayesian equation,

$$ P(p|X) = \frac{P(X|p)P(p)}{\sum_{p} P(X|p) P(p)} $$

where $P(p)$ is the prior, $P(p|X)$ is the posterior, $P(X|p)$ is the likelyhood and $\sum_{p} P(X|p) P(p)$ is the normalization factor. We can derive the posterior probability mass function as,

$$ P(p|X) = \frac{ {n \choose k} p^k (1-p)^{n-k} \Delta p}{\int_0^1 {n \choose k} p^k (1-p)^{n-k} dp} = \frac{p^k (1-p)^{n-k} \Delta p}{\int_0^1 p^k (1-p)^{n-k} dp} $$

Thus its probability density function is,

$$ f(x) = \frac{ x^{m-1}(1-x)^{n-1} }{ B(m,n) } $$

## moment generating function

The moment generating function of Beta distribution can be obtained by definition,

$$\begin{aligned}
M_X(t) &= E[e^{Xt}] = \int_0^1 e^{xt} \frac{x^{\alpha-1}(1-x)^{\beta-1}}{B(\alpha, \beta)} dx \\
       &= \int_0^1 (\sum_{k=0}^{\infty} \frac{t^k x^k}{k!}) \frac{x^{\alpha-1}(1-x)^{\beta-1}}{B(\alpha, \beta)} dx \\
       &= \frac{1}{B(\alpha, \beta)} \sum_{k=0}^{\infty} \frac{t^k}{k!} \int_0^1 x^{\alpha+k-1}(1-x)^{\beta-1} dx \\
       &= \sum_{k=0}^{\infty} \frac{t^k}{k!} \frac{B(\alpha+k, \beta)}{B(\alpha, \beta)} \\
       &= \sum_{k=0}^{\infty} \frac{t^k}{k!} \frac{\Gamma(\alpha+k)\Gamma(\beta)}{\Gamma(\alpha+k+\beta)} \frac{\Gamma(\alpha+\beta)}{\Gamma(\alpha)\Gamma(\beta)} \\
       &= 1+\sum_{k=1}^{\infty} \frac{t^k}{k!} (\prod_{r=0}^{k-1} \frac{\alpha+r}{\alpha+\beta+r}) \\
\end{aligned}$$

## conjugate prior probability

A prior distribution is called the conjugate prior distribution when the type of the posterior distribution is the same with that of the prior distribution after Bayesian inference. For example, Beta distribution is the conjugate prior distribution to binomial distribution. Let's consider the prior distribution,

$$ P(p) = \int_p^{p+\Delta p} \frac{x^{m-1}(1-x)^{n-1}}{B(m,n)} dx $$

The posterior distribution is,

$$\begin{aligned}
P(p|X) &= \frac{ {n \choose k} p^k(1-p)^{n-k} \int_p^{p+\Delta p} \frac{x^{\alpha-1}(1-x)^{\beta-1}}{B(\alpha,\beta)} dx }{ \int_0^1  {n \choose k} p^k(1-p)^{n-k} \int_p^{p+\Delta p} \frac{x^{\alpha-1}(1-x)^{\beta-1}}{B(\alpha,\beta)} dx } \\
       &= \frac{ \int_0^{\Delta p} p^{\alpha-1+k}(1-p)^{\beta-1+n-k} dp }{ \int_0^1 p^{\alpha-1+k}(1-p)^{\beta-1+n-k} dp } \\
\end{aligned}$$

So the probability density function of the posterior distribution is,

$$ f(x) = \frac{ x^{\alpha+k-1}(1-x)^{\beta+n-k-1} }{ B(\alpha+k, \beta+n-k) } $$

it's just the sum of parameters of Beta and binomial distributions.

# Chi-squared distribution

If $X \sim N(\mu, \sigma^2)$, then the variable $Y=\frac{(X-\mu)^2}{\sigma^2}$ is distributed as $\Gamma(\frac{1}{2}, \frac{1}{2})$.

Because $X=\mu \pm \sigma \sqrt{Y}$, according to [Jacobian determinant](https://www.psichen.com/2021/02/04/geometric-interpretation-about-Jacobian-determinant/), the probability density function of $Y$ needs sum of two parts,

$$ \begin{aligned}
f(y) &= \frac{1}{\sigma \sqrt{2\pi}} e^{-\frac{y}{2}} |\frac{d (\mu+\sigma \sqrt{y})}{dy}| + \frac{1}{\sigma \sqrt{2\pi}} e^{-\frac{y}{2}} |\frac{d (\mu-\sigma \sqrt{y})}{dy}| \\
     &= \frac{1}{{2\sqrt\pi}} e^{-\frac{y}{2}}  (\frac{y}{2})^{-\frac{1}{2}} = \Gamma(\frac{1}{2}, \frac{1}{2}) \\
\end{aligned} $$

Now let's consider $n$ independent Gaussian random variables $X_i \sim N(\mu_i, \sigma_i^2)$ and define $\chi_n^2 = \sum_{i=1}^{n} \frac{(x_i-\mu_i)^2}{\sigma_i^2}$. 
The probability density function of $\chi_n^2$ is

$$ f(\chi_n^2) = (\frac{1}{2})^{\frac{1}{2}n} \frac{(\chi_n^2)^{\frac{1}{2}n-1}}{\Gamma(\frac{1}{2}n)} e^{-\frac{1}{2}\chi_n^2} $$

where $n$ is the freedom degree.

## moment generating function

The probability density function of Chi-squared distribution can be easily obtained from the moment generating function. Because $\chi_n^2 = \sum_{i=1}^{n} \frac{(x_i-\mu_i)^2}{\sigma_i^2}$, the moment generating function of $\chi_n^2$ is

$$ M_{\chi_n^2}(t) = (\frac{\lambda}{\lambda-t})^{\frac{1}{2} n} $$

Thus $\chi_n^2 \sim \Gamma(\frac{1}{2}, \frac{1}{2}n)$.

# Appendix

The gamma function and other related special functions appear in probability density functions many times. Some properties of these special functions need to be metioned.

## Gamma function

The gamma function is defined as

$$ \Gamma(r) = \int_0^{\infty} t^{r-1} e^{-t} dt $$

Let's make a substitution $t=\lambda x$ and transform the equation, we can get the probability density funtion of the gamma distribution,

$$ f(x) = \frac{\lambda^r x^{r-1} e^{-\lambda x}}{\Gamma(r)} $$

## Beta function

The beta function is defined as

$$ B(m, n) = \int_0^1 x^{m-1} (1-x)^{n-1} dx $$

Also,

$$ B(m, n) = \frac{\Gamma(m) \Gamma(n)}{\Gamma(m+n)} $$

Gamma function is the continuation of factorial function. Similarly, Beta function is the continuation of inverse of combination.

We transfrom the equation and get the probability density function of the beta distribution,

$$ f(x) = \frac{x^{m-1}(1-x)^{n-1}}{B(m,n)} $$

# References
[Univariate Distribution Relationships](http://www.math.wm.edu/~leemis/chart/UDR/UDR.html)
