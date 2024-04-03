---
title: stochastic processes in bioreaction
tags: [probability transition matrix, correalton function, detailed balance]
---

## Variance sum rule ##

### variance & correlation ###

For the random variable $X$, the variance is given by,
$$
\begin{align*}
\text{Var}[X] &= \text{E}[(X-\overline{X})^2] \\
&= \text{E}[X^2] - \text{E}[X]^2 \\
\end{align*}
$$
For two random variables $X$ and $Y$, the variance is given by,
$$
\begin{align*}
\text{Var}[X+Y] &= \text{E}[(X+Y)^2] - \text{E}[X+Y]^2 \\
&= \text{E}[X^2] + 2 \text{E}[XY] + \text{E}[Y^2] -\text{E}[X]^2 - 2\text{E}[X]\text{E}[Y] - \text{E}[Y]^2 \\
&= (\text{E}[X^2] -\text{E}[X]^2) + (\text{E}[Y^2] - \text{E}[Y]^2) + 2 (\text{E}[XY] - \text{E}[X]\text{E}[Y]) \\
&= \text{Var}[X] + \text{Var}[Y] + 2 \text{Cov}[X, Y] \\
\end{align*}
$$
when $X$ and $Y$ have a time delay $t$, the covariance $\text{Cov}[X_t, Y_0] = \text{E}[X_t Y_0] - \text{E}[X_t] \text{E}[Y_0]$ is also called the *connected correlation function* $C_{XY}(t)$.

### stochastic overdamped Langevin equation ###

The overdamped Langevin equation is given by,
$$
\begin{equation}
\dot{x}_t = \mu F_t + \sqrt{2D} \eta_t \label{Langevin}
\end{equation}
$$
where $\eta_t$ is Gaussian with first two moments $\overline{\eta_t}=0$ and $\overline{\eta_t \eta_{t'}}=\delta (t-t')$, so the variance is given by the integral of $\overline{\eta_t \eta_{t'}}$,
$$
\int_{-\infty}^{\infty} \overline{\eta_t \eta_{t'}} \, dt' = \int_{-\infty}^{\infty} \delta(t-t') \, dt' = \overline{\eta_t^2} = 1
$$
By transposing and integrating Eq $\eqref{Langevin}$, we get,
$$
\begin{equation}
x_t - x_0 - \int_0^t \mu F_{t'} \, dt' = \sqrt{2D} \int_0^t \eta_t \, dt' \label{integral}
\end{equation}
$$
Taking the variance of both sides of Eq $\eqref{integral}$,
$$
\begin{align*}
        \text{Var[LHS]} &= \text{Var}[\Delta x_t] + \text{Var}[\int_0^t \mu F_{t'}\,dt'] - 2 \text{Cov}[\Delta x_t , \int_0^t \mu F_{t'}\,dt'] \\
        &= \text{Var}[\Delta x_t] + \text{Var}[\int_0^t \mu F_{t'} \, dt'] + 2 \underbrace{\text{E}[\Delta x_t]}_{=0} \text{E}[\int_0^t \mu F_{t'} \, dt'] - 2 \text{E}[(x_t - x_0) \int_0^t \mu F_{t'} \, dt'] \\
        &= \text{Var}[\Delta x_t] + \text{Var}[\int_0^t \mu F_{t'} \, dt'] - 2 \mu \int_0^t \left( C_{xF}(t') - C_{Fx}(t') \right) \, dt' \\
\end{align*}
$$
In the last step to get the correlation function $C_{xF}(t')$ and $C_{Fx}(t')$, the order of integral is changed (omitting constant parameters),
$$
\text{E}[(x_t - x_0) \int_0^t F_{t'} \, dt'] = \int_0^t \left( \text{E}[x_t F_{t'}] - \text{E}[x_0 F_{t'}] \right) \, dt'
$$
Because $t' \in [0, t]$, the lag time between $x_t$ and $F_{t'}$ will also be $[0, t]$, thus we get the integral of correlations,
$$
\int_0^t \left( \text{E}[x_t F_{t'}] - \text{E}[x_0 F_{t'}] \right) \, dt' = \int_0^t \left( C_{xF}(t') - C_{Fx}(t') \right) \, dt'
$$

meanwhile the variance of RHS is,
$$
\text{Var[RHS]} = 2Dt
$$

## Stratonovich integral ##


The likelihood of $X$ becoming $Y$, or $Y$ becoming $X$, is determined by the chemical potential difference according to Gibbsian chemical thermodynamics,
$$
\mu_X = \mu_X^o+k_BT \ln c_X \\
\mu_Y = \mu_Y^o+k_BT \ln c_Y \\
$$
The internal energy of reactants ($\mu_X^o$ and $\mu_Y^o$) can be determined by rate constants,
$$
\mu_Y^o - \mu_X^o = k_BT \ln (\frac{c_X^*}{c_Y^*}) = k_BT \ln (\frac{k^-}{k^+})
$$
Therefore, for an arbitrary reaction:

```tikz
\usetikzlibrary {arrows.meta}
\begin{document}
\begin{tikzpicture}
\node (X) {\Large X};
\node [xshift=2cm] (Y) {\Large Y};
\draw [arrows={-Stealth[left]}] (X) to [bend left=5] node [midway, above] {\large $k^+$} (Y);
\draw [arrows={-Stealth[left]}] (Y) to [bend left=5] node [midway, below] {\large $k^-$} (X);
\end{tikzpicture}
\end{document}
```

the chemical potential difference is determined by flux,
$$
\Delta \mu = k_BT \ln (\frac{k^-}{k^+}) + k_BT \ln (\frac{c_Y}{c_X}) = k_BT \ln (\frac{J^-}{J^+})
$$
Besides, $\Delta \mu$ and the net flux $J=J^+ - J^-$ hold the inequality,
$$
\Delta \mu \times J \le 0
$$
representing the amount of energy consumed per unit time.

## Wegscheider conditions ##

For each oriented cycle of elementary processes the product of kinetic constants is equal to the product of kinetic constants of the reverse processes.

Let's consider a circular reaction,

```tikz
\usetikzlibrary {arrows.meta}
\begin{document}
\begin{tikzpicture}

\node(i) at (0,0) [] {\Large $p_i$};
\node(j) at (-2,-3) [] {\Large $p_j$};
\node(k) at (2,-3) [] {\Large $p_k$};

\draw [arrows = {-Stealth[left]}] (i) to [bend left=5] node [midway, above left] {\large $k_{ij}$} (j);
\draw [arrows = {-Stealth[left]}] (j) to [bend left=5] node [midway, below right] {\large $k_{ji}$} (i);

\draw [arrows = {-Stealth[left]}] (i) to [bend left=5] node [midway, above right] {\large $k_{ik}$} (k);
\draw [arrows = {-Stealth[left]}] (k) to [bend left=5] node [midway, below left] {\large $k_{ki}$} (i);

\draw [arrows = {-Stealth[left]}] (j) to [bend left=5] node [midway, above] {\large $k_{jk}$} (k);
\draw [arrows = {-Stealth[left]}] (k) to [bend left=5] node [midway, below] {\large $k_{kj}$} (j);

\end{tikzpicture}
\end{document}
```

We therefore have as the conditions imposed by the principle of detail balancing,
$$
k_{ij} p_i = k_{ji} p_j \\
k_{jk} p_j = k_{kj} p_k \\
k_{ki} p_k = k_{ik} p_i \\
$$
where $k_{ij}$ is the rate constant of the reaction $i \rightarrow j$. So we can get the Wegscheider condition by multiplying all the above equations. In general case, for every pathway connecting states $i_n, (n=0,1,\dots,n)$, the Wegscheider condition is,
$$
\frac{k_{i_0, i_1} k_{i_1, i_2} \cdots k_{i_n, i_0}}{k_{i_1, i_0} k_{i_2, i_1} \cdot k_{i_0 i_n}} = 1
$$
It can be shown mathematically that if and only if the Wegscheider condition is satisified for every possible cycle in the kinetic network, then the entire system is at equilibrium, and its stochastic dynamic is time-reversible.

## Master equation ##

For an irreversible reaction,
$$
A \overset{k}{\to} B
$$
where the random variable $X(t)$ is the number of $A$ molecules at time $t$ and the probability of number of $A$ molecules is $P_x(t) = \text{Prob}\{ X(t) = x\}$. The probability of transition $x \to x-1$ in the interval $(t,t+\Delta t)$ is $k x \Delta t + O(\Delta t)$. So the time-dependent probability $P_x(t+\Delta t)$ is given by,
$$
P_x(t+\Delta t) = \underbrace{k (x+1) \Delta t}_{x+1 \to x} \cdot P_{x+1}(t) + \underbrace{(1 - k x \Delta t)}_{x \to x} \cdot P_x(t)
$$
By transposing the equation and taking the limit $\Delta t \to 0$, the differential of probability is given by,
$$
\frac{dP_x(t)}{dt} = k (x+1) P_{x+1}(t) - k x P_x(t)
$$
Multiplying $x$ on both side of the equation and summing over all $x$, then stochastic equation becomes the standard chemical rate equation as the law of mass action,
$$
\begin{align*}
        \frac{d< x >}{dt}  &= k \sum_x x(x+1)P_{x+1}(t) - k \sum_x x^2 P_x(t) \\
        &= k \left( < (x+1)^2 > - < (x+1) > - <x^2> \right) \\
        \frac{dn_A}{dt} &= -k n_A \\
\end{align*}
$$

1. McQuarrie, Donald A. "Stochastic approach to chemical kinetics." Journal of applied probability 4.3 (1967): 413-478.

## Probability transition matrix ##

For the reaction $A_i \leftrightarrow A_j (i,j = 1,2,\cdots, N; i \neq j)$, we can get the *rate matrix* from the master equation,
$$
\frac{d \boldsymbol{A}}{d t} = \boldsymbol{K} \boldsymbol{A}
$$
where the rate matrix $\boldsymbol{K}$ is,
$$
\boldsymbol{K} = 
\begin{bmatrix}
-\sum_{\nu \neq 1} k_{1 \nu} & k_{21} & k_{31} & \cdots & k_{N1} \\
k_{12} & -\sum_{\nu \neq 2} k_{2 \nu} & k_{32} & \cdots & k_{N2} \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
k_{1N} & k_{2N} & k_{3N} & \cdots & -\sum_{\nu \neq N} k_{N \nu} \\
\end{bmatrix}
$$

Solving the above differential equation,
$$
\boldsymbol{A} = \exp (\boldsymbol{K} t) \boldsymbol{A}_0 = \boldsymbol{X} \exp(\boldsymbol{\Lambda} t) \boldsymbol{X}^{-1} \boldsymbol{A}_0 
$$
where $\boldsymbol{X}$ and $\boldsymbol{\Lambda}$ are eigenvectors and eigenvalues of the rate matrix $\boldsymbol{K}$ respectively. For more details about [exponential function of matrices](https://psichen.github.io/2021/03/27/notes-about-fluorescence-correlation-spectroscopy-formalism/).
