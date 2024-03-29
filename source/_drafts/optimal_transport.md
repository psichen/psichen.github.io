---
title: set theory, measure theory and optimal transport theory
tags: []
---

## algebra in set theory ##

### ordered pair ###

If $a = b$, then $\{a,b\} = \{a\}$. So if we want to take into account the order in which the two elements of a pair are given, we can define the ordered pair $(a,b)$ as the set,
$$
\{ \{a\}, \{a.b\} \}
$$
Now order is important because $(a,b) \neq (b,a)$. In general one can define ordered n-tuples $(a_1, \dots, a_n)$ as $(a_1, (a_2, \dots, a_n))$.

### Cartesian product of sets ###

The Cartesian product of two sets $A \times B$ is defined as the set of all order pairs $(a,b)$ where $a \in A$ and $b \in B$.


### ring of sets ###

A collection of sets $F$ is called a ring if it satisfies,

1. if $A,B \in F$, then $A \cap B \in F$.
1. if $A,B \in F$, then $A \cup B \in F$.

The statement 1 is equivalent to the following statement,

1. if $A,B \in F$, then $A \setminus B \in F$.

Because $A \cap B = A \setminus ( A \setminus B )$.


### semiring of sets ###

A collection of sets $F$ is called a *semiring* if it satisfies,

1. $\emptyset \in F$.
2. if $A, B \in F$, then $A \cap B \in F$.
3. if $A, B \in F$, then there exists a collection of sets $C_1, C_2, \dots, C_n \in F$, such that $A \setminus B = \bigcup_{i=1}^{n} C_i$.

### algebra of sets ###

A collection of sets $F$ is called an algebra if it satisfies,

1. $\emptyset \in F$.
2. If $\omega_1 \in F$, then $\omega^{c} \in F$. ($F$ is closed under *complementation*)
3. If $\omega_1 \in F$ and $\omega_2 \in F$, then $\omega_1 \cup \omega_2 \in F$. ($F$ is closed under finite unions)

And it's called $\sigma$-algebra or $\sigma$-field if it satisfies,

1. $\emptyset \in F$.
2. If $\omega_1 \in F$, then $\omega^{c} \in F$. ($F$ is closed under *complementation*)
3. If $\omega_1, \omega_2, \dots, \omega_n, \dots \in F$, then $\bigcup_{i = 1}^{\infty} \omega_i \in F$. ($\omega_i$ is countable)

The $\sigma$-algebra generated by $X$ is defined as the intersection of all $\sigma$-algebras $A_i$ containing $X$, and denoted as $\sigma(X)$.

### sample space and measurable space ###

The sample space $\Omega$ is the set of all possible unique outcomes of the experiment.

The $\sigma$-algebra used in probability space is $\sigma(\Omega)$, the $\sigma$-algebra generated by $\Omega$. It's denoted as $\Sigma$, which is the collection of possible events from the experiment. $\Sigma$ contains all unions, compliments, compliments of unions, and unions of compliments.

the sample space $\Omega$ and $\sigma(\Omega)$ make the measurable space.

### countable and uncountable ###

the cardinality of the index set.


### measure space ###

A set function $\mu$ defined on $\Sigma$ is called a measure iff it satisfies,

1. $0 \le \mu(A) \le \infty$ for any $A \in \Sigma$.
2. $\mu(\emptyset) = 0$
3. For any sequence of pairwise disjoint sets $\{A_n\} \in \Sigma$, $\mu(\bigcup_{n = 1}^{\infty} A_n ) = \sum_{n=1}^{\infty} \mu(A_n)$.

A triplet $(\Omega, \Sigma, \mu)$ is a measure space.

## Borel field and Lebesgue measure ##

There is a unique measure $\lambda$ on $(\R,B_\R)$ that satisfies,
$$
\lambda([a,b]) = b - a
$$
for every finite interval $[a,b], -\infty < a \le b < \infty$. It's called the Lebesgue measure.

If $\lambda$ is restrict to the measurable space $([0,1], B_{[0,1]})$, then $\lambda$ is a probability measure.

## Dual problem of linear programming ##

In linear programming, we want to find the optimal vector $\boldsymbol{x}$ to minimize the cost,
$$
\begin{align*}
\text{min} \quad & \boldsymbol{c}^T \boldsymbol{x} \\
\text{s.t.} \quad & \boldsymbol{A} \boldsymbol{x} = \boldsymbol{b}, \boldsymbol{x} \ge \boldsymbol{0} \\
\end{align*}
$$

The corresponding dual problem is finding the optimal $\boldsymbol{y}$ to  maximize the production,
$$
\begin{align*}
\text{max} \quad & \boldsymbol{b}^T \boldsymbol{y} \\
\text{s.t.} \quad & \boldsymbol{A}^T \boldsymbol{y} \le \boldsymbol{c}
\end{align*}
$$

Just transpose $\boldsymbol{A}$ and switch $\boldsymbol{b}$ and $\boldsymbol{c}$.

If $\boldsymbol{A} \boldsymbol{x} = \boldsymbol{b}$ and $\boldsymbol{A}^T \boldsymbol{y} \le \boldsymbol{c}$, then $\boldsymbol{b}^T \boldsymbol{y} = (\boldsymbol{A} \boldsymbol{x})^T \boldsymbol{y} = \boldsymbol{x}^T \boldsymbol{A}^T \boldsymbol{y} \le  \boldsymbol{x}^T \boldsymbol{c}$
