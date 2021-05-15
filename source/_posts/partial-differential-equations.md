---
title: Partial differential equations
date: 2021-05-15 20:26:17
tags: [differential equations, wave function, diffusion equation]
---

Partial differential equations provide information about the relationship between the variables instead of the specific form of the solution function. Determining the specific form of solution needs other constraints such as boundary conditions. 

<!--more-->

## Homogeneous first-order PDE

For the homogeneous first-order partial differential equation,

$$ A(x,y) \frac{\partial u}{\partial x} + B(x,y) \frac{\partial u}{\partial y} = 0 $$

It introduces the second differential variable, which complicates the equation. So if there is a combination $p(x,y)$ which can transform the function $u(x,y)$ to the function $f(p)$ as one variable, then the PDE may be simplified to find the solution. Also, the combination $p=p(x,y)$ provides one more constraint for the solution of the PDE.

For the function,

$$ u(x,y) = f(p) $$

where $p=p(x,y)$. The variable space $\mathbb{R}^{2}(x,y)$ of $u(x,y)$ is changed to $\mathbb{R}(p)$ of $f(p)$. In the space $\mathbb{R}(p)$, a specific $p$ should be constant as $x$ and $y$ vary because $x$ and $y$ hold the combination relation $p = p(x,y)$,

$$ \begin{equation}
\frac{\partial p}{\partial x} dx + \frac{\partial p}{\partial y} dy = 0 \label{constraint_1}
\end{equation} $$

This is the first constrain equation the solution should satisfy if the solution can be represented by the combination $p(x,y)$.

Then let's find out the another constraint from the PDE. According to the chain rule,

$$ \begin{aligned}
\frac{\partial u}{\partial x} &= \frac{df}{dp} \frac{\partial p}{\partial x} \\
\frac{\partial u}{\partial y} &= \frac{df}{dp} \frac{\partial p}{\partial y}
\end{aligned}  $$

Then we have,

$$ [ A(x,y) \frac{\partial p}{\partial x} + B(x,y) \frac{\partial p}{\partial y} ] \frac{df}{dp} = 0 $$

Because $f(p)$ is a one-variable function, we can factor it out from the equation. The first term must be zero for non-trivial $p$, and it removes all reference of function $f(p)$,

$$ \begin{equation}
A(x,y) \frac{\partial p}{\partial x} + B(x,y) \frac{\partial p}{\partial y} = 0 \label{constraint_2}
\end{equation} $$

Then we have the equation set consist of $\eqref{constraint_1}$ and $\eqref{constraint_2}$,

$$ \begin{bmatrix} A(x,y) & B(x,y) \\ dx & dy \\ \end{bmatrix} \begin{bmatrix} \frac{\partial p}{\partial x} \\ \frac{\partial p}{\partial y} \\ \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \\ \end{bmatrix} $$

If the solution satisfies the combination $p=p(x,y)$ and the PDE, the equation set should be linear dependent, namely, they are the same equation,

$$ \begin{equation}
\frac{dx}{A(x,y)} = \frac{dy}{B(x,y)} \label{combination_equation}
\end{equation} $$

From the equation $\eqref{combination_equation}$, we can get the function $p=p(x,y)$, where $p$ is identified by the integral constant. By substituting $p$ into the arbitrary function $f(p)$ we get the general solution for the PDE. The specific form of the solution needs boundary conditions to determine.

## Homogeneous high-order PDE

Many physical processes can be described by second-order PDEs such as wave function or diffusion function. They are so common in physical problems that these equations have been intensively studied. By analogy to the first-order PDE, the idea of solving high-order PDE is to find a combination of variables to factorize the PDE.

### wave function

$$ \frac{\partial^2 u}{\partial x^2} - \frac{1}{c^{2}} \frac{\partial^2 u}{\partial t^2} = 0 $$

We can get some guidance by supposing the combination $p(x,t)$. Thus according to the chain rule, the differentials are,

$$ \begin{equation}
\begin{aligned}
\frac{\partial u}{\partial x} &= \frac{\partial f}{\partial p} \frac{\partial p}{\partial x} \\
\frac{\partial^2 u}{\partial x^2} &= \frac{\partial f}{\partial p} \frac{\partial^2 p}{\partial x^2} + (\frac{\partial p}{\partial x})^{2} \frac{\partial^2 f}{\partial p^2} \\
\frac{\partial u}{\partial t} &= \frac{\partial f}{\partial p} \frac{\partial p}{\partial t} \\
\frac{\partial^2 u}{\partial t^2} &= \frac{\partial f}{\partial p} \frac{\partial^2 p}{\partial t^2} + (\frac{\partial p}{\partial t})^{2} \frac{\partial^2 f}{\partial p^2} 
\end{aligned}
\end{equation} \label{chain_rule} $$

From the wave function we get,

$$ \frac{\partial f}{\partial p} ( \frac{\partial^2 p}{\partial x^2} - \frac{1}{c^{2}} \frac{\partial^2 p}{\partial t^2} ) + \frac{\partial^2 f}{\partial p^2} [ (\frac{\partial p}{\partial x})^{2} - \frac{1}{c^{2}} (\frac{\partial p}{\partial t})^{2} ] = 0 $$

This equation is still a little complicated. Because the combination $p(x,y)$ is an arbitrary function, let's add a constraint that the combination $p(x,y)$ is linear,

$$ p = A x + B y $$
$$ \frac{\partial p}{\partial x} = A, \frac{\partial p}{\partial y} = B $$
$$ \frac{\partial^2 p}{\partial x^2} = \frac{\partial^2 p}{\partial y^2} = 0 $$

So the first term of the differential equation vanishes and,

$$ \frac{B}{A} = \pm c $$

Then $p$ can be redefined as $p = x \pm c y$ and the solution is,

$$ u(x,y) = f(x+cy) + g(x-cy) $$

where $f(p)$ and $g(p)$ are arbitrary functions.

### diffusion function

Another important PDE is diffusion function,

$$ D \frac{\partial^2 u}{\partial x^2} - \frac{\partial u}{\partial t} = 0 $$

Let's also suppose $p = p(x,t)$. According the equation $\eqref{chain_rule}$, the diffusion function is transformed as,

$$ \frac{\partial f}{\partial p} ( D \frac{\partial^2 p}{\partial x^2} - \frac{\partial p}{\partial t} ) + D \frac{\partial^2 f}{\partial p^2} (\frac{\partial p}{\partial x})^{2} = 0 $$

It's still too complicated to solve explicitly. But if the terms in parentheses have the same dimension, we may be able to pick them out. Then we can get a second-order ordinary differential equation about $f$. The dimension of diffusion coefficient is $[D]_{m} = 2, [D]_{t} = -1$, so if the terms share the same dimension for the length $[m]$ and time $[s]$, the following equations should hold,

$$ [p]_{m} = 2 + 2 [p]_{m} - 2 $$
$$ [p]_{t} - 1 = 2 [p]_{s} - 1 $$

which gives $[p]_{m} = 0, [p]_{t} = 0$.

So we can suppose the form $p(x,t) = \frac{x^{2}}{Dt}$, and substitute it into the diffusion equation,

$$ \frac{\partial f}{\partial p} ( \frac{2}{t} + \frac{x^{2}}{D t^{2}} ) + \frac{4x^{2}}{D t^{2}} \frac{\partial^2 f}{\partial p^2} = 0 $$

The above equation can be transformed to an homogeneous ordinary differential equation with variable coefficients by multiplying $t$,

$$ 4 p f'' + ( 2 + p ) f' = 0 $$

A substitution of $g(p)=f'(p)$ may be made,

$$ 4 p g' + (2+p) g = 0 $$
$$ g(p) = A p^{-\frac{1}{2}} \exp(-\frac{p}{4}) $$

Thus,

$$ f(p) = \int_{p_{0}}^{p} g(q) \ d{q} = A \int_{p_{0}}^{p} q^{-\frac{1}{2}} \exp(-\frac{q}{4}) \ d{q} $$

Making the substitution $\nu = \frac{q^{\frac{1}{2}}}{2}$ and $\eta = \frac{p^{\frac{1}{2}}}{2} = (4Dt)^{-\frac{1}{2}} x$,

$$ h(\eta) = A' \int_{\eta_{0}}^{\eta} \exp(-\nu^{2}) \ d{\nu} $$

Specifically, if $\eta_{0} = 0$, $u(x,t)$ is the error function $\text{erf}[ (4Dt)^{-\frac{1}{2}} x ]$ multiplied by a constant $B$. It should be noticed that $x$ and $t$ appear only in the integral's upper limit $\eta$, and only in the combination $t^{-\frac{1}{2}}x$.
