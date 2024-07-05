---
title: basics about machine learning
tags: []
---

## Deep learning ##

A popular deep learning framework is `pytorch`.

### chain rule of calculus ###

If the function $f=f(g(x))$, then the derivatives is given by,
$$
f'(x) = f'(g(x)) g'(x)
$$
If the function $h$ contains multiple variables $h=h \left( f(x),g(x) \right)$, the derivatives is given by,
$$
\frac{dh}{dx} = \partial_f h \cdot \partial_x f  + \partial_g h \cdot \partial_x g
$$
Because the derivative is calculated as,
$$
\begin{align*}
        \frac{dh}{dx} &= \frac{h\left( f(x+\Delta x), g(x+\Delta x) \right) - h\left( f(x),g(x) \right)}{\Delta x} \\
        &= \frac{h\left( f(x+\Delta x), g(x+\Delta x) \right) - h\left( f(x), g(x+\Delta x) \right)}{\Delta x} + \frac{h\left( f(x), g(x+\Delta x) \right) - h\left( f(x), g(x) \right)}{\Delta x} \\
        &= \partial_f h \cdot \partial_x f + \partial_g h \cdot \partial_x g \\
\end{align*}
$$

without loss of generity, for $u_i = u_i(x), $the derivative of function $h(u_1,...u_n)$ with respect to $x$ is,
$$
\frac{dh}{dx} = \sum_{i=1}^{n} \partial_{u_i} h \cdot \partial_x u_i
$$

### cross-entropy loss function ###

### gradient decent ###

## Bayesian estimation ##

If we can gather enough samples, we can determine the probability of the feature vectors for each class $p(\boldsymbol{X} | C_k)$ as well as the prior class likelihood $p(C_k)$. According to Bayes's rule,
$$
p(A|B) p(B) = p(B|A) p(A)
$$
the likelihood of Class $C_k$ given a feature vector $\boldsymbol{X}$ is,
$$
p(C_k | \boldsymbol{X}) = \frac{p(\boldsymbol{X} | C_k) p(C_k)}{\sum_{j} p(\boldsymbol{X} | C_k) p(C_k)}
$$

### logistic regression ###

