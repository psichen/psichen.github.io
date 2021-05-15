---
title: First-order ordinary differential equations
date: 2021-05-02 12:32:36
tags: [differential equation, integrating factor]
---

Ordinary differential equations (ODE) are important in physical modeling and deduction.

<!--more-->

## Integrating factor method

For functions of two variables, the partial derivative is defined as,

$$ \frac{\partial f(x, y)}{\partial x} = \lim_{\Delta x \to 0} \frac{f(x + \Delta x, y) - f(x, y)}{\Delta x} $$

Similarly, the 2nd partial derivative is,

$$ \begin{aligned}
\frac{\partial}{\partial y} \frac{\partial f(x, y)}{\partial x}
&= \lim_{\Delta y \to 0} \frac{\frac{\partial}{\partial x}f(x, y+\Delta y) - \frac{\partial}{\partial x}f(x, y)}{\Delta y} \\
&= \lim_{\Delta y \to 0} \lim_{\Delta x \to 0} \frac{1}{\Delta x \Delta y} [ f(x+\Delta x, y+\Delta y) - f(x, y+\Delta y) - f(x+\Delta x, y) + f(x, y) ] \\
&= \frac{\partial}{\partial x} \frac{\partial f(x, y)}{\partial y}  
\end{aligned}  $$

Thus, the 2nd partial derivative is symmetric,

$$ \frac{\partial^2 f}{\partial x \partial y} = \frac{\partial^2 f}{\partial y \partial x} $$

We use this criteria to judge whether the function is exact differential.

### Exact differential equations

If the ODE satisfies,

$$ A(x,y) dx + B(x,y) dy = 0 \text{, where } \frac{\partial A}{\partial y} = \frac{\partial B}{\partial x} $$

It's the exact differential equation which can be solved by,

$$ \begin{aligned}
dU(x,y) &= A(x,y) dx + B(x,y) dy = 0 \\
U(x,y) &= \int A(x,y) \: dx + F(y) = c_{1} \\
F(y) &= \int [ B(x,y) - A(x,y) ] \: dy
\end{aligned}  $$

### Inexact differential equations

If the ODE is, 

$$ A(x,y) dx + B(x,y) dy = 0 \text{, where } \frac{\partial A}{\partial y} \neq \frac{\partial B}{\partial x} $$

We should introduce an integrating factor $\mu$ where $\mu$ satisfies,

$$ \frac{\partial (\mu A)}{\partial y} = \frac{\partial (\mu B)}{\partial x} $$

$\lambda$ isn't unique so we can just arbitrarily defined $\mu = \mu(x)$,

$$ \mu \frac{\partial A}{\partial y} = B \frac{\partial \mu}{\partial x} + \mu \frac{\partial B}{\partial x}  $$
$$ \mu = \exp[ \int \frac{1}{B} (\frac{\partial A}{\partial y} - \frac{\partial B}{\partial x}) \: dx ] $$

Then substitute the integrating factor into the ODE and solve it. It's also suitable for the linear equation,

$$ \frac{dy}{dx} + P(x)y = Q(x) $$

where the integrating factor $\mu(x) = \exp[\int P(x) \: dx]$.

## Substitution method to separate variables

### Homogeneous equations

For the $n$-degree homogeneous function $f(x,y)$, we have $f(\lambda x, \lambda y)=\lambda^{n} f(x,y)$. Thus for the ODE,

$$ \frac{dy}{dx} = \frac{A(x,y)}{B(x,y)} = F(\frac{y}{x}) $$

where $A(x,y)$ and $B(x,y)$ are both homogeneous functions of the same degree, it may then be solved by making the substitution $y = \nu (x) x$. Because $y$ equals a function of $x$, $\frac{y}{x}$ should also be a function of $x$ as $\nu (x)$. Differentiate $y$ with respect to $x$, we get,

$$\frac{dy}{dx} = \nu + x \frac{d\nu}{dx}$$

Thus the ODE can be solved as,

$$ \int \frac{d\nu}{F(\nu) - \nu} = \int \frac{dx}{x}$$

### Isobaric equations

More generally, if the ODE isn't homogeneous but it has the form,

$$ \frac{dy}{dx} = \frac{A(x,y)}{B(x,y)} $$

It may then be solved by making the substitution,

$$ y = \nu x^{m} $$

if the substitution makes the ODE dimensionally consistent,

$$ \pmb{[} A(x,y) \pmb{]} + 1 = \pmb{[} B(x,y) \pmb{]} + m $$

where the dimension of $x$ and $dx$ is $1$ and of $y$ and $dy$ is $m$. Then try to substitute it into the ODE, cancel the $\nu$ factors containing $x$ and make the ODE separable.

### Bernoulli's equation

Bernoulli's equation is the form,

$$ \frac{dy}{dx} + P(x)y = Q(x)y^{n} \text{, where } n \neq 0 \text{ or } 1 $$

which can be transformed by dividing $y^{n}$ on both side,

$$ \frac{1}{1-n} \frac{d(y^{1-n})}{dx} + P(x) y^{1-n} = Q(x) $$

Thus the ODE can be solved as a linear equation described above by making the substitution,

$$ \nu = y^{1-n} $$

## Miscellaneous equations

If the ODE has the form,

$$ \frac{dy}{dx} = F(ax+by+c) $$

we can solve the equation by just making the substitution,

$$ \nu = ax + by +c $$

Thus the ODE is transformed to be,

$$ \frac{d\nu}{dx} = a + bF(\nu) $$

Otherwise, if the ODE has the form,

$$ \frac{dy}{dx} = \frac{ax+by+c}{ex+fy+g} $$

we can cancel the constants in both the numerator and denominator by linear transformation, 

$$ \begin{aligned}
X &= x + \alpha \\
Y &= y + \beta
\end{aligned}  $$

where $\alpha$ and $\beta$ satisfy,

$$ \begin{bmatrix} a & b \\ e & f \\ \end{bmatrix} \begin{bmatrix} \alpha \\ \beta \\ \end{bmatrix} = - \begin{bmatrix} c \\ g \\ \end{bmatrix} $$

Then we get the homogeneous ODE, which can be solved by substitution,

$$ \frac{dY}{dX} = \frac{aX+bY}{eX+fY} $$

## Higher-degree first-order ODEs

In higher-degree ODEs it's usually hard to separate variables because three variables ($x,y,y'$) are in nonlinear relationship in general. So an intuitive method is to eliminate one variable and degenerate the ODE to the form we are familiar with by the differential relation $\frac{dy}{dx} = y'$.

### equations soluble for y'

If the ODE can be factorised as,

$$ \prod_{i=1}^{n} (y' - F_{i}(x, y)) = 0 $$

The solution for $y' - F_{i}(x, y) = 0$ is $y_{i}$,

$$ y_{i} = H_{i}(x) $$
$$ y'_{i} = F_{i}(x, y_{i})$$
$$ G_{i}(x, y_{i}) = y_{i} - H_{i} = 0 $$

The general solution for the ODE is,

$$ \prod_{i=1}^{n} G_{i}(x, y) = 0 $$

Here is why,

$$ \frac{d}{dx} \prod_{i=1}^{n} G_{i}(x, y) = \sum_{i=1}^{n} \prod_{\substack{j=1 \\ j \neq i}}^{n} G_{j}(x, y) (y' - F_{i}) = 0 $$

$$ \begin{aligned}
		\sum_{i=1}^{n} \prod_{\substack{j=1 \\ j \neq i}}^{n} G_{j}(x, y) y' &= \sum_{i=1}^{n} \prod_{\substack{j=1 \\ j \neq i}}^{n} G_{j}(x, y) F_{i} \\
		y' &= \frac{\sum_{i=1}^{n} \prod_{\substack{j=1 \\ j \neq i}}^{n} G_{j}(x, y) F_{i}}{\sum_{i=1}^{n} \prod_{\substack{j=1 \\ j \neq i}}^{n} G_{j}(x, y)} \\
		y' - F_{i} &= G_{i} A_{i}
\end{aligned} $$

$y'$ subtracts $F_{i}$ cancelled the factor without $G_{i}$ in the numerator. Thus we can extract the factor $G_{i}$ from $p - F_{i}$,

$$ \prod_{i=1}^{n} [ p - F_{i}(x, y) ] = \prod_{i=1}^{n} G_{i} \prod_{i=1}^{n} A_{i} = 0 $$

### equations soluble for x

If the ODE can be written as,

$$ x = F(y, y') $$

We can eliminate $x$ by differentiating both sides with respect to $y$,

$$ \frac{dx}{dy} = \frac{1}{y'} = \frac{\partial F}{\partial y} + \frac{\partial F}{\partial y'} \frac{dy'}{dy}  $$

This results in an equation in the form of $G(y, y') = 0$, which is likely to be separable.

### equations soluble for y

If the ODE can be written as,

$$ y = F(x, y') $$

We can eliminate $y$ by differentiating both sides with respect to $x$,

$$ \frac{dy}{dx} = y' = \frac{\partial F}{\partial x} + \frac{\partial F}{\partial y'} \frac{dy'}{dx} $$

This results in an equation in the form of $G(x, y') = 0$, which is likely to be separable.
