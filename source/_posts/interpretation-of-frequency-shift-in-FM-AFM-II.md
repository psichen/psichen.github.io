---
title: Interpretation of frequency shift in FM AFM (II)
date: 2021-05-21 18:32:09
tags: [mechanics, Hamilton, Jacobi, harmonic oscillation, generating function, AFM, transformation, perturbation]
---

Periodic motion in dynamic systems are of especial importance. Very often we are interested not so much in the motion trajectories as in the frequencies of the motion.

<!--more-->

## Action-Angle variables

For a conserved system, its Hamiltonian is constant,

$$ H(q,p) = \alpha $$

Thus we can know the momentum $p$ is a function $p(q,\alpha)$. For a periodic motion we introduce a new variable $J(\alpha)$ designed as the transformed constant momentum. The so-called abbreviated action variable $J(\alpha)$ is defined,

$$ J(\alpha) = \oint p(q,\alpha) \ dq $$

where the momentum $p$ is integrated by $q$ over a complete period of the motion, and $J(\alpha)$ is a function solely dependent on $\alpha$. Thus the Hamiltonian can be represented by $\alpha=K(J)$ as well. Supposed the new conjugated variable is $\beta$, from the equation of motion we also have,

$$ \dot{\beta} = \frac{\partial K}{\partial J} \ , \ \dot{J} = - \frac{\partial K}{\partial \beta} $$

Because $K(J)$ is a function of the variable $J$ only, we may designate $\omega(J) = \frac{\partial K}{\partial J}$, then we can get $\beta$ from the above partial differential equation,

$$ \beta = \omega(J) t + \beta_{0} $$

Considering the change in $\beta$ as $q$ goes through a complete cycle in the motion,

$$ \begin{aligned}
\Delta \beta &= \oint \frac{\partial \beta}{\partial q} \ dq \\
&= \oint \frac{\partial}{\partial q} (\frac{\partial W}{\partial J}) \ dq \\
&= \frac{d}{dJ} \oint \frac{\partial W}{\partial q} \ dq \\
&= \frac{d}{dJ} \oint p \ dq \\
&= 1 \\
\end{aligned}  $$

The above equation states that $\beta$ changes by unity as $q$ goes through a complete cycle. Then we have,

$$ \Delta \beta = \omega(J) \tau = 1 $$

So $\omega(J)$ is the reciprocal of the period $\tau$ of a complete cycle, namely, the frequency.

$$ \dot{\beta} = \omega(J) = \frac{1}{\tau} = f $$

The dimension of the variable $J$ is an angular momentum and that of the variable $\beta$ is an angle, hence given the name of Action-Angle variables. The Action-Angle variable transformation provides a way to obtain the frequency of periodic motion without find a complete solution to the motion of the system.

## Perturbation theory

Not all of classic mechanical problems have exact solutions, but we can use perturbation Hamiltonian to approximate the solution of the rather complicated mechanical problems. The idea of finding a solution of perturbation Hamiltonian is to iterate the canonical variables by the equation of motion again and again.

The Hamiltonian with perturbation,

$$ H = H_{0} + \Delta H $$

where $H_{0}$ is the unperturbed Hamiltonian and $\Delta H$ is the perturbed Hamiltonian. The canonical property of a given coordinate transformation is independent of the particular form the Hamiltonian. Only now the new Hamiltonian won't vanish and the transformed variables may not be constant,

$$ K(Q,P,t) = H(q,p,t) + \Delta H(q,p,t) + \frac{\partial S}{\partial t} = \Delta K(Q,P,t) $$

$$ \dot{Q} = \frac{\partial \Delta K}{\partial P} \ , \ \dot{P} = - \frac{\partial \Delta K}{\partial Q} $$

In the perturbed scenario, $\Delta H$ is small compared to $H_{0}$. Therefore the quantities $(Q,P)$ don't change rapidly. So converged $(Q,P)$ may be obtained by repeatedly replacing $Q$ and $P$ in the following equations,

$$ \begin{aligned}
\dot{Q}_{i+1} &= \frac{\partial \Delta K}{\partial P}(Q_{i},P_{i},t) \\
\dot{P}_{i+1} &= - \frac{\partial \Delta K}{\partial Q} (Q_{i},P_{i},t) \\
\end{aligned}  $$

## Cantilever in FM-AFM

The external force between the sample surface and the tip usually is supposed to obey an inverse power law,

$$ F_{ts}(q) = - C q^{-n} $$

resulting in the perturbation Hamiltonian,

$$ \Delta H = V(q) =
\begin{cases}
-\frac{C}{(n-1) q^{n-1}} \ & n\gt1 \\
C \ln(q) \ & n = 1 \\
\end{cases} $$

and the corresponding perturbation Kamiltonian $\Delta K(J)$. So the frequency shift is,

$$ \Delta f = \langle \Delta \dot{\beta} \rangle = \langle \frac{\partial K}{\partial J} - \frac{\partial K_{0}}{\partial J} \rangle = \langle \frac{\partial \Delta K}{\partial J} \rangle = \langle \frac{\partial V(q)}{\partial q} \frac{\partial q}{\partial J} \rangle $$

The average is taken for a complete cycle of the motion because  the action variable $J$ is defined over a complete cycle.

From the reference 3, the deflection $q'$ is,

$$ q' = \sqrt{\frac{2 f_{0} J}{k}} \sin 2 \pi (f_{0} t + \beta) $$

It yields,

$$ \frac{\partial q'}{\partial J} =  \frac{q'}{2 J} = \frac{f_{0}}{k A_{0}^{2}} q' $$

where $A_{0}$ is the amplitude of the deflection, $k$ is the spring constant of the cantilever and $f_{0}$ is the original resonance frequency under free oscillation when the tip is very far from the surface. Finally,

$$ \Delta f = - \frac{f_{0}}{k A_{0}^{2}}  \langle F_{ts} q' \rangle = \frac{1}{2 \pi} \frac{f_{0}}{k A_{0}} \frac{C}{d^{n}} \int_{0}^{2\pi} \frac{\cos x}{[1 + (A_{0}/d) (\cos x + 1)]^{n}} \ d{x} $$

where $d$ is the distance between the surface and the lowest position of the tip.

### small amplitudes

When the tip oscillates at a small amplitude,

$$ A_{0} << d $$

making use of the first order Taylor series of

$$ (1 + \epsilon)^{-n} = 1 - n \epsilon + O(\epsilon^{2}) $$

we can approximate $\Delta f$ as,

$$ \Delta f = \frac{f_{0} C}{2 \pi k A_{0} d^{n}} \int_{0}^{2 \pi} \cos x[ 1 -n (A_{0}/d) (\cos x + 1) ] \ d{x} = -\frac{C f_{0} n}{2 k d^{n+1}} = - \frac{f_{0}}{2 k} (\nabla \cdot F_{ts}|_{q=d}) $$

It states that the frequency shift is related with the gradient of the external force $F_{ts}$ on the $z$-axis, corresponding to the first-order expansion of Taylor series of the expression,

$$ f = \frac{1}{2 \pi} \sqrt{\frac{k_{eff}}{m}} $$

where $k_{eff} = k - \nabla \cdot F_{ts}$.

## References

1. Goldstein, Herbert, Charles Poole, and John Safko. "Classical mechanics." (2002).

2. [Notes for Classical Mechanics 821: Hamilton-Jacobi equation](https://www.asc.ohio-state.edu/mathur.16/821hj.pdf)

3. Giessibl, Franz J. "Forces and frequency shifts in atomic-resolution dynamic-force microscopy." *Physical Review B* 56.24 (1997): 16010.
