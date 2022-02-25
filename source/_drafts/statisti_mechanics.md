---
title: Notes about statistical physics
tags: [statisic mechanics]
---

## Increasing entropy
``` mermaid
flowchart TB

%% OBJECTS====================
phase_space(phase space)
microcanonical(microcanonical ensemble)
entropy(entropy definition)
second_law(the second law of thermodynamics)

%% RELATIONS====================
phase_space --- |equal probability| microcanonical 
entropy --- |saddle point approximation| second_law
microcanonical --- |saddle point approximation| second_law
```
### phase space
$$
\Omega(E) = \text{number of states with energy } E
$$
If the system has molecules of $N \sim 10^{23}$, and the number of available states of the molecules is $k$, then $\Omega(E)$ is at the scale of $k^{10^{23}}$, which is a VERY large number.

## Maximize entropy ##

The probability of states under different constrains guarantees that the total entropy would reach the maxmimum value. It can be gotten by Lagrange multiplier methods.

### microcanonical ensemble

On the one hand, the fundamental assumption of statistic mechanics is thaht the every microstate is equally likely, so the relevant probability distribution of every state is,
$$
p(n) = \frac{1}{\Omega(E)}
$$
On the other hand, the probability of all states should obey the constrain $\sum_n p(n) = 1$, and this is NOT an assumption. Thus we can get the probability of microstate when it maximizes entropy by the Lagrange multiplier,
$$
\begin{align*}
        \partial_{p(n)} S &=  \alpha k_B \partial_{p(n)} ( \sum_n p(n) - 1) \\
        \color{blue}{[ S = - k_B \sum_n p(n) \ln p(n) ]}p(n) &=  \exp(- \alpha - 1) \\
\end{align*}
$$
It tells us that the equal probability of every state in microcanonical ensembles maximizes the total entropy.

### canoncial ensemble ###

Canonical ensemble would exchange energy bewteen systems, but the total energy should be conserved, $\sum_n \Omega_n E_n = E_t$. Because $p(n) = \Omega_n / \Omega$, we can rewrite the constrain as the function of $p(n)$,
$$
\sum_n p(n) E_n = <E> = E_t / \Omega = \overline{E} 
$$
So in canonical ensembles the averaged energy should be fixed. The Lagrange multiplier is,
$$
\begin{align*}
        \partial_{p(n)} S &= k_B \partial_{p(n)} \Big{(} \alpha ( \sum_n p(n) - 1) + \beta ( \sum_n p(n) E_n - \overline{E} ) \Big{)} \\
        \color{blue}{[ S = - k_B \sum_n p(n) \ln p(n) ]}p(n) &=  \exp(- \alpha - 1) \exp(- \beta E_n) \\
\end{align*}
$$
It tells us the state probability in the form of *Boltzmann distribution* $\exp(-\beta E_n)$ maximizes the total entropy in canonical ensembles.

### grandcanoncial ensemble ###

If particles can move between systems and the reservioir, then the number of particles $N$ is not fixed but conserved $\sum_n N_n = N$. The Lagrange multiplier is,
$$
\begin{align*}
        \partial_{p(n)} S &= k_B \partial_{p(n)} \Big{(} \alpha ( \sum_n p(n) - 1) + \beta ( \sum_n p(n) E_n - \overline{E} ) + \mu ( \sum_n N_n - N ) \Big{)} \\
\end{align*}
$$


### entropy
$$
S(E) = k_B \log\Omega(E)
$$
Because $\Omega(E)$ is at the scale of $k^{10^{23}}$, $S(E)$ is at the scale of $N \sim 10^{23}$.

### the second law of thermodynamics

The number of available states in the combined system is,
$$
\begin{align*}
        \Omega(E_{total}) &= \sum_{E_i} \Omega_1(E_i) \Omega_2(E_{total} - E_i) \\
        &= \sum_{E_i} \color{red}{ \exp \big{(} \frac{S_1(E_i)}{k_B} + \frac{S_2(E_{total} - E_i)}{k_B} \big{)} } \\
\color{blue}{[\text{subset of }\sum_{E_i} (\cdot)]}        &\ge \exp(\frac{S_1(E_1)}{k_B} + \frac{S_2(E_{total} - E_1)}{k_B}) \\
\end{align*}
$$
This is a sum of exponentials (red terms). Because the entropy $S$ is at the scale of molecule number $N$, when, let's say, $N_1 > N_2$, then $\exp(N_1) \gg \exp(N_2)$. So the above sum is dominated by the maximum value of $S_1(E_i) + S_2(E_{total} - E_i)$, where $E_i = E_*$.
$$
\Omega(E_{total}) \approx \Omega(E_*)
$$
Because $\Omega(E_{total})$ is the number of states of all available energy $E_i$, it can be seen as the measure of the set of all observed results. Furthermore, $\Omega(E_*)$ is the number of states of THE energy $E_*$, so it's overwhelmingly likely to be found that the system has the energy $E_*$ because it consists of the majority of states which can be observed.

Because $\Omega(E_{total})$ is larger than the nunmber of states of any fixed energy $E_i$, the entropy of the combined system in the equilibrium ($E_*$) should be the maximum,
$$
S(E_{total}) \approx S_1(E_*) + S_2(E_{total}-E_*) \ge S_1(E_1) + S_2(E_2)
$$

## Temperature
``` mermaid
flowchart TB

%% OBJECTS====================
temperature(temperature)
heat_capacity(heat capacity)

%% RELATIONS====================
temperature --- heat_capacity
```
### derivatives of entropy

If there are $n$ systems with the respective energy $E_n$, the relation $\sum_n E_n = E_t$ should hold due to energy conservation. Then we can find the solution to maximize the entropy under the constrain by using Lagrange multiplier,
$$
\nabla S = \lambda \nabla (\sum_n E_n - E_t)
$$
$$
\begin{bmatrix}
\frac{\partial}{\partial E_1} \\
\frac{\partial}{\partial E_2} \\
\vdots \\
\frac{\partial}{\partial E_n} \\
\end{bmatrix}
S = \lambda
\begin{bmatrix}
1 \\
1 \\
\vdots \\
1 \\
\end{bmatrix} 
$$
it means the derivates $\frac{\partial S}{\partial E}$ between different systems should be equal when they reach the equilibrium. The derivate is defined as the reciprocal temperature,
$$
\frac{1}{T} = \frac{\partial S}{\partial E}
$$
### ideal gas model ###

### Gibbs entropy ###

The Gibbs entropy is a function of a probability distribution over phase space. In contrast, the Boltzmann entropy is a function on phase space.

Now we consider particles of number $N$ in which there are $n_i$ in the energy state $i$. So the Boltzmann entropy should be,
$$
S = k_B \ln (\frac{N!}{\prod_i n_i !})
$$
Applying the Stirling's approximation $\ln N! \approx N \ln N$,
$$
S = - k_B N \sum_i p_i \ln p_i
$$
where $p_i$ is the probability of energy state $i$ in the microcanonical ensemble.

Because entropy is additive, so we can remove $N$ in the above equation and get the Gibbs entropy,
$$
S = - k_B \sum_i p_i \ln p_i
$$
## canonical ensemble ##

Canonical ensemble systems ($S$) interacting with each others or the environment (heat reservoir, $R$) would have an averaged energy and the same temperature.

### partition function ###

Let's say the individual state $n$ of the system $S$ has the energy $E_n$, so the number of microstates of the combined system $S$ and $R$ should be the sum over all states of $S$,
$$
\Omega(E_t) = \sum_n \Omega(E_t - E_n) = \sum_n \exp \big{(} \frac{S_R (E_t - E_n)}{k_B} \big{)}
$$
Because $E_n \ll E_t$, we can Taylor expand the above exponential term,
$$
S_R(E_t - E_n) \approx S_R(E_t) - \frac{\partial S_R}{\partial E} E_n
$$
where $\frac{\partial S_R}{\partial E} = \frac{1}{T}$. Now we apply the fundamental assumption that all accessible microstates are equally likely, so the probability that the system stays in the state $n$ is,
$$
p(n) = \frac{\exp(-E_n / k_B T)}{\sum_n \exp(-E_n / k_B T)}
$$
This is called *Boltzmann distribution* or *canonical ensemble*, where the infomation of the reservoir is cancelled except the temperature.

the term $1 / k_B T$ is very common in the expression so we define the factor $\beta = 1 / k_B T$, thus the partition function is,
$$
Z = \sum_n \exp(- \beta E_n)
$$
### averaged energy ###
From the partition function, we can derive the averaged energy as,
$$
<E> = \sum_n p(n) E_n = \sum_n \frac{E_n \exp(- \beta E_n)}{Z} = - \frac{\partial}{\partial \beta} \ln Z
$$
and the variance of energy as,
$$
\Delta E^2 = <E^2> - <E>^2 = - \frac{\partial <E>}{\partial \beta} = \frac{\partial^2}{\partial \beta^2} \ln Z
$$
### fluctuation-dissipation relation ###
In canonical ensemble, the heat capacity is defined as,
$$
C_V = \frac{\partial <E>}{\partial T}|_V
$$
Considering the variance of energy we have,
$$
\begin{align*}
\Delta E^2 &= - \frac{\partial <E>}{\partial \beta} \\
&= - \frac{\partial <E>}{\partial T} \frac{\partial T}{\partial \beta} \\
\color{blue}{[ \frac{\partial T}{\partial \beta } = - k_B T^2 ]} &= k_B T^2 C_V \\
\end{align*}
$$
Because $C_V$ is at the scale of $N$, so the relative scale of fluctuation is,
$$
\frac{\Delta E}{E} = \frac{1}{\sqrt{N}}
$$

## Free energy
 We have already known some partial derivatives of entropy,
 $$
 \begin{align*}
         \partial_E S &= \frac{1}{T} \\
         \partial_V S &= \frac{p}{T} \\
         \partial_N S &=  - \frac{\mu}{T} \\
 \end{align*}
 $$
 We can define various free energy which are more convenient in certain scenarios by using these partial derivatives.

### Legendre transform ###

Various forms of free energy are derived from entropy by [Legendre transform](https://psichen.github.io/2019/09/25/Legendre-transformation/).

**Helmholtz free energy**
$$
\begin{align*}
        F &= E - TS \\
        dF &=  - S dT - p dV \\
\end{align*}
$$
**Gibbs free energy**
$$
\begin{align*}
        G &=  E - TS + pV \\
        dG &= -S dT + V dp \\
\end{align*}
$$
**enthalpy**
$$
\begin{align*}
        H &= E + pV \\
        dH &= T dS + V dp \\
\end{align*}
$$

### minimial free energy ###

Using Taylor expansion we can get the relation between the total entropy and free energy. Let's take the Gibbs free energy as the example,
$$
\begin{align*}
        S_t(E_t, V_t) &= S_R(E_t - E, V_t - V) + S(E, V) \\
        &\approx S_R(E_t, V_t) - (\partial_E S_R) E - (\partial_V S_R) V + S(E,V) \\
        &= S_R(E_t, V_t) - \frac{G}{T} \\
\end{align*}
$$
When the total entropy is maximized, the free energy of the system is minimized.

## References ##

[statistic physics](https://www.damtp.cam.ac.uk/user/tong/statphys.html)
