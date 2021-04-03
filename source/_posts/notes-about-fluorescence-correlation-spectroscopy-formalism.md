---
title: Notes about fluorescence correlation spectroscopy formalism
date: 2021-03-27 23:20:23
tags: [differential equation, diffusion equation, Fourier transformation, correlation function, fluctuation]
---

Let's say the concentration of the component $j$ in the solution is $C_j(\vec{r}, t)$, which is a scalar function of coordinates $\vec{r}$ and time $t$. For a well-mixed solution, the average of concentration over coordinates and time should be a constant $<C_j(\vec{r}, t)> = \bar{C}_j$. The local concentration $C_j(\vec{r}, t)$, however, fluctuates with coordinates and time. The amount of local fluctuation is $\delta C_j(\vec{r}, t) = C_j(\vec{r}, t)-\bar{C}_j$.

<!-- more -->

## Fluctuation of molecules

Some physical and chemical processes (e.g. diffusion and reaction) will contribute to the partial derivate of the local concentration fluctuation $\frac{\partial \delta C_j(\vec{r}, t)}{\partial t}$. If we find a relationship between these processes and some measurable quantities related to $\frac{\partial \delta C_j(\vec{r}, t)}{\partial t}$, we can get parameters describing these processes through the measured quantity.

### Fick's law of diffusion

According to Fick's first law of diffusion,

$$\begin{equation}
\vec{J} = -D \nabla C(\vec{r}, t) \label{fick1st}
\end{equation}$$

where $C_j(\vec{r}, t)$ is a scalar concentration function, $\nabla C_j(\vec{r}, t)$ is a vector function, $D$ is the diffusion coefficient and $\vec{J}$ is the diffusive flux to the gradient of the concentration. The dimension of $\vec{J}$ is the amount of substance per unit area per unit time. The negative sign in the equation indicates that the diffusive flux goes from the rigion of high concentration to the region of low concentration.

Considering an infinitesimal volme $dV$ and the mass conservation,

$$ \iiint \frac{\partial C_j(\vec{r}, t)}{\partial t} dV + \iint \vec{J} \cdot d\vec{S} = 0 $$

where $d\vec{S}$ is the closed surface of the infinitesimal volume. According to the Green Gauss theorem, we have the Fick's second law of diffusion,

$$\begin{equation}
\frac{\partial C_j(\vec{r}, t)}{\partial t} = - \nabla J = D_j \nabla^2 C_j(\vec{r}, t) \label{fick2nd}
\end{equation}$$

which is a second-order partial differential quation. Besides, it's a linear equaiton so the following equation holds,

$$\begin{equation}
\frac{\partial \delta \pmb{C}(\vec{r}, t)}{\partial t} = - \nabla J = \pmb{D} \nabla^2 \delta \pmb{C}(\vec{r}, t) \label{fick2ndFluc}
\end{equation}$$

where $\pmb{D}$ is a diagonal matrix in which the element is the diffusion coefficient of respective species.

### Reaction kinetics

In general, the kinetic equation of a reaction isn't linear. For example, the kinetic equation of a simple reaction $A+B \to C$ is,

$$\begin{aligned}
\frac{\partial A}{\partial t} &= -k_{+} A B + k_{-} C \\
\frac{\partial B}{\partial t} &= -k_{+} A B + k_{-} C \\
\frac{\partial C}{\partial t} &= k_{+} A B - k_{-} C \\
\end{aligned}$$

But we can consider the first-order derivate of the concentration of above equations,

$$\begin{aligned}
\frac{\partial \delta A}{\partial t} &= -k_{+} B \delta A - k_{+} A \delta B  + k_{-} \delta C \\
\frac{\partial \delta B}{\partial t} &= -k_{+} B \delta A - k_{+} A \delta B  + k_{-} \delta C \\
\frac{\partial \delta C}{\partial t} &= k_{+} B \delta A + k_{+} A \delta B  - k_{-} \delta C \\
\end{aligned}$$

Therefore we can rewrite the kinetic equation as the matrix form,

$$ \frac{\partial}{\partial t} \begin{bmatrix} \delta A \\ \delta B \\ \delta C \end{bmatrix} = \begin{bmatrix} -k_{+} B & -k_{+} A & k_{-} \\ -k_{+} B & -k_{+} A & k_{-} \\ k_{+} B & k_{+} A & -k_{-} \end{bmatrix} \begin{bmatrix} \delta A \\ \delta B \\ \delta C \end{bmatrix} $$

In general we have such equation,

$$\begin{equation}
\frac{\partial}{\partial t} \delta \pmb{C} = \pmb{K} \delta \pmb{C} \label{react}
\end{equation}$$

where $\pmb{C}$ is the concentration matrix and $\pmb{K}$ is the matrix in which every element combins reaction rate constants and equilibrium concentrations of species.

### Concentration fluctuation from diffusion and reaction

In simple solution, the concentration fluctuation of the component is contributed by two parts: diffusion and reaction. According to the equation $\eqref{fick2ndFluc}$ and $\eqref{react}$, we can write the following equation,

$$\begin{equation}
\frac{\partial}{\partial t} \delta \pmb{C} = \pmb{D} \nabla^2 \delta \pmb{C} + \pmb{K} \delta \pmb{C} \label{main}
\end{equation}$$


Because the derivative of original function equals to the product of the reciprocal variable and the reciprocal function in Fourier space,

$$ \frac{1}{\sqrt{2 \pi}} \int_{-\infty}^{\infty} \frac{df(x)}{dx} e^{-i k x} dx = \frac{1}{\sqrt{2 \pi}} [f(x) e^{-i k x}|_{-\infty}^{\infty} - \int_{-\infty}^{\infty} f(x) (-i k) e^{-i k x} dx] = i k F(k) $$

here the first term vanishes because $|e^{-i k x}| \leq 1$ and we assume $f(x)$ is absolutly integrable on the real space $\Re$.

The equation can be simplified to the first-order ordinary differential equation by using the above properity of Fourier transformation,

$$\begin{equation}
\frac{\partial \pmb{\tilde{C}}(\vec{q}, t)}{\partial t} = \pmb{M}(\vec{q}) \pmb{\tilde{C}}(\vec{q}, t) \label{mainFourier}
\end{equation}$$

where $\pmb{\tilde{C}}(\vec{q}, t) = (2\pi)^{-\frac{3}{2}} \int \delta \pmb{C}(\vec{r}, t) e^{-i \vec{q} \vec{r}} d^3 \vec{r}$ and $\pmb{M}(\vec{q}) = \pmb{K} - \vec{q}^2 \pmb{D}$.

## Correlation between fluctuation of concentration

Here let's make a reasonable assumption of ideal solution that molecules are independent with each other at the same time $t_0$,

$$\begin{equation}
<\delta C_i(\vec{r_1}, t_0) \delta C_j(\vec{r_2}, t_0)> = \bar{C}_i \delta_{ij} \delta(r_1 - r_2) \label{assumption}
\end{equation}$$

where $\bar{C}_i$ is the average concentration of the component $i$ being equal to the mean-square fluctuation of the Poisson events.

In the next section we will use the fact that $\delta C_j(\vec{r}', t)$ are the solutions to the equation $\eqref{main}$ with the initial condition $\delta C_j(\vec{r}', 0)$ in order to express $<\delta C_i(\vec{r}, 0) \delta C_j(\vec{r}', t)>$ through the combination of the same-time correlation $<\delta C_i(\vec{r}, 0) \delta C_k(\vec{r}'' ,0)>$. The subscripts and coordinates changes because there are Fourier transformations to get the final correaltion expression.

### eigendecomposition and exponential function of matrices

If the matrix $\pmb{M}$ has the eigenvector matrix $\pmb{\mathsf{X}}$ and eigenvalue matrix $\pmb{\Lambda} \,au it can be decomposed as the product as following,

$$\begin{aligned}
\pmb{M} \pmb{V} &= \lambda \pmb{V} \\
\pmb{M} \pmb{X} &= \pmb{X} \pmb{\Lambda} \\
\pmb{M} &= \pmb{X} \pmb{\Lambda} \pmb{X}^{-1} \\
\pmb{M}^n &= \pmb{X} \pmb{\Lambda}^n \pmb{X}^{-1} \\
\end{aligned}$$

Substitute the decomposition into the definition of exponential function of a matrix,

$$ e^{\pmb{M}} = \sum_{k=1}^{\infty} \frac{\pmb{M}^k}{k!} = \sum_{k=1}^{\infty} \frac{\pmb{X} \pmb{\Lambda}^k \pmb{X}^{-1}}{k!} = \pmb{X} e^{\pmb{\Lambda}} \pmb{X}^{-1} $$

Thus we can easily get the solution for the matrix ordinary differential equation,

$$ \frac{\partial \pmb{F}}{\partial t} = \pmb{M} \pmb{F} $$

which is $\pmb{F}(t) = e^{\pmb{M} t} \pmb{F}(0) = \pmb{X} e^{\pmb{\Lambda} t} \pmb{X}^{-1} \pmb{F}(0)$. 

In addition, for the diagonal matrix $\pmb{\Lambda}$, the exponential matrix has following property,

$$ e^{\pmb{\Lambda}} = \sum_{k} \frac{\pmb{\Lambda}^k}{k!} = \begin{bmatrix} \sum_{k} \frac{\lambda_1^k}{k!} & & \\ & \ddots & \\ & & \sum_{k} \frac{\lambda_m^k}{k!} \\ \end{bmatrix} = \begin{bmatrix} e^{\lambda_1} & & \\ & \ddots & \\ & & e^{\lambda_m} \\ \end{bmatrix} $$

### solving differential equations by eigenfunctions 

According above equations, the equation $\eqref{mainFourier}$ as an ordinary differential matrix function has the solution,

$$\begin{equation}
\pmb{\tilde{C}}(\vec{q}, t) = \pmb{X} e^{\pmb{\Lambda} t} \pmb{X}^{-1} \pmb{\tilde{C}}(\vec{q}, 0) \label{solution}
\end{equation}$$

where $\pmb{\Lambda}$ and $\pmb{X}$ are the eigenvalue matrix and the eigenvector matrix of matrix $\pmb{M}$, respectivly. The element in $\pmb{\tilde{C}}(\vec{q}, t)$ is,

$$ \tilde{C}_{k}(\vec{q}, t) = \sum_{s=1}^{m} (\pmb{X} e^{\pmb{\Lambda} t} \pmb{X}^{-1})_{[k, s]} \tilde{C}_{s}(\vec{q}, 0) $$

## Fluorescent intensity from confocal microscope

The fluorescent intensity detected by the confocal microscope is,

$$\begin{equation}
\delta n(t) = \Delta t \int I(\vec{r}) \pmb{Q} \delta \pmb{C}(\vec{r}, t) d^3 \vec{r} \label{intensityFluc}
\end{equation}$$

where $\pmb{Q} = [Q_1, Q_2, \cdots, Q_m]$ is the coefficient matrix in which the element is the product of the adsorption cross section, quantum yield and detection efficiency of microscope of the fluorescent components and $I(\vec{r})$ is the Gaussian light field.

### correlation function in general

The correlatoin function is defined as the time average of the product of the fluorescent intensity fluctuation and normalized by the square of the average fluorescent intensity,

$$\begin{equation}
G(\tau) = \frac{<\delta n(t) \delta n(t+\tau)>}{\bar{n}^2} = \frac{<\delta n(0) \delta n(\tau)>}{\bar{n}^2} \label{correlation}
\end{equation}$$

The right part of the equation holds because of the ergodicity. Thus we have,

$$
\begin{equation}
\begin{aligned}
G(\tau)
&= \frac{(\Delta t)^2}{\bar{n}^2} \iint d^3 \vec{r}_1 d^3 \vec{r}_2 I(\vec{r}_1) I(\vec{r}_2) <[\pmb{Q} \delta \pmb{C}(\vec{r}_1, 0)] [\pmb{Q} \delta \pmb{C}(\vec{r}_2, \tau)]> \\
&=\frac{(\Delta t)^2}{\bar{n}^2} \iint d^3 \vec{r}_1 d^3 \vec{r}_2 I(\vec{r}_1) I(\vec{r}_2) \sum_{i} \sum_{j} Q_i Q_j <\delta C_i(\vec{r}_1, 0) \delta C_j(\vec{r}_2, \tau)> \\
\end{aligned}
\label{correlationExpand}
\end{equation}
$$

Let's first substitute the solution $\eqref{solution}$ into the correlation factor,

$$\begin{equation}
\begin{aligned}
&<\delta C_i(\vec{r}_1, 0) \delta C_j(\vec{r}_2, \tau)> \\
&= (2 \pi)^{-\frac{3}{2}} \int e^{i \vec{q} \vec{r_2}} d^3 \vec{q} <\delta C_i(\vec{r}_1, 0) \delta \tilde{C}_j(\vec{q}, \tau)> \\
&= (2 \pi)^{-\frac{3}{2}} \int e^{i \vec{q} \vec{r_2}} d^3 \vec{q} <\delta C_i(\vec{r}_1, 0) \sum_{s=1}^{m} (\pmb{X} e^{\pmb{\Lambda} \tau} \pmb{X}^{-1})_{[j, s]} \tilde{C}_{s}(\vec{q}, 0)> \\
&= (2 \pi)^{-\frac{3}{2}} \int e^{i \vec{q} \vec{r_2}} \sum_{s=1}^{m} (\pmb{X} e^{\pmb{\Lambda} \tau} \pmb{X}^{-1})_{[j, s]} d^3 \vec{q} <\delta C_i(\vec{r}_1, 0) \tilde{C}_{s}(\vec{q}, 0)> \\
&= (2 \pi)^{-3} \int e^{i \vec{q} \vec{r_2}} \sum_{s=1}^{m} (\pmb{X} e^{\pmb{\Lambda} \tau} \pmb{X}^{-1})_{[j, s]} d^3 \vec{q} <\delta C_i(\vec{r}_1, 0) \int e^{-i \vec{q} \vec{r}_3} \delta C_s(\vec{r}_3, 0) d^3 \vec{r}_3> \\
&= (2 \pi)^{-3} \int e^{i \vec{q} \vec{r_2}} \sum_{s=1}^{m} (\pmb{X} e^{\pmb{\Lambda} \tau} \pmb{X}^{-1})_{[j, s]} d^3 \vec{q} \int e^{-i \vec{q} \vec{r}_3}  d^3 \vec{r}_3 <\delta C_i(\vec{r}_1, 0) \delta C_s(\vec{r}_3, 0)> \\
&= (2 \pi)^{-3} \bar{C}_i \int e^{i \vec{q} \vec{r_2}} \sum_{s=1}^{m} (\pmb{X} e^{\pmb{\Lambda} \tau} \pmb{X}^{-1})_{[j, s]} d^3 \vec{q} \int e^{-i \vec{q} \vec{r}_3} \delta_{is} \delta(\vec{r}_1 - \vec{r}_3) d^3 \vec{r}_3 \\
&= (2 \pi)^{-3} \bar{C}_i \int e^{i \vec{q} (\vec{r}_2 - \vec{r}_1)} \sum_{s=1}^{m} (\pmb{X} e^{\pmb{\Lambda} \tau} \pmb{X}^{-1})_{[j, s]} d^3 \vec{q} \delta_{is} \\
&= (2 \pi)^{-3} \bar{C}_i \int e^{i \vec{q} (\vec{r}_2 - \vec{r}_1)} (\pmb{X} e^{\pmb{\Lambda} \tau} \pmb{X}^{-1})_{[j, i]} d^3 \vec{q} \\
\end{aligned}
\label{correlationSolution}
\end{equation}$$

Then substitute the above equation $\eqref{correlationSolution}$ and the light field function into the equation $\eqref{correlationExpand}$,

$$\begin{aligned}
G(\tau)
&=\frac{(\Delta t)^2}{\bar{n}^2} \int d^3 \vec{q} \iint (2 \pi)^{-3} e^{i \vec{q} (\vec{r}_2 - \vec{r}_1)} I(\vec{r}_1) I(\vec{r}_2) d^3 \vec{r}_1 d^3 \vec{r}_2 \sum_{i} \sum_{j} Q_i Q_j \bar{C}_i (\pmb{X} e^{\pmb{\Lambda} \tau} \pmb{X}^{-1})_{[j, i]} \\
&=\frac{(\Delta t)^2}{\bar{n}^2} \int d^3 \vec{q} [\int (2 \pi)^{-\frac{3}{2}} e^{- i \vec{q} \vec{r}_1} I(\vec{r}_1) d^3 \vec{r}_1] [\int (2 \pi)^{-\frac{3}{2}} e^{- i \vec{q} \vec{r}_2} I(\vec{r}_2) d^3 \vec{r}_2]^* \sum_{i} \sum_{j} Q_i Q_j \bar{C}_i (\pmb{X} e^{\pmb{\Lambda} \tau} \pmb{X}^{-1})_{[j, i]} \\
&=\frac{(\Delta t)^2}{\bar{n}^2} \int |\tilde{I}(\vec{q})|^2 \sum_{i} \sum_{j} Q_i Q_j \bar{C}_i (\pmb{X} e^{\pmb{\Lambda} \tau} \pmb{X}^{-1})_{[j, i]} d^3 \vec{q} \\
\end{aligned}$$

where $^*$ means complex conjugation.

The light field in the confocal microscope can be described by the Gaussian function,

$$ I(\vec{r}) = I_0 e^{-\frac{2 (x^2+y^2)}{\omega_{xy}^2}-\frac{2 z^2}{\omega_z^2}} $$

Thus the Fourier transformation of the light field function is,

$$\begin{aligned}
\tilde{I}(\vec{q})
&= (2 \pi)^{-\frac{3}{2}} I_0 \iiint e^{- i \vec{q} (\vec{x}+\vec{y}+\vec{z})} e^{-\frac{2 (x^2+y^2)}{\omega_{xy}^2}-\frac{2 z^2}{\omega_z^2}} dx dy dz \\
&= I_0 \frac{\omega_{xy}^2 \omega_z}{8} e^{-\frac{\omega_{xy}^2}{8} (q_x^2 + q_y^2) - \frac{\omega_z^2}{8} q_z^2} \\
\end{aligned}$$

The integral of light field function over the space is the special case of the Fourier transformation where $\vec{q}=0$, so the average fluorescent intensity $\bar{n}$ is,

$$\begin{equation}
\bar{n} = \Delta t \int I(\vec{r}) \pmb{Q} \pmb{\bar{C}} d^3 \vec{r} = \Delta t (2 \pi)^{\frac{3}{2}} \sum_l Q_l \bar{C}_l \tilde{I}(0) = \Delta t I_0 \omega_{xy}^2 \omega_{z} (\frac{\pi}{2})^{\frac{3}{2}} \sum_l Q_l \bar{C}_l \label{intensity}
\end{equation}$$

Thus, the general correlation function of concentration fluctuation is,

$$\begin{equation}
G(\tau) = \frac{1}{(2 \pi)^3 (\sum_l Q_l \bar{C}_l)^2} \int e^{-\frac{\omega_{xy}^2}{4} (q_x^2 + q_y^2) - \frac{\omega_z^2}{4} q_z^2} \sum_{i} \sum_{j} Q_i Q_j \bar{C}_i (\pmb{X} e^{\pmb{\Lambda} \tau} \pmb{X}^{-1})_{[j, i]}d^3 \vec{q} \label{correlationGeneral}
\end{equation}$$

### single component diffusion scenario

The diffusion function is,

$$ \frac{\partial \delta C(\vec{r}, t)}{\partial t} = D \nabla^2 \delta C(\vec{r}, t) $$

The matrix $\pmb{M} = -\vec{q}^2 D$, which only has one element. Thus $\lambda = -\vec{q}^2 D$ and $\pmb{X}=1$ trivially. According to the equation $\eqref{correlationGeneral}$ we have,

$$\begin{aligned}
G(\tau)
&= \frac{1}{(2 \pi)^3 \bar{C}} \int e^{-\frac{\omega_{xy}^2}{4} (q_x^2 + q_y^2) - \frac{\omega_z^2}{4} q_z^2} e^{-(q_x + q_y + q_z)^2 D \tau} d^3 \vec{q} \\
&= \frac{1}{\pi^{\frac{3}{2}} \bar{C}} (\omega_{xy}^2 + 4 D \tau)^{-1} (\omega_{z}^2 + 4 D \tau)^{-\frac{1}{2}} \\
&= \frac{1}{\pi^{\frac{3}{2}} \omega_{xy}^2 \omega_z \bar{C}} (1 + \frac{\tau}{(\omega_{xy}^2 / 4D)})^{-1} (1 + \frac{\tau}{(\omega_z^2 / 4D)})^{-\frac{1}{2}} \\
&= \frac{1}{V \bar{C}} (1+\frac{\tau}{\tau_D})^{-1} (1+\frac{\tau}{\epsilon^2 \tau_D})^{-\frac{1}{2}} \\
\end{aligned}$$

where $V = \pi^{\frac{3}{2}} \omega_{xy}^2 \omega_z$ is defined as the effective sampling volume, $\tau_D=\frac{\omega_{xy}^2}{4D}$ is the diffusion time over the $xy$ plane and $\epsilon = \frac{\omega_z}{\omega_{xy}}$ is the waist ratio of the light field.

### diffusion coupled with reaction scenario

Considering a simple isomerization reaction (e.g. the transformation from singlet state to triplet state of fluorescent dyes),

$$ A \leftrightarrow B $$

where the reaction rate constants are $k_{AB}$ and $k_{BA}$. Also we assume that both their diffusion coefficients are $D$, which is often met in experiments. So the matrix $\pmb{M}$ is,

$$\begin{bmatrix}
-k_{AB}-\vec{q}^2 D & k_{BA} \\
k_{AB} & -k_{BA}-\vec{q}^2 D \\
\end{bmatrix}$$

and its $\pmb{\Lambda}$ and $\pmb{X}$ are,

$$\begin{aligned}
\pmb{\Lambda} &= \begin{bmatrix} -\vec{q}^2 D & \\ & -k_{AB}-k_{BA}-\vec{q}^2D \\ \end{bmatrix} \\
\pmb{X} &= \begin{bmatrix} 1 & 1 \\ \frac{k_{AB}}{k_{BA}} & -1 \\ \end{bmatrix} \\
\end{aligned}$$

Thus we have the solution matrix,

$$\begin{aligned}
\pmb{X} e^{\pmb{\Lambda} \tau} \pmb{X}^{-1}
&= \begin{bmatrix} 1 & 1 \\ \frac{k_{AB}}{k_{BA}} & -1 \\ \end{bmatrix} \begin{bmatrix} e^{-\vec{q}^2 D \tau} & \\ & e^{-(k_{AB}+k_{BA}+\vec{q}^2 D) \tau} \\ \end{bmatrix} \begin{bmatrix} \frac{k_{BA}}{k_{AB}+k_{BA}} & \frac{k_{BA}}{k_{AB}+k_{BA}} \\ \frac{k_{AB}}{k_{AB}+k_{BA}} & -\frac{k_{BA}}{k_{AB}+k_{BA}} \\ \end{bmatrix} \\
&= \begin{bmatrix} e^{\lambda_1 \tau} & e^{\lambda_2 \tau} \\ K e^{\lambda_1 \tau} & -e^{\lambda_2 \tau} \\ \end{bmatrix} \begin{bmatrix} \frac{1}{1+K} & \frac{1}{1+K} \\ \frac{K}{1+K} & -\frac{1}{1+K} \\ \end{bmatrix} \\
&= (1+K)^{-1} \begin{bmatrix} e^{\lambda_1 \tau} + K e^{\lambda_2 \tau} & e^{\lambda_1 \tau}-e^{\lambda_2 \tau} \\ K (e^{\lambda_1 \tau}-e^{\lambda_2 \tau}) & K e^{\lambda_1 \tau} + e^{\lambda_2 \tau} \\ \end{bmatrix} \\
\end{aligned}$$

where $K=\frac{k_{AB}}{k_{BA}}$ is the reaction dissociation constant.

The general formula of $G(\tau)$ is,

$$ G(\tau) = \frac{1}{(2 \pi)^3 (\sum_l Q_l \bar{C}_l)^2} \int e^{-\frac{\omega_{xy}^2}{4} (q_x^2 + q_y^2) - \frac{\omega_z^2}{4} q_z^2} \sum_{i} \sum_{j} Q_i Q_j \bar{C}_i (\pmb{X} e^{\pmb{\Lambda} \tau} \pmb{X}^{-1})_{[j, i]}d^3 \vec{q} $$

If $Q_A=Q$ and $Q_B=0$, only the first-row first-column element in the matrix $\pmb{X} e^{\pmb{\Lambda} \tau} \pmb{X}^{-1}$ contributes to $G(\tau)$,

$$\begin{aligned}
G(\tau)
&= \frac{1}{(2 \pi)^3 \bar{C}_A} \int e^{-\frac{\omega_{xy}^2}{4} (q_x^2 + q_y^2) - \frac{\omega_z^2}{4} q_z^2} (1+K)^{-1} (e^{\lambda_1 \tau} + K e^{\lambda_2 \tau}) d^3 \vec{q} \\
&= \frac{1}{(2 \pi)^3 (\bar{C}_A + \bar{C}_B)} \int e^{-\frac{\omega_{xy}^2}{4} (q_x^2 + q_y^2) - \frac{\omega_z^2}{4} q_z^2} (e^{\lambda_1 \tau} + K e^{\lambda_2 \tau}) d^3 \vec{q} \\
\end{aligned}$$

Noticed that $\bar{C}_A (1+K) = \bar{C}_A+\bar{C}_B$ because $K$ is the dissociation constant. The integral has two additive parts,

$$\begin{aligned}
FIRST \ PART &= \frac{1}{V (\bar{C}_A + \bar{C}_B)} (1+\frac{\tau}{\tau_D})^{-1} (1+\frac{\tau}{\epsilon^2 \tau_D})^{-\frac{1}{2}} \\
SECOND \ PART &= \frac{K}{V (\bar{C}_A + \bar{C}_B)} (1+\frac{\tau}{\tau_D})^{-1} (1+\frac{\tau}{\epsilon^2 \tau_D})^{-\frac{1}{2}} \exp[-\frac{\tau}{\tau_R}]
\end{aligned}$$

where $\tau_R = (k_{AB}+k_{BA})^{-1}$ is the reaction time. Finally, we add the two parts and get the expression of the two-state reaction,

$$\begin{aligned}
G(\tau)
&= FIRST \ PART + SECOND \ PART \\
&= \frac{1}{V (\bar{C}_A + \bar{C}_B) } (1+\frac{\tau}{\tau_D})^{-1} (1+\frac{\tau}{\epsilon^2 \tau_D})^{-\frac{1}{2}} (1 + K \exp(-\frac{\tau}{\tau_R})) \\
&= G_0 G_D(\tau) G_R(\tau) \\
\end{aligned}$$

Different processes of different time scales represented in $G(\tau)$ clearly. If $\tau << \tau_D, \tau_R$, $G(\tau) = \frac{1+K}{V(\bar{C}_A+\bar{C}_B)} = \frac{1}{V \bar{C}_A}$. It means the time resolution is enough to detect the fluorescent molecules conversation. If $\tau_R << \tau << \tau_D$, $G(\tau) = \frac{1}{V (\bar{C}_A + \bar{C}_B)}$. It means in this time scale all of molecules appear to be fluorescent due to the fast tunrover between the A and B states.
## References

[1] Krichevsky, Oleg, and Grégoire Bonnet. "Fluorescence correlation spectroscopy: the technique and its applications." *Reports on Progress in Physics* 65.2 (2002): 251.
