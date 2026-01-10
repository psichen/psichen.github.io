---
title: viscoelasticity of soft vesicles
tags: [force curves, AFM, viscoelasticity]
---

## Viscoelastic models

Viscoelastic materials undergoing strain and stress are often approximated by mechanical components such as springs (for elasticity) and dashpots (for viscosity).

Spring:
\begin{equation}
\sigma = E \epsilon \label{spring}
\end{equation}
where $E$ is the Young's modulus.

Dashpot:
\begin{equation}
\sigma = \eta \frac{d \epsilon}{d t} \label{dashpot}
\end{equation}
where $\eta$ is the viscosity.

### Maxwell materials & Kelvin-Voigt material

Maxwell materials are approximated as,

```tikz
\usepackage{circuitikz}
\begin{document}

\begin{circuitikz}

\draw (0,0) to[spring, l=\(E\), o-] (2,0);
\draw (2,0) to[damper,l=\(\eta\), -o] (4,0);

\end{circuitikz}
\end{document}
```

where the total strain $\epsilon$ and the total stress $\sigma$ are defined as,

\begin{align}
\epsilon &= \epsilon_{\text{spring}} + \epsilon_{\text{dashpot}} \\
\sigma &= \sigma_{\text{spring}} = \sigma_{\text{dashpot}} \\
\end{align}

Kelvin-Voigt materials are approximated as,

```tikz
\usepackage{circuitikz}
\begin{document}

\begin{circuitikz}

\draw (0.6,0) -- (0.6, 0.6);
\draw (0.6,0) -- (0.6,-0.6);
\draw (0,0) to[short, -o] (0.6,0);
\draw (0.6, 0.6) to[spring, l=\(E\)] (2.6, 0.6);
\draw (0.6,-0.6) to[damper,l_=\(\eta\)] (2.6,-0.6);
\draw (2.6, 0.6) -- (2.6, 0);
\draw (2.6,-0.6) -- (2.6, 0);
\draw (2.6, 0) to[short, o-] (3.2, 0);

\end{circuitikz}
\end{document}
```

where the total strain $\epsilon$ and the total stress $\sigma$ are defined as,

\begin{align}
\epsilon &= \epsilon_{\text{spring}} = \epsilon_{\text{dashpot}} \\
\sigma &= \sigma_{\text{spring}} + \sigma_{\text{dashpot}} \\
\end{align}

### Standard linear solid model

Combine these two models in parallel, we get the Standard linear solid model in Maxwell representation,

```tikz
\usepackage{circuitikz}
\begin{document}

\begin{circuitikz}

\draw (0.6,0) -- (0.6, 0.6);
\draw (0.6,0) -- (0.6,-0.6);
\draw (0,0) to[short, -o] (0.6,0);
\draw (0.6, 0.6) to[spring, l=\(E_1\)] (4.6, 0.6);
\draw (0.6,-0.6) to[spring, l_=\(E_2\)] (2.6,-0.6);
\draw (2.6,-0.6) to[damper,l_=\(\eta\)] (4.6,-0.6);
\draw (4.6, 0.6) -- (4.6, 0);
\draw (4.6,-0.6) -- (4.6, 0);
\draw (4.6, 0) to[short, o-] (5.2, 0);

\end{circuitikz}
\end{document}
```

where the total strain $\sigma$ and the total stress $\epsilon$ are related as,

\begin{align}
\epsilon &= \epsilon_{1} = \epsilon_{M} \label{strain_1} \\
\sigma &= \sigma_{1} + \sigma_{M} \label{stress_1} \\
\epsilon_{M} &= \epsilon_{2} + \epsilon_{D} \label{strain_2} \\
\sigma_{M} &= \sigma_{2} = \sigma_{D} \label{stress_2} \\
\end{align}

where the subscript $1$ and $2$ correspond to the sping $1$ above and the spring $2$ in the Maxwell arm, respectively.

Now we want to know the function relationship between the total stress $\sigma$ and the total strain $\epsilon$, so that we can fit mechanical properties by measuring external strain and stress.

First let's look into the Maxell branch. Because all stresses in the Maxwell arm are the same, it would be easier if we can express the eq $\eqref{strain_2}$ as a function of stress variables in $\eqref{stress_2}$. The stress of a dashpot depends on the strain rate, so we derivate eq $\eqref{strain_2}$ with repect to $t$ and substitute eqs. $\eqref{spring}$ and $\eqref{dashpot}$,

\begin{align}
\dot{\epsilon} = \dot{\epsilon}_M &=  \dot{\epsilon}_2 + \dot{\epsilon}_D \\
&= \dot{\sigma}_M / E_2 + \sigma_M / \eta \\
\color{blue}{\text{Laplace transform}} \rightarrow s \bar{\epsilon} &=  \frac{s}{E_2} \bar{\sigma}_M + \frac{1}{\eta} \bar{\sigma}_M \\
\bar{\sigma}_M &= \frac{E_2}{(s + E_2/\eta)} s \bar{\epsilon} \label{Maxwell_stress} \\
\end{align}

Then let's look into the whole circuit. Since the strains are the same between two arms now, we should try to subtitute the eq $\eqref{stress_1}$ by strain variables in eq $\eqref{strain_1}$,

\begin{align}
\bar{\sigma} &= \bar{\sigma}_1 + \bar{\sigma}_M \\
&= E_1 \bar{\epsilon} + \bar{\sigma}_M \\
\color{blue}{\text{eq. } \eqref{Maxwell_stress}} \rightarrow &= \big{(} E_1 + \frac{E_2}{(s + E_2 / \eta)} s \big{)} \bar{\epsilon} \label{dynamic_equation} \\
\end{align}

When we apply a constant strain $\epsilon(t) = \epsilon_0 H(t)$, where $H(t)$ is the Heaviside function and $\bar{\epsilon}=\epsilon_0 / s$, we can get the time evolution of the stress,

\begin{align}
\bar{\sigma} &= \frac{E_1 \epsilon_0}{s} + \frac{E_2 \epsilon_0}{(s + E_2 / \eta)} \\
\color{blue}{\text{inverse Laplace transform}} \rightarrow \sigma &= E_1 \epsilon_0 + E_2 \epsilon_0 \exp(-t / \tau) \\
\end{align}

where $\tau = \eta / E_2$ is the relaxation time. The dynamic equation in Laplace space eq. $\eqref{dynamic_equation}$ can be rearranged as,

\begin{align*}
\eta \dot{\sigma} + E_2 \sigma &= \eta (E_1 + E_2) \dot{\epsilon} + E_1 E_2 \epsilon \\
(1 + \frac{\eta}{E_2} \frac{d}{dt}) \sigma &= E_1 (1 + \eta \frac{E_1 + E_2}{E_1 E_2} \frac{d}{dt}) \epsilon \\
\end{align*}

## Solid mechanics

### Poisson's ratio

The Poisson's ratio is defined as the ralative material deformation on the direction perpendicular to the direction of loading,

$$
\nu = - \frac{d \epsilon_{trans}}{d \epsilon_{axial}}
$$

```tikz
\begin{document}
\begin{tikzpicture}

\draw[thick] (0,0) ellipse (1cm and .5cm);
\draw[thick] (0,3) ellipse (1cm and .5cm);
\draw[thick] (-1,0) -- (-1,3);
\draw[thick] ( 1,0) -- ( 1,3);

\draw[thick, dashed] (0,-.5) ellipse (.8cm and .3cm);
\draw[thick, dashed] (0,3.5) ellipse (.8cm and .3cm);
\draw[thick, dashed] (-.8,-.5) -- (-.8,3.5);
\draw[thick, dashed] ( .8,-.5) -- ( .8,3.5);

\draw[thick, ->] (0,4) -- (0, 5) node[above]{\(\sigma_z\)};
\draw[thick, ->] (0,-1) -- (0, -2) node[below]{\(\sigma_z\)};

\end{tikzpicture}
\end{document}
```

Thus, the Poisson's raio of incompressible materials is 0.5.

### Young's modulus and Shear modulus

Shear stress $\tau$ is generated when a force is applied prallel to its surface, causing material layers to slide, and the deformation along the force direction is the shear strain $\gamma$,

$$
\tau = G \gamma
$$
where $G$ is the shear modulus, also called modulus of rigidity.

```tikz
\begin{document}
\begin{tikzpicture}

\draw[thick] (0,0) rectangle (4,4);
\draw[thick, dashed] (0,0) -- (1,3.95) -- (5,3.95) -- (4,0) -- cycle;
\draw[<->] (0,4.2) -- (4,4.2) node[above,midway]{a};
\draw[<->] (-.2,0) -- (-.2,4) node[left,midway]{a};
\draw[<->] (4,4.2) -- (5,4.2) node[above,midway] {\( \gamma a\)};

\draw[red] (4,3.5) arc (-90:-135:.5);
\draw[red] (4.9,3.5) arc (-90:-130:.5);

\draw[thick,dotted] (0,0) -- (4,4);
\draw[thick,dotted] (0,0) -- (5,3.95);

\end{tikzpicture}
\end{document}
```

When the shear strain $\gamma$ is small such that the angle is unchanged, *i.e.*, $\frac{\pi}{4}$, before and after deformation, the strain on the diagonal is,

\begin{equation}
\frac{\Delta d}{\sqrt{2} a} = \frac{\gamma a \cos(\pi/4)}{\sqrt{2} a} = \gamma / 2
\end{equation}

So we can connect shear modulus $G$ with Young's modulus $E$ by the principle of superposition of stress pairs,

```tikz
\begin{document}
\begin{tikzpicture}

\draw[thick] (-8,0) rectangle (-4,4);

\draw[->] (-7,4.2) -- (-5,4.2) node[above,midway]{\( \tau \)};
\draw[->] (-3.8,1) -- (-3.8,3) node[right,midway]{\( \tau \)};
\draw[<-] (-8.2,1) -- (-8.2,3) node[left,midway]{\( \tau \)};
\draw[<-] (-7,-.2) -- (-5,-.2) node[below,midway]{\( \tau \)};

\draw[ultra thick, latex-latex] (-3,2) -- (-1,2);

\draw[thick] (0,0) rectangle (4,4);

\draw[->] (0,0) -- (-1,-1) node[above,midway]{\(\sigma\)};
\draw[->] (4,4) -- (5,5) node[above,midway]{\(\sigma\)};
\draw[<-] (0,4) -- (-1,5) node[above,midway]{\(\sigma\)};
\draw[<-] (4,0) -- (5,-1) node[above,midway]{\(\sigma\)};

\draw[thick,dotted] (0,0) -- (4,4) node[above,midway]{d};

\node[] at (-6,-1) {shear};
\node[] at ( 2,-1) {tensile};

\end{tikzpicture}
\end{document}
```

Young's modulus $E$ and shear modulus (modulus of rigidity) $G$ are correlated by Poisson's ratio $\nu$,

\begin{align}
E \gamma /2 = G 
\end{align}

$$
E = 2 G (1 + \nu)
$$

## stress-strain relation in rheology

\begin{align}
\sigma_{ij}^{*}(t) = 2 \int_{-\infty}^{t} G(t-s) \frac{\partial \epsilon_{ij}^{*}(s)}{\partial s} ds \\
\epsilon_{ij}^{*}(t) = \frac{1}{2} \int_{-\infty}^{t} J(t-s) \frac{\partial \sigma_{ij}^{*}(s)}{\partial s} ds \\
\end{align}
