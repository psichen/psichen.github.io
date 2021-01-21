---
title: Combinations and particle statistics
tags: [permutation, combination, particle statistics]
mathjax: true
---

## Permutation

Let's first consider a set of $n$ objects, which are all different. The number of all possible arrangements (permutations) is

$$ n(n-1) \cdots 1 = n! $$

Generally, if we select $k (<n)$ objects from $n$, the number of permuations is

$$ n(n-1)\cdot\cdot\cdot(n-k+1) = \frac{n!}{(n-k)!} = P(n, k) $$

### with replacement

Previously we assumed objects were selected without replacement. If the selected object is put back into the population every time, it's called *sampling with replacement*. Easily, If $k$ objects are selected from $n$ objects with replacement, the number of permutations is

$$ n^k $$

## Combination

We now consider the number of combinations of various objects when their order is immaterial. We have already known that the number of permuations of $k$ objects from $n$ is $P(n, k)=\frac{n!}{(n-k)!}$, of which the permuations are repeated $k!$ times. So the number of *distinguishable* arrangements (combinations) of $k$ objects from $n$ is

$$ \frac{n!}{k! (n-k)!} = C(n, k) $$

Let's consider $n$ objects of which $n_1$ are identical and of type1, $n_2$ are identical and of type2, and $n_m$ are identical and of type $m$. The permutation of these $n$ objects is $n!$. However, the number of *distinguishable* arrangements is

$$ \frac{n!}{n_1! n_2! \cdots n_m!} $$

It's also called *multinomial coefficients* in polynomial equation $(x_1+x_2+ \cdots +x_m)^n$, where $n$ represents the total power number of the equation, and $n_1, n_2, \cdots n_m$ represents the power number of different variables in each expansion factors.

### with replacement

As in the case of permutations we might ask how many combinations of $k$ objects can be chosen from $n$ objects with replacement. 

$$ XX| \quad |XXX|X $$

## four different kinds of particle statistics
