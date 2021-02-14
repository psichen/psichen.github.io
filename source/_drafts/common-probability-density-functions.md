---
title: Common probability density functions
tags: [probability density function, exponential, gaussian, gamma, chi-squared, log-normal]
---

Probability and statistics are one of the most common terminologies in scientific data interpretations. They provide us ways to find truths and make conclusions from this stochastic and noisy world. These different probability distributions are heavily coupled. In order to apply these distribution properly, we should understand their origin and derivation, which are the main purpose of this post (for continuous distributions).

# Gaussian distribution

Gaussian distribution is probably the most famous probability distribution. It's defined as

$$ f(x) = \frac{1}{\sigma \sqrt{2\pi}} e^{- \frac{1}{2}(\frac{x-\mu}{\sigma})^2} $$

where $\mu$ is the mean and $\sigma^2$ is the variance. 

## moment generating function

The moment generating function of Gaussian distribution can be directly calculated from the definition by just changing the integral to the form $a \int e^{-b(x-c)^2} dx$,

$$ M_X(t) = E[e^{Xt}] = \frac{1}{\sigma \sqrt{2\pi}} \int e^{- \frac{1}{2} (\frac{x-\mu}{\sigma})^2 + xt} dx = e^{\mu t+\frac{1}{2} \sigma^2 t^2} $$

## central limit theorem

Suppose that $X_i, i=1,2,\dots,n$ are independent random variables, each of which is described by a probability density function $f(x_i)$ (these functions may be all different) with a mean $\mu_i$ and a variance $\sigma_i$. The variable $Z = \frac{\sum_i X_i}{n}$ follows Gaussian distribution when $n \to \infty$,

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

which is exactly the form of Gaussian distribution.

# Log-normal distribution

If $X \sim N(\mu, \sigma^2)$, then the variable $Y = e^X$ follows the log-normal distribution, and $\ln Y$ follows the normal distribution, hence the name. According to the [Jacobian determinant](https://www.psichen.com/2021/02/04/geometric-interpretation-about-Jacobian-determinant/), the probability density function of $Y$ is the following equation,

$$ f(y) = f(x(y)) \frac{\partial x}{\partial y} = \frac{1}{\sigma \sqrt{2\pi}} \frac{1}{y} e^{-\frac{1}{2} (\frac{\ln y-\mu}{\sigma})^2} $$

The $\mu$ and $\sigma^2$ are not mean and variance but parameters of log-normal distribution. the mean and variance of log-normal distribution can be calculated from the moment generating function of Gaussian distribution,

$$ \begin{aligned}
E[Y] &= E[e^X] = M_X(1) = e^{\mu+\frac{1}{2}\sigma^2} \\
V[Y] &= E[Y^2] - E^2[Y] = E[e^{2X}] - E^2[e^X] = M_X(2) - M_X^2(1) \\
&= e^{2\mu+2\sigma^2} - e^{2\mu+\sigma^2}
\end{aligned} $$

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

and we write $X \sim \Gamma(\lambda, r)$ if the random variable $X$ follows Gamma distributon with the rate parameter $\lambda$ and the shape parameter $r$.

## moment generating function

The moment generating function for gamma function is obtained from that for exponential distribution,

$$ M_X(t) = (\frac{\lambda}{\lambda-t})^r $$

In other words, exponential distribution is a special case of gamma distribution $\Gamma(\lambda, 1)$.

# Chi-squared distribution

If $Y \sim N(\mu, \sigma^2)$, then the variable $X=\frac{(Y-\mu)^2}{\sigma^2}$ is distributed as $\Gamma(\frac{1}{2}, \frac{1}{2})$. Because $Y=\mu \pm \sigma \sqrt{X}$, the probability density function needs sum of two parts,

$$ \begin{aligned}
f(x) &= \frac{1}{\sigma \sqrt{2\pi}} e^{-\frac{x}{2}} |\frac{d (\mu+\sigma \sqrt{x})}{dx}| + \frac{1}{\sigma \sqrt{2\pi}} e^{-\frac{x}{2}} |\frac{d (\mu-\sigma \sqrt{x})}{dx}| \\
&= \frac{1}{{2\sqrt\pi}} e^{-\frac{x}{2}}  (\frac{x}{2})^{-\frac{1}{2}}
\end{aligned} $$

# References
[Univariate Distribution Relationships](http://www.math.wm.edu/~leemis/chart/UDR/UDR.html)
