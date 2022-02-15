---
title: Notes about statistical physics
tags: [statisic mechanics]
---

``` mermaid
flowchart TB

%% OBJECTS====================
phase_space(phase space)
microcanonical(microcanonical ensemble)
entropy(entropy definition)
second_law(the second law of thermodynamics)
temperature(temperature)
heat_capacity(heat capacity)

%% CALLBACK====================
click phase_space href "./#phase-space" _self
click microcanonical href "./#microcanonical-ensemble" _self
click entropy href "./#entropy" _self
click second_law href "./#the-second-law-of-thermodynamics" _self
click temperature href "./#temperature" _self
click heat_capacity href "./#heat-capaticty" _self

click href "./#" _self

%% RELATIONS====================
phase_space --- |equal probability| microcanonical 
entropy --- |saddle point approximation| second_law
microcanonical --- second_law
second_law ---  |pertubation of energy \n idea gas model| temperature
second_law --- heat_capacity
```

## phase space ##
$$
\Omega(E) = \text{number of states with energy } E
$$
If the system has molecules of $N \sim 10^{23}$, and the number of available states of the molecules is $k$, then $\Omega(E)$ is at the scale of $k^{10^{23}}$, which is a VERY large number.

## microcanonical ensemble ##
$$
p(n) = \frac{1}{\Omega(E)}
$$
## entropy ##
$$
S(E) = k_B \log\Omega(E)
$$
Because $\Omega(E)$ is at the scale of $k^{10^{23}}$, $S(E)$ is at the scale of $N \sim 10^{23}$.

## the second law of thermodynamics ##

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
## temperature ##
Because $S_1 + S_2$ takes the maximum value when $E=E_*$, we know,
$$
\frac{\partial S_1(E)}{\partial E}|_{E=E_*} - \frac{\partial S_2(E_{total} - E)}{\partial E}|_{E=E_{total} - E_*} = 0
$$
it means the derivates $\frac{\partial S}{\partial E}$ between different systems should be equal when they reach the equilibrium.
$$
\frac{1}{T} = \frac{\partial S}{\partial E}
$$

## canonical ensemble ##
## Boltzmann distribution ##


## References ##

[statistic physics](https://www.damtp.cam.ac.uk/user/tong/statphys.html)
