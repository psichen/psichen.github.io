---
title: Interpretation of frequency shift in FM-AFM (I)
date: 2021-05-18 19:51:30
tags: [mechanics, Hamilton, Jacobi, harmonic oscillation, generating function, AFM, transformation, perturbation]
---

In the Frequency-Modulation mode of AFM, the cantilever keeps harmonically oscillating during measurement. In contrast to optic microscopy or scanning tunneling microscopy, in which the electromagnetic signals are detected directly by detectors, FM-AFM detects the frequency shift of the cantilever's harmonic oscillation when the distance between sample surface and cantilever's tip changes.

<!--more-->

When there are potential fields between sample surface and tip (Van der Waals force, electromagnetic force, etc), the force exerted on the oscillation system will change as the distance changes. If we know the relation between frequency shift $\Delta f$ and external force $F$ as the gradient of potential fields, the distance between surface and tip can be measured in nearly real time by detecting the frequency of oscillation. In addition, the height of sample surface can also be imaged through a feedback system which control the frequency to maintain a constant distance between surface and tip.

## Classical mechanics

Let's consider an harmonic oscillation system in phase space $(q,p)$, the harmonic oscillation can be described by Newton's mechanics,

$$ m \ddot{q} = - k q $$

The general solution for the above ordinary partial equation is,

$$ q(t) = C_{1} \exp(\sqrt{\frac{k}{m}} t i) + C_{2} \exp(-\sqrt{\frac{k}{m}} t i) = (C_{1} + C_{2}) \cos(\sqrt{\frac{k}{m}} t) + i (C_{1} - C_{2}) \sin(\sqrt{\frac{k}{m}} t)$$

Because the coordinate $q$ is a real number, we have $C_{1} - C_{2} = 0$. So the function $q(t)$ is a cosine function,

$$ q(t) = A \cos(\sqrt{\frac{k}{m}} t) $$

The momentum $p = m \dot{q}$ is, 

$$ p(t) = - \sqrt{km} A \sin(\sqrt{\frac{k}{m}} t) $$

For complicated dynamic systems, the mechanic problem itself is hard to be solved completely. So we need to find some conserved quantities which are able to describe the same dynamic system at a static view.

### Lagrangian & Hamiltonian mechanics

From the Lagrangian mechanics,

$$ L(q,\dot{q},t) = T(\dot{q},t) - V(q) $$

where $T$ is kinetic energy and $V$ is potential energy. Thus we have Lagrangian equation of motion,

$$ \begin{equation}
\begin{aligned}
\frac{\partial L}{\partial q} &= - \frac{\partial V}{\partial q} = \dot{p} \\
\frac{\partial L}{\partial \dot{q}} &= \frac{\partial T}{\partial \dot{q}} = p
\end{aligned}
\end{equation} \label{Lagrangian} $$

Hamiltonian can be gotten by [Legendre transformation](https://psichen.github.io/2019/09/25/Legendre-transformation/) of Lagrangian mechanics, where $p$ and $\dot{q}$ are conjugated variables.

$$ H(q,p,t) = - [ L(q,\dot{q},t) - p \dot{q} ] = - [ T(\dot{q},t)  - p \dot{q} ] + V(q,t) $$

Thus,

$$ \begin{aligned}
H(q,p,t) &= T(p,t) + V(q,t) \\
\frac{\partial H}{\partial p} &= \dot{q} \\
-\frac{\partial H}{\partial q} &= \dot{p}
\end{aligned}  $$

### canonical transformation

Then we want to find a function $K$ which plays the role of the Hamiltonian in the new phase space coordinate set $(Q,P)$. For qualified $K(Q,P,t)$, variables $(Q,P)$ should be canonical, so $K(Q,P,t)$ satisfies,

$$ \begin{aligned}
\frac{\partial K}{\partial P} &= \dot{Q} \\
-\frac{\partial K}{\partial Q} &= \dot{P} \\
\end{aligned} $$

As we mentioned above, $K$ is a modified Hamiltonian. For any Hamiltonian, there is Hamilton's principle,

$$ \begin{aligned}
\delta \int_{t_{0}}^{t_{1}} ( p \dot{q} - H ) \ d{t} &= 0 \\
\delta \int_{t_{0}}^{t_{1}} ( P \dot{Q} - K ) \ d{t} &= 0 \\
\end{aligned}  $$

It means the variation of the action is zero. So the integrals should be equal by adding a factor,

$$ \int_{t_{0}}^{t_{1}} ( p \dot{q} - H ) \ d{t} = \int_{t_{0}}^{t_{1}} ( P \dot{Q} - K ) \ d{t} + F $$

So both above Hamilton's principle will be satisfied if the integrands are connected by a relation of the form,

$$ p \dot{q} - H = P \dot{Q} - K + \frac{dF}{dt} $$

The function $F(q,Q,t)$ contributes to the action integral only at the end points. Indeed, $F$ is useful for specifying the exact form of the canonical transformation only when half of the variables (beside the time) are from the old set and half are from the new. It acts as a bridge between the two sets of canonical variables and is thus called the generating function.

Suppose $F(q,Q,t)$ is given as a function of the old and new space coordinates $q$ and $Q$,

$$ p \dot{q} - H = P \dot{Q} - K + \frac{\partial F}{\partial q} \dot{q} + \frac{\partial F}{\partial Q} \dot{Q} + \frac{\partial F}{\partial t} $$

Because variables $q$ and $Q$ are independent, the $\dot{q}$ and $\dot{Q}$ on both sides of the equation must vanish,

$$ \frac{\partial F}{\partial q} = p $$
$$ - \frac{\partial F}{\partial Q} = P $$

and we get the Hamilton-Jacobi equation,

$$ K(Q,P,t) = H(q,p,t) + \frac{\partial F(q,Q,t)}{\partial t} $$

The Hamilton-Jacobi equation is made to zero for convenience,

$$ \begin{equation}
H(q,p,t) + \frac{\partial F(q,Q,t)}{\partial t} = 0
\label{HJ_equation}
\end{equation} $$

So that the new canonical variables in phase space $(Q,P)$ won't change with time,

$$ \begin{aligned}
\frac{\partial K}{\partial P} &= \dot{Q} = 0 \\
-\frac{\partial K}{\partial Q} &= \dot{P} = 0
\end{aligned} $$

Thus a dynamic system can be simply described by static functions.

### Hamilton-Jacobi equation

In physics there are 4 types of generating functions whose partial derivatives generate differential equations that determine a system's dynamics.

| Generating function                         | Derivatives                                                                     |
| ---                                         | ---                                                                             |
| $F = F_{1}(q,Q,t)$                          | $p = \frac{\partial F}{\partial q}$ and $P = - \frac{\partial F}{\partial Q}$   |
| $F = F_{2}(q,P,t) = F_{1}(q,Q,t) + PQ$      | $p = \frac{\partial F}{\partial q}$ and $Q = \frac{\partial F}{\partial P}$     |
| $F = F_{3}(p,Q,t) = F_{1}(q,Q,t) - qp$      | $q = - \frac{\partial F}{\partial p}$ and $P = - \frac{\partial F}{\partial Q}$ |
| $F = F_{4}(p,P,t) = F_{1}(q,Q,t) + QP - qp$ | $q = - \frac{\partial F}{\partial p}$ and $Q = \frac{\partial F}{\partial P}$   |

They're converted by the [Legendre transformation](https://psichen.github.io/2019/09/25/Legendre-transformation/). Among them, $F_{2}(q,P,t)$ (type-2 Generating function) is called Hamilton's principal function.

Substituting $p = \frac{\partial F}{\partial q}$ into the Hamilton-Jacobi equation $\eqref{HJ_equation}$,

$$ H(q, \frac{\partial F}{\partial q},t) + \frac{\partial F}{\partial t} = 0 $$

The solution of the above PDE is $F(q, \alpha, t, \alpha_{t})$ in which $\alpha$ and $\alpha_{t}$ are independent constants of integration with respect to differential variables $q$ and $t$. The value of the constant of integration changes according to initial conditions of the differential equations. We can fix the initial time $t_{0}$ then $\alpha_{t}$ won't change. Similarly, because the initial condition about $q$ is undetermined, we may take $\alpha$ as the new variables $Q$, then their conjugated variables $P$ are,

$$ P = - \frac{\partial F}{\partial Q} $$

The variable $Q$ is constant when it's respect to the old variable set like $(q,p,t)$. However, $Q$ is dependent on initial conditions. So the coordinates $(Q,P)$ can be seen as variables before the initial conditions are determined.

It also tells us an important truth, when the dynamic system has a conserved energy, that the partial derivative of $F$ with respect to time $t$ is also constant, so we may guess the form of $F(q,Q,t)$ as,

$$ \begin{equation}
F(q,Q,t) = W(q,Q) - \alpha(Q) t
\label{generating_function}
\end{equation} $$

where $\alpha(Q)$ is constant with respect to time and equal to the Hamiltonian $H_{0}$, and $W(q,Q)$ is called the Hamilton's characteristic function.

### the action as the generating function in canonical transformation

The action is defined as,

$$ S(q,t) = \int_{t_{0}}^{t} L(q,\dot{q},\tau) \ d{\tau} $$

One the one hand, the partial differential of $S$ with respect to $q$ is,

$$ \begin{aligned}
\delta S &= \int_{t_{0}}^{t} ( \frac{\partial L}{\partial q} \delta q + \frac{\partial L}{\partial \dot{q}} \frac{d}{d\tau} \delta q ) \ d{\tau} \\
&= \int_{t_{0}}^{t} \delta q ( \frac{\partial L}{\partial q} - \frac{d}{d\tau} \frac{\partial L}{\partial \dot{q}} ) \ d{\tau} + [ \frac{\partial L}{\partial \dot{q}} \delta q ] |_{t_{0}}^{t}
\end{aligned} $$

Here we use the property $\delta \dot{q} = \frac{d}{dt} \delta q$ because of the linearity of differential operators. If the system obeys the equation of motion $\eqref{Lagrangian}$, the term in the integral should vanish. In addition, it should be noticed that $\delta q=\delta q(\tau)$ is still a function of time. If we fixed the coordinate $q$ at the initial time $t_{0}$, then $\delta q(t_{0}) = 0$. Eventually we have,

$$ \frac{\partial S}{\partial q} = \frac{\partial L}{\partial \dot{q}} = p(t) $$

On the other hand, the total derivative of $S(q,t)$ with respect to time $t$ is $L$ as cancelling the integral. According to the chain rule we also have,

$$ \frac{dS}{dt} =  \frac{\partial S}{\partial q} \dot{q} + \frac{\partial S}{\partial t} = L $$

So the action of a mechanic system satisfies the Hamiltonian-Jacobi equation,

$$ p \dot{q} - L + \frac{\partial S}{\partial t} = H + \frac{\partial S}{\partial t} = 0 $$

## Harmonic oscillation

Taking an Harmonic oscillation as an example, the Hamiltonian is,

$$ H(p,q,t) = \frac{1}{2m} p^{2} + \frac{1}{2} m \omega^{2} q^{2} $$

Substitute the generating function $F(q,Q,t)$ into $H(p,q,t)$,

$$ \frac{1}{2m} (\frac{\partial F}{\partial q})^{2} + \frac{1}{2} m \omega^{2} q^{2} + \frac{\partial F}{\partial t} = 0 $$

From the equation $\eqref{generating_function}$ we have,

$$ (\frac{\partial W}{\partial q})^{2} + m^{2} \omega^{2} q^{2} = 2 m \alpha $$

where $\alpha = \alpha(Q)$. The solution of the above first-order ODE is,

$$ W(q,Q) = \int_{q_{0} = 0}^{q} \sqrt{2m\alpha - m^{2} \omega^{2} q'^{2}} \ d{q'} $$

Thus,

$$ S(q,Q,t) = W(q,Q) - \alpha t $$

Because $\alpha(Q)$ is a function of solely variable $Q$, we reassign $\alpha$ as the canonical variable $Q$, which is the total energy Hamiltonian of the system. We have the partial derivatives according to the generating function,

$$ p = \frac{\partial S}{\partial q} = \sqrt{ 2 m \alpha - m^{2} \omega^{2} q^{2} } $$

From this we can solve $\alpha$,

$$ \alpha = \frac{p^{2} + m^{2} \omega^{2} q^{2}}{2m} = A^{2} $$

where $A$ is the amplitude of the harmonic oscillation, consistent with the Hamilton-Jacobi equation. For the other conjugated variable,

$$ \beta = - \frac{\partial S}{\partial \alpha} = t - \int_{q_{0}=0}^{q} \frac{2m}{\sqrt{2 m \alpha - m^{2} \omega^{2} q'^{2}}} \ d{q'} = t - \frac{1}{\omega} \arcsin(\omega \sqrt{\frac{m}{2 \alpha}} q) $$

Turn the equation "inside out",

$$ \begin{aligned}
q &= \sqrt{\frac{2 \alpha}{m \omega^{2}}} \sin( \omega t - \omega \beta ) \\
p &= \sqrt{ 2 m \alpha - m^{2} \omega^{2} q^{2} } = \sqrt{2 m \alpha} \cos(\omega t - \omega \beta) \\
\end{aligned} $$

So $\beta$ is the phase of the oscillator with some scaling. Then we get $\beta$,

$$ \beta = t - \frac{1}{\omega} \arctan( m \omega \frac{q}{p} ) $$

Let's substitute $q$ into the differential equation solution $S(q,Q,t)$,

$$ S(q,Q,t) = \alpha \int_{0}^{t} \cos[2 \omega (t-\beta)] \ d{t'} $$

and into the Lagrangian,

$$ L(q,\dot{q},t) = \frac{1}{2} m \dot{q}^{2} - \frac{1}{2} m \omega^{2} q^{2} = \alpha \cos[2 \omega (t-\beta)] $$

We can see the generating function $S(q,Q,t)$ exactly satisfies the definition of the action.

## References

1. Goldstein, Herbert, Charles Poole, and John Safko. "Classical mechanics." (2002).

2. [Notes for Classical Mechanics 821: Hamilton-Jacobi equation](https://www.asc.ohio-state.edu/mathur.16/821hj.pdf)

3. Giessibl, Franz J. "Forces and frequency shifts in atomic-resolution dynamic-force microscopy." *Physical Review B* 56.24 (1997): 16010.
