---
title: Combinations and particle statistics
date: 2021-01-21 23:55:00
tags: [permutation, combination, particle statistics]
---

## Permutation

Let's first consider a set of $n$ objects, which are all different. The number of all possible arrangements (permutations) is

$$ n(n-1) \cdots 1 = n! $$

Generally, if we select $k (<n)$ objects from $n$, the number of permuations is

$$ n(n-1)\cdot\cdot\cdot(n-k+1) = \frac{n!}{(n-k)!} = P(n, k) $$

<!--more-->

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

As in the case of permutations we might ask how many combinations of $k$ objects can be chosen from $n$ objects with replacement. To calculate the value, we may image that the $n$ distinguishable objects set out on a table. Each combination of $k$ objects can then be made by pointing to $k$ objects of the $n$ objects in turn. There $k$ equivalent selections amongst $n$ different but re-choosable objects are strictly analogous to the placing of $k$ indistinguishable balls into $n$ different boxes with no restriction on the number of balls in each box.

A particular scenario in the case $k=6, n=4$ may be symbolised as

$$ XX| \quad |XXX|X $$

There are 2 balls in the first box, none in the second box, 3 balls in the third box and 1 ball in the fourth box. So we only need to consider the combination of $k+n-1$ objects consist of $k$ crosses and $n-1$ vertical lines. This is given as

$$ \frac{(k+n-1)!}{k!(n-1)!} = C(k+n-1, k) $$

## Four different kinds of particle statistics

Let's consider a partical scenario. A system contains a number $N$ of non-interacting particles, each of which can be in any of quantum states of the system. The structure of the set of quantum states is such that there exist $R$ energy levels with corresponding energies $E_i$ and degeneracies $g_i$ (i.e. the $i$th energy level contains $g_i$ quantum states). Find the numbers of distinct ways in which the particles can be distributed among the quantum states of the system such that the $i$th energy level contains $n_i$ particles, for $i=1,2,\cdots,R$, in the cases where the particles are

1. distinguishable with no restriction on the number in each state;
2. indistinguishable with no restriction on the number in each state;
3. indistinguishable with a maximum of one particle in each state;
4. distinguishable with a maximum of one particle in each state;

### Distinguishable w/o amount restriction

Let us first consider distributing the $N$ patricles among the $R$ energy levels, which is analogous to placing $N$ different balls into $R$ boxes,

$$ \frac{N!}{\underset{i=1}{\overset{R}{\large{\Pi}}} n_i!} $$

where $n_i$ is the number of particles in each energy level. Then let's multiply the number of differnet arrangement of $n_i$ particles in $g_i$ degenerate quantum states in each energy level. Becasue there is no restriction on the particle number in each quantum states, each particle can reside in any of $g_i$ degenerated quantum states. So the arrangements in this scenario is

$$ \Omega = N! \underset{i=1}{\overset{R}{\LARGE{\Pi}}} \frac{g_i^{n_i}}{n_i!} $$

Such a system of particles (for example classical gas molecules) is said to obey *Maxwell-Boltzmann statistics*.

### Indistinguishable w/o amount restriction

If the particles are indistinguishable, there is only one arrangement in which $n_i (i=1,2,\cdots,R)$ particles reside in $i$th energy level. The distinct arrangements of $n_i$ particles in $g_i$ degenerate states, however, is analogous to placing indistinguishable balls into different boxes. So the number of combination of particles is

$$ \Omega = \underset{i=1}{\overset{R}{\LARGE{\Pi}}} \frac{(n_i+g_i-1)!}{n_i! (g_i-1)!} $$

Such a system of particles (for example a gas of photons) is said to obey *Bose-Einstein statistics*.

### Indistinguishable w/ amount restriction

If the number of particles in each quantum state is either 0 or 1, the arrangements of $n_i$ particles in $g_i$ degenerate quantum states is equal to the combination of $n_i$ occupied and $g_i-n_i$ unoccupied states. So the distinct arrangements of particles is given by

$$ \Omega = \underset{i=1}{\overset{R}{\LARGE{\Pi}}} \frac{g_i!}{n_i!(g_i-n_i)!} $$

Such a system of particles (for example an electron gas) is said to obey *Fermi-Dirac statistics*.

### Distinguishable w/ amount restriction

If the particles are distinguishable, each arrangement of $n_i$ particles in the previous scenario can be reordered in $n_i!$ different ways. Multiplying the number of arrangements of $N$ distinguishable particles among $R$ energy levels, the arrangement of particles is given by

$$ \Omega = N! \underset{i=1}{\overset{R}{\LARGE{\Pi}}} \frac{g_i!}{n_i! (g_i-n_i)!} $$

Such a system of particles never occurs in nature.

## References
Riley, Kenneth Franklin, et al. *Mathematical methods for physics and engineering: a comprehensive guide*. Cambridge university press, 2002.
