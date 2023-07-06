---
title: basics about machine learning
tags: []
---

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

## Deep learning ##

A popular deep learning framework is `pytorch`.

### cross-entropy loss function ###

### gradient decent ###

