---
title: Notes about Student's t-test and t-distribution
date: 2021-06-12 02:03:32
tags: [gamma, probability density function, t-test, maximum likelihood estimation, test statistic, likelihood ratio, type I error, type II error, power, delta function]
---

Almost every graduate student knows how to use t-test to test whether their experimental data is significantly different from the reference. As a widely used test statistic, it's useful to know the derivation of the t-distribution's analytic form, which prevents us from abusing or misinterpreting the t-test.

<!--more-->

## Maximum likelihood estimation

Let's suppose samples $\{x_{1},x_{2},\dots,x_{n}\} \in \mathcal{X} = \mathbb{R}^{n}$ are drown independently from a Gaussian distribution for which both the mean $\mu$ and the variance $\sigma^{2}$ are unknown. The likelihood function is,

$$ L(\pmb{x};\mu,\sigma^{2}) = (2 \pi \sigma^{2})^{-\frac{n}{2}} \exp[- \frac{\sum_{i=1}^{n} (x_{i} - \mu)^{2}}{2 \sigma^{2}}] $$

We choose the estimator $\hat{\mu}$ and $\hat{\sigma^{2}}$ which maximize the likelihood,

$$ \begin{aligned}
\partial_{\mu} \ln L(\pmb{x};\mu,\sigma^{2}) |_{\mu = \hat{\mu}} = \frac{\sum_{i=1}^{n} (x_{i} - \hat{\mu})}{2 \sigma^{2}} = 0 \ &\Rightarrow \ \hat{\mu} = \bar{x} \\
\partial_{\sigma^{2}} \ln L(\pmb{x};\mu,\sigma^{2}) |_{\sigma^{2} = \hat{\sigma^{2}}} = -\frac{n}{2 \hat{\sigma^{2}}} + \frac{\sum_{i=1}^{n} (x_{i} - \mu)^{2}}{2 (\hat{\sigma^{2}})^{2}} = 0 \ &\Rightarrow \ \hat{\sigma^{2}} = \frac{\sum_{i=1}^{n} (x_{i} - \mu)^{2}}{n} = s^{2}
\end{aligned}  $$

where $s^{2}$ is the sample variance when the mean of population $\mu$ is known (degree of freedom = $n$).

### bias estimator

The maximum likelihood estimator $\hat{\sigma^{2}} = s^{2}$ is unbiased when the mean $\mu$ is known. However, if $\mu$ is unknown, an intuitive idea is to replace $\mu$ with the estimator $\hat{\mu} = \bar{x}$. Here, $\hat{\mu}$ is also a random variable which spreads values around $\mu$. Then, the uncorrected estimator $\hat{\sigma^{2}}$ is biased,

$$ \begin{aligned}
E[ \hat{\sigma^{2}} ] &= \frac{1}{n} E[ \sum_{i=1}^{n} (x_{i} - \bar{x})^{2} ] \\
&= \frac{1}{n} E[ \sum_{i=1}^{n} (x_{i} - \mu)^{2} - \sum_{i=1}^{n} 2 (x_{i} - \mu) (\bar{x} - \mu) + \sum_{i=1}^{n} (\bar{x} - \mu)^{2}] \\
&[ \text{split as } (x_{i} - \mu + \mu - \bar{x})] \\
&= \frac{\sum_{i=1}^{n} (x_{i} - \mu)^{2}}{n} - \frac{\sum_{i=1}^{n} (\bar{x} - \mu)^{2}}{n} \\
&= (1 - \frac{1}{n}) \sigma^{2}
\end{aligned}  $$

It underestimates the population variance because the estimator $\hat{\mu}$ introduces new uncertainty into the equation. Further, it can be thought as the estimator $\hat{\mu}$ introduces a new constraint which "consumes" one degree of freedom. Thus, the unbiased estimator can be corrected by $\hat{\sigma^{2}} = \sum_{i=1}^{n} (x_{i} - \bar{x})^{2} / (n-1)$.

### standard deviation & standard error

As we can see, samples and estimators are both random variables. They have corresponding terms to describe their spread.

**standard deviation**

Standard deviation (SD) is the positive root of the variance, or the root of 2nd-order central moment $\frac{1}{N} \sum_{i=1}^{N} (x_{i} - m_{1})^{2}$.

**standard error**

Standard error (SE) is the uncertainty of the estimator $\hat{a}$, namely the standard deviation of the sampling distribution $P(\hat{a}|a)$. For the biased estimator $E(\hat{a}) = a + b(a)$, the spread around the true value $a$ is,

$$ \begin{aligned}
\epsilon^{2}_{\hat{a}} &= E[ (\hat{a} - a)^{2} ] = E[ (\hat{a} - E[\hat{a}] + E[\hat{a}] - a)^{2} ] \\
&= E[ (\hat{a} - E[\hat{a}])^{2} ] + E[ (E[\hat{a}] - a)^{2} ] = V(\hat{a}) + b^{2}(a)
\end{aligned}  $$

So $\epsilon^{2}_{\hat{a}}$ is the sum of squares of the statistical and systematic errors. In addition, $\epsilon_{\hat{a}}$ is called the root mean square error (RMSE). Specifically, if the estimator is the unbiased mean estimator $\hat{\mu} = \bar{x}$, the standard error of mean (SEM) is the root of the variance of sample mean,

$$ \epsilon_{\hat{\mu}} = (E[ (\bar{x} - \mu)^{2} ])^{\frac{1}{2}} = \frac{\sigma}{\sqrt{n}} $$

where $\sigma$ is the standard deviation of the population and $n$ is the number of groups of samples.

## Neyman-Pearson lemma

Neyman-Pearson lemma tells us which test statistic we should use. Before introducing Neyman-Pearson lemma, we should know the type I error $\alpha$ and the type II error $\beta$ in test statistics.

### type I error & type II error

In the test of null hypothesis $H_{0}$ against alternative hypothesis $H_{1}$, false negative is called type I error denoted by $\alpha$ and false positve is called type II error denoted by $\beta$. Supposing the rejection region $\mathcal{R} = \{x : \text{reject } H_{0} \}$ and the acceptance region $\bar{\mathcal{R}} = \mathcal{X} - \mathcal{R}$, some definition is listed,

$$ \text{Table 1 Type I & II error and related items} $$
$$ \begin{array}{cccc}
\hline
\text{ Denotation } & \text{ PDF integral } & \text{ Event fraction } & \text{ Term } \\
\hline
\alpha & \int_{\mathcal{R}} f(x | H_{0}) \ dx & FP/(TN + FP) & \text{ Type I error/Significance level } \\
\beta & \int_{\bar{\mathcal{R}}} f(x | H_{1}) \ dx & FN/(TP + FN) & \text{ Type II error } \\
1 - \alpha & \int_{\bar{\mathcal{R}}} f(x | H_{0}) \ dx & TN/(TN + FP) & \text{ Specificity } \\
1 - \beta & \int_{\mathcal{R}} f(x | H_{1}) \ dx & TP/(TP + FN) & \text{ Sensitivity/Power } \\
( 1-\beta )/( 1-\beta+\alpha ) & - & TP/(TP + FP) & \text{PPV} \\
( 1-\alpha )/( 1-\alpha+\beta ) & - & TN/(TN + FN) & \text{NPV} \\
\hline
\text{* PPV: Positive precdicted value;} & \text{NPV: Negative predicted value;} \\
\end{array} $$

The graphic demonstration can be seen on [wiki](https://en.wikipedia.org/wiki/Sensitivity_and_specificity#/media/File:PPV,_NPV,_Sensitivity_and_Specificity.svg).

### the compromised test

Since $\alpha$ and $\beta$ are counter-parts, we usually can't minimize them simultaneously. So we have a compromise that the type I error (significance level) of the test statistic has an up limit $\alpha_{0}$ while the power $1 - \beta_{0}$ is maximized.

In order to find such a test statistic, we consider a set of the rejection probability functions $\phi(x)$ represents the probability of rejecting the null hypothesis $H_{0}$ given the data $x$,

$$ \phi(x) =
\begin{cases}
1, \ & x \in \mathcal{R} \\
0, \ & x \in \mathcal{\bar{R}}
\end{cases}
$$
Thus type I error can be interpreted as the expectation of $\phi(x)$ under the null hypothesis $H_{0}$ and power as the expectation of $\phi(x)$ under the alternative hypothesis $H_{1}$,

$$ \begin{aligned}
\alpha &= E_{H_{0}} [ \phi(x) ] = \int_{\mathcal{R}} f(x|H_{0}) \ dx \\
1 - \beta &= E_{H_{1}} [ \phi(x) ] = \int_{\mathcal{R}} f(x|H_{1}) \ dx
\end{aligned} $$

Different test statistic functions $\lambda(x)$ may have different rejection region $\mathcal{R}$, hence defining level and power of the test. Then the question is to find a suitable rejection region $\mathcal{R}$ where $x$ satisfy,

$$ \begin{aligned}
\text{maximize } &\int_{\mathcal{R}} f(x | H_{1}) \ dx = 1 - \beta_{0} \\
\text{ s.t. } &\int_{\mathcal{R}} f(x | H_{0}) \ dx \leq \alpha_{0}
\end{aligned}  $$

It's equivalent to following states,

$$ \begin{array}{ll}
(a) & E_{H_{0}}[ \phi(x) ] = \alpha_{0} \\
(b) & \phi(x) =
\begin{cases}
1, \ & x \in \mathcal{R} = \{ x : \frac{f(x|H_{0})}{f(x|H_{1})} \lt k \} \\
\gamma, \ & x \in \{ x : \frac{f(x|H_{0})}{f(x|H_{1})} = k \} \\
0, \ & x \in \mathcal{\bar{R}} = \{ x : \frac{f(x|H_{0})}{f(x|H_{1})} \gt k \}
\end{cases}
\end{array} $$

where $\gamma$ is the reject probability when the likelihood ratio $\frac{f(x|H_{0})}{f(x|H_{1})}$ equals $k$ and is chosen to satisfy the state (a).

**Sufficiency**:

*If $\phi(x)$ satisfies state (a) and (b), then it is most powerful over other test statistics at the significance level $\alpha_{0}$.*

From the state (b), we have the inequality,

$$ \int_{\mathcal{X}} [ \phi(x) - \phi'(x) ][ f(x|H_{0}) - k \cdot f(x|H_{1}) ] \ dx \le 0 $$
$$ \text{[ the definition of $\phi(x)$ ]} $$

where $\phi'(x)$ is an arbitrary test. Expand the integrand,

$$ \int_{\mathcal{X}} [ \phi(x) f(x|H_{0}) - \phi'(x) f(x|H_{0}) - k \cdot \phi(x) f(x|H_{1}) + k \cdot \phi'(x) f(x|H_{1})] \ dx \le 0 $$

Since $\int_{\mathcal{X}} \phi'(x) f(x|H_{0}) \ dx = \int_{\mathcal{R}} f(x|H_{0}) \ dx = \alpha' \le \alpha_{0}$,

$$ (1 - \beta_{0}) - (1 - \beta') \ge ( \alpha_{0} - \alpha' )/k \ge 0 $$

Thus the test $\phi(x)$ is most powerful at the significance level $\alpha_{0}$.

**Necessity**:

*If a test $\phi'(x)$ is most powerful at significance level $\alpha'$ (where $\alpha' \le \alpha_{0}$ by hypothesis), it satisfies the state (a) and the state (b), namely $\alpha' = \alpha_{0}$ and $\phi'(x) = \phi(x)$, except possibly where $\frac{f(x|H_{0})}{f(x|H_{1})} = k$, or $\alpha' \lt \alpha_{0}$ while the power of $\phi'(x)$ is 1.*

We may assume $\phi'(x) \neq \phi(x)$ for $\forall x \in S$, then we can define the sets,

$$ \begin{aligned}
S^{+} &= \{ x : \phi'(x) > \phi(x) \} \\
S^{=} &= \{ x : \phi'(x) = \phi(x) \} \\
S^{-} &= \{ x : \phi'(x) < \phi(x) \} \\
S &= S^{+} \cup S^{-}
\end{aligned}  $$

Also, considering the integral,

$$ \int_{\mathcal{X}} [ \phi'(x) - \phi(x) ] [ f(x|H_{0}) - k \cdot f(x|H_{1}) ] \ dx = \int_{S} (\cdot) + \int_{S^{=}} (\cdot) + \int_{\{x : f(x|H_{0}) = k \cdot f(x|H_{1})\}} (\cdot) \ge 0 $$

where the last two integrals are zero over their intgrated domain,

$$ \int_{S} [ \phi'(x) - \phi(x) ] [ f(x|H_{0}) - k \cdot f(x|H_{1}) ] \ dx \gt 0 $$

$$ (1-\beta) - (1-\beta') \gt \frac{1}{k} (\alpha_{0} - \alpha') \ge 0 $$

which contradicts the assumption that the test $\phi'(x)$ is most powerful. So $\phi'(x)$ should satisfy the state (b). 

As for the state (a), because the significance level $\alpha'$ and the power $1-\beta'$ are both monotonically increasing function of the measure of rejection region $\mu(\mathcal{R})$. So we can keep increasing $\mu(\mathcal{R})$ until either $\alpha' = \alpha_{0}$ (the power reaches its maximum) or $1 - \beta' = 1$ ($\alpha'$ is still less than $\alpha_{0}$).

Here we omit the proof of its existence. Readers may find it out from the reference.

From above discussion we may come to the conclusion that the likelihood ratio is the test statistic which is most powerful at most type I error. It should be noticed there may be a test statistic of which the power is 1 while the significance level is less than $\alpha_{0}$. However, in such the case data are so distinguished that there is no need to test.

## Generalized likelihood ratio

If null hypothesis $H_{0}$ or alternative hypothesis $H_{1}$ is composite, we don't have a unique form of likelihood function because the composite hypothesis covers a set of values from parameter space. However, we can still use the maximum likelihood estimation to get a likelihood function using estimated parameters as long as we know the functional form of the population from which data is drawn.

Suppose we want to test the null hypothesis $H_{0} = \{ \pmb{a} : \pmb{a} \in \mathcal{S} \}$ against the alternative hypothesis $H_{1} = \{ \pmb{a} : \pmb{a} \in \mathcal{\bar{S}} = \mathcal{A} - \mathcal{S} \}$, where $\mathcal{S}$ is the parameter subspace of the full parameter space $\mathcal{A}$. If the parameter values are allowed to vary only over the subspace $\mathcal{S}$, then the likelihood function will be maximized at the point $\hat{\pmb{a}}_{\mathcal{S}}$, which may or may not coincide with the global maximum $\hat{\pmb{a}}$ over the full space $\mathcal{A}$. So we can write down the generalized likelihood ratio,

$$ \lambda(x) = \frac{L(x; \hat{\pmb{a}}_{\mathcal{S}})}{L(x; \hat{\pmb{a}})} $$

The ratio illustrates the general situation that if the global estimator $\hat{\pmb{a}}$ fall in or near the subspace $\mathcal{S}$ then the sample will be considered consistent with the null hypothesis $H_{0}$ and the value of $\lambda$ will be near unity. If $\hat{\pmb{a}}$ is distant from $\mathcal{S}$ then the sample will not be in accord with $H_{0}$ and ordinarily $\lambda$ will have a small positive value. So $\lambda(x)$ represents the probability that the sample data is drawn from $H_{0}$.

If samples are all drawn independently from Gaussian distribution for which both the mean and variance are unknown and we want to test the hypotheses,

$$ H_{0} : \mu = \mu_{0} \text{ and } H_{1} : \mu \neq \mu_{0} $$

Then the most powerful test at level $\alpha$ is the t-test.

Under $H_{0}$, the maximum-likelihood estimator for the variance over the parameter subspace $\mathcal{S}$ is 

$$ \hat{\sigma_{\mathcal{S}}^{2}} = \frac{1}{n} \sum_{i=1}^{n} (x_{i} - \mu_{0})^{2} $$

and under $H_{1}$, the maximum-likelihood estimators for the mean and variance over the full parameter sapce $\mathcal{A}$ are, 

$$ \begin{aligned}
\hat{\mu} &= \bar{x} \\
\hat{\sigma^{2}} &= \frac{1}{n} \sum_{i=1}^{n} (x_{i} - \bar{x})^{2} = s^{2}
\end{aligned}  $$

Substitute these parameter estimators into the functional form of likelihood function, we will get the generalized likelihood ratio,

$$ \lambda(x) = \frac{L(x; \mu_{0}, \hat{\sigma_{\mathcal{S}}^{2}})}{L(x; \bar{x}, s^{2})} = ( \frac{\hat{\sigma_{\mathcal{S}}^{2}}}{s^{2}} )^{-\frac{n}{2}} = [ \frac{\sum_{i=1}^{n} (x_{i} - \mu_{0})^{2}}{\sum_{i=1}^{n} (x_{i} - \bar{x})^{2}} ]^{-\frac{n}{2}} = ( 1 + \frac{(\bar{x} - \mu_{0})^{2}}{s^{2}} )^{-\frac{n}{2}} $$
$$ \text{[ split $\sum_{i=1}^{n} (x_{i} - \mu_{0})^{2}$ as $\sum_{i=1}^{n} (x_{i} - \bar{x} + \bar{x} - \mu_{0})^{2} = \sum_{i=1}^{n} (x_{i} - \bar{x})^{2} +  \sum_{i=1}^{n} (\bar{x} - \mu_{0})^{2}]$} $$

Substitute $t = \frac{\bar{x} - \mu_{0}}{s / \sqrt{n-1}}$ as the normalization of sample mean distribution into $\lambda(x)$,

$$ T(t) = ( 1 + \frac{t^{2}}{n-1} )^{-\frac{n}{2}} $$

We can replace the biased estimator $s^{2}$ by the unbiased estimator $s'^{2} = \frac{\sum_{i=1}^{n} (x_{i} - \bar{x})^{2}}{n-1}$,

$$ T(t) = (1 + \frac{t^{2}}{n})^{-\frac{n}{2}} $$

where $t = \frac{\bar{x} - \mu_{0}}{s' / \sqrt{n}}$.

## Student's t-test

As $T(t)$ represents the probability that sample data is drawn from $H_{0}$, we may reject $H_{0}$ if $T(t)$ is small, say $T(t) < k$. Because $T(t)$ is a monotonically decreasing function of $t$, the rejection region $\mathcal{R} = \{ t : T(t) < k \}$ is equivalent to $\mathcal{R} = \{ t : t > p \}$, where $k$ and $p$ are some constants satisfying $T(p) = k$. The significance level of the test then can be determined by the measure of $\mathcal{R}$,

$$ \alpha = \mu(\mathcal{R}) = \int_{\mathcal{R}} f(t|H_{0}) \ dt $$

To carry out a test, we need to determine the significance level $\alpha$ first (usually $\alpha = 0.05$). From $\alpha$ we can derive reversely $p$ which defines $\mathcal{R}$. In order to do that, we need to know the function $f(t|H_{0})$.

We already have $t = \frac{\bar{x} - \mu_{0}}{ s/\sqrt{n-1} }$, where $\bar{x}$ and $s$ are both random variables. We may get $f(t|H_{0})$ by considering changes of variables in probability function,

$$ f_{t,s}(t,s | H_{0}) \ dt ds = f_{\bar{x},s}(\bar{x}, s | H_{0}) \ d\bar{x} ds $$

and its marginal probability density function,

$$ f(t|H_{0}) = \int f_{t,s}(t,s | H_{0}) \ ds $$

### independent mean and variance

The joint sampling distribution (mean and sampling) for Gaussian distribution is the product of two sample distribution because the mean and variance are allowed to vary independently in Gaussian distribution, namely, $f(\bar{x}, s) = f(\bar{x}) f(s)$. Suppose we have the Gaussian distribution of independent samples $x_{i}$,

$$ f(\pmb{x} | H_{0}) = (2 \pi \sigma^{2})^{-\frac{n}{2}} \exp[ -\frac{\sum_{i=1}^{n} (x_{i} - \mu_{0})^{2}}{2 \sigma^{2}} ] $$

Let's define new variables $y_{1} = \bar{x}$ and $y_{i} = x_{i} - \bar{x}, (i = 2, 3, \dots, n)$ corresponding to the old $n$ variables $x_{i}$ before transformation, we have,

$$ f(\pmb{x}|H_{0}) \ dV = f(\pmb{x}(\pmb{y})| H_{0}) |J| \ dy_{1} \cdots dy_{n} $$

where the [Jacobian determinant](https://psichen.github.io/2021/02/04/geometric-interpretation-about-Jacobian-determinant/) is a constant,

$$ J = \frac{\partial (x_{1}, x_{2}, \cdots, x_{n})}{\partial (y_{1}, y_{2}, \cdots, y_{n})} =
\begin{bmatrix}
1 & -1 & -1 & \cdots & -1 \\
1 & 1 & 0 & \cdots & 0 \\
1 & 0 & 1 & \cdots & 0 \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
1 & 0 & 0 & \cdots & 1 \\
\end{bmatrix}
= c $$

So we have,

$$ \begin{aligned}
f(\pmb{x} | H_{0}) \ dV &= A \exp[ -\frac{\sum_{i=1}^{n} (x_{i} - \bar{x})^{2}}{2 \sigma^{2}} ] \exp[ - \frac{n (\bar{x} - \mu_{0})^{2}}{2 \sigma^{2}} ] \ dV \\
&= A' \exp[-\frac{(-\sum_{i=2}^{n} y_{i})^{2} + \sum_{i=2}^{n} y_{i}^{2}}{2 \sigma^{2}}] \exp[-\frac{n (y_{1} - \mu_{0})^{2}}{2 \sigma^{2}}] \ dy_{1} \cdots dy_{n}
\end{aligned}  $$
$$ [ \sum_{i=1}^{n} (x_{i} - \bar{x}) = 0 \Rightarrow (x_{1} - \bar{x}) = - \sum_{i=2}^{n} (x_{i} - \bar{x}) ] $$

Because $f_{Y_{1}, Y_{2}, \dots, Y_{n}}(y_{1}, y_{2}, \dots, y_{n})$ can be factored into a product of functions that only depend respective set of statistics, it follows that $Y_{1} = \bar{X}$ is independent of $Y_{i} = X_{i} - \bar{X}, i = 2,3,\dots,n$. Further, since $X_{1} - \bar{X}$ is a function of $Y_{i} = X_{i} - \bar{X}, i = 2, 3, \dots, n$, $\bar{X}$ is also independent of $X_{1} - \bar{X}$. Therefore $\bar{X}$ is independent of $X_{i} - \bar{X}, i=1,2,\dots,n$. Similarly, the sample variance $s^{2} = \frac{\sum_{i=1}^{n} (x_{i} - \bar{x})^{2}}{n}$ is a function of $X_{i} - \bar{X}$, so the sample mean $\bar{X}$ is independent of the sample variance $s^{2}$ or the sample standard deviation $s$.

### joint sampling distribution

Because $\bar{x}$ and $s$ are independent, or orthogonal in vector space, the volume in $\bar{x}-s$ axis is the direct product of the measure $\mu(\bar{x})$ and the measure $\mu(s)$. Since $n \bar{x} = \sum_{i=1}^{n} x_{i}$ is a $n-1$ dimensional hyperplane and $n s^{2} = \sum_{i=1}^{n} (x_{i} - \bar{x})^{2}$ is a $n-1$ dimensional hypersphere, the intersection is a $n-2$ hypersphere of which the volume is proportional to $s^{n-1}$. So the infinitesimal volume $dV$ is equal to $s^{n-2} \ ds d\bar{x}$. We have already known that $f(\pmb{x}|H_{0}) = A \exp[-\frac{\sum_{i=1}^{n} (x_{i} - \bar{x})^{2}}{2 \sigma^{2}}] \exp[-\frac{n(\bar{x} - \mu_{0})^{2}}{2 \sigma^{2}}]$, so the joint sampling distribution $f_{\bar{x},s}(\bar{x},s|H_{0})$ should satisfy,

$$ f(\pmb{x}|H_{0}) \ dV = A \exp[ -\frac{n s^{2}}{2 \sigma^{2}} ] \exp[ -\frac{n(\bar{x} - \mu_{0})^{2}}{2 \sigma^{2}} ] s^{n-2} \ d\bar{x}ds = f_{\bar{x}, s}(\bar{x},s|H_{0}) \ d\bar{x}ds $$

where $A$ can be gotten from the normalization condition $\iint f_{\bar{x},s}(\bar{x},s|H_{0}) \ d\bar{x}ds = 1$.

### t-distribution

As we can see,

$$ f_{\bar{x},s}(\bar{x},s|H_{0}) \sim \exp[-\frac{n (\bar{x} - \mu_{0})^{2}}{2 \sigma^{2}}] \exp[ -\frac{n s^{2}}{2 \sigma^{2}} ] s^{n-2} $$

Replace $\bar{x}$ with $t = \frac{\bar{x} - \mu_{0}}{s / \sqrt{n-1}}$,

$$ f_{t,s}(t,s|H_{0}) \sim \exp[ -\frac{n s^{2} t^{2}}{2 \sigma^{2} (n-1)} ] \exp[ -\frac{n s^{2}}{2 \sigma^{2}} ] s^{n-1} $$

So we can get the t-distribution from marginal probability density function,

$$ f_{t}(t|H_{0}) = \int f_{t,s}(t,s|H_{0}) \ ds \sim \int_{0}^{\infty} \exp[ -\frac{n s^{2} t^{2}}{2 \sigma^{2} (n-1)} ] \exp[ -\frac{n s^{2}}{2 \sigma^{2}} ] s^{n-1} \ ds $$

Recall the gamma integral $\Gamma(r) = \int_{0}^{\infty} x^{r-1} e^{-x} \ d{x}$, we may substitute $x = s \sqrt{\frac{n}{2 \sigma^{2}} (1 + \frac{t^{2}}{n-1})}$ into the integral,

$$ f_{t}(t|H_{0}) \sim (1 + \frac{t^{2}}{n-1})^{-\frac{n}{2}} \underbrace{\int_{0}^{\infty} x^{n-1} e^{-x^{2}} \ d{x}}_{\frac{1}{2} \Gamma(\frac{n}{2})} \sim (1 + \frac{t^{2}}{n-1})^{-\frac{n}{2}} $$

The normalization factor can be gotten from the integral $\int f_{t}(t|H_{0}) \ dt = 1$.

Otherwise, considering that $u = \frac{\bar{x} - \mu}{\sigma / \sqrt{n}}$ follows the [standard normal distribution](https://psichen.github.io/2021/03/10/common-probability-density-functions/) $N(0,1)$ and $v = \frac{n s^{2}}{\sigma^{2}}$ follows the [Chi-square distribution](https://psichen.github.io/2021/03/10/common-probability-density-functions/) $\chi^{2}(n-1)$, then $t$ may be rearranged as,

$$ t = \frac{\bar{x} - \mu}{s / \sqrt{n-1}} = \frac{u}{\sqrt{v / (n-1)}}$$

Also, $u$ and $v$ should be independent. It seem like a bit complicated for the change of variables, but it brings simple distributions that the variables follow. Using $\delta$ function, we have the probability density function for $t$,

$$ f(t) = \iint \delta(t - \frac{u}{\sqrt{v / (n-1)}}) \underbrace{\frac{1}{\sqrt{2 \pi}} \exp[ -\frac{u^{2}}{2} ]}_{g(u)} \underbrace{\frac{v^{(n-2)/2} \exp[ -v/2 ]}{2^{n/2} \Gamma(n/2)}}_{h_{n-1}(v)} \ dudv $$

Substitute $y = \frac{u}{\sqrt{v/(n-1)}}$, then,

$$ \begin{aligned}
f(t) &= \iint \delta(t - y) g(\sqrt{\frac{v}{n-1}}y) h_{n-1}(v) \sqrt{\frac{v}{n-1}} \ dydv = \int_{0}^{\infty} \sqrt{\frac{v}{n-1}} h_{n-1}(v) g(\sqrt{\frac{v}{n-1}}t) \ dv \\
&= \int_{0}^{\infty} \sqrt{\frac{v}{n-1}} \frac{1}{\sqrt{2 \pi}} \exp[ -\frac{v t^{2}}{2 (n-1)} ] \frac{v^{(n-3)/2} \exp[ -v/2 ]}{2^{(n-1)/2} \Gamma(\frac{n-1}{2})} \ dv \\
&= \frac{1}{\sqrt{\pi (n-1)} 2^{\frac{n}{2}} \Gamma(\frac{n-1}{2})} \int_{0}^{\infty} v^{\frac{n-2}{2}} \exp[ - \frac{v}{2} (1 + \frac{t^{2}}{n-1}) ] \ dv \\
&[ x = \frac{v}{2} (1 + \frac{t^{2}}{n-1}) ] \\
&= \frac{1}{\sqrt{\pi (n-1)} \Gamma(\frac{n-1}{2})} (1 + \frac{t^{2}}{n-1})^{-\frac{n}{2}} \int_{0}^{\infty} x^{-\frac{n}{2}} e^{-x} \ dx
\end{aligned}  $$

Finally, we get the analytic form t-distribution for testing sample data drawn independently from Gaussian distribution with unknown $\mu$ and $\sigma^{2}$,

$$ f_{t}(t|H_{0}) =  \frac{1}{\sqrt{(n-1) \pi}} \frac{\Gamma(\frac{n}{2})}{\Gamma(\frac{n-1}{2})} (1 + \frac{t^{2}}{n-1})^{-\frac{n}{2}} $$

## References

1. [Simple alternatives and the Neyman-Pearson lemma](https://web.stanford.edu/class/archive/stats/stats200/stats200.1172/Lecture06.pdf)
2. [Neyman-Pearson Lemma](https://web.stanford.edu/~lmackey/stats300a/doc/stats300a-fall15-lecture13.pdf)
3. [Show $\bar{X}$ and $S^{2}$ are independent](http://www2.stat.duke.edu/courses/Fall18/sta611.01/Lecture/lec12_mean_var_indep.pdf)
4. [Derivation of the $t$-Distribution](https://shoichimidorikawa.github.io/Lec/ProbDistr/t-e.pdf)
