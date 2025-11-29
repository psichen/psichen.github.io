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

### Maxwell materials

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

### Kelvin-Voigt materials

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

Now we want to know the function relationship between the total stress $\sigma$ and the total strain $\epsilon$, so that we can know mechanical properties by measuring external strain and stress.

First let's look into the Maxell arm. Because all stresses in the Maxwell arm are the same, it would be easier if we can express the eq $\eqref{strain_2}$ as a function of stress variables in $\eqref{stress_2}$. The stress of a dashpot depends on the strain rate, so we derivate eq $\eqref{strain_2}$ with repect to $t$ and substitute eqs. $\eqref{spring}$ and $\eqref{dashpot}$,

\begin{align}
\dot{\epsilon} = \dot{\epsilon}_M &=  \dot{\epsilon}_2 + \dot{\epsilon}_D \\
&= \dot{\sigma}_M / E_2 + \sigma_M / \eta \\
\color{blue}{\text{Laplace transform}} \rightarrow s \bar{\epsilon} &=  \frac{s}{E_2} \bar{\sigma}_M + \frac{1}{\eta} \bar{\sigma}_M \\
\bar{\sigma}_M &= \frac{E_2}{(s + E_2/\eta)} s \bar{\epsilon} \label{Maxwell stress} \\
\end{align}

Then let's look into the whole circuit. Since the strains are the same between two arms now, we should try to subtitute the eq $\eqref{stress_1}$ by strain variables in eq $\eqref{strain_1}$,

\begin{align}
\bar{\sigma} &= \bar{\sigma}_1 + \bar{\sigma}_M \\
&= E_1 \bar{\epsilon} + \bar{\sigma}_M \\
\color{blue}{\text{eq. } \eqref{Maxwell stress}} \rightarrow &= \big{(} E_1 + \frac{E_2}{(s + E_2 / \eta)} s \big{)} \bar{\epsilon} \\
\end{align}

When we apply a constant strain $\epsilon(t) = \epsilon_0 H(t)$, where $H(t)$ is the Heaviside function and $\bar{\epsilon}=\epsilon_0 / s$, we can get the time evolution of the stress,

\begin{align}
\bar{\sigma} &= \frac{E_1 \epsilon_0}{s} + \frac{E_2 \epsilon_0}{(s + E_2 / \eta)} \\
\color{blue}{\text{inverse Laplace transform}} \rightarrow \sigma &= E_1 \epsilon_0 + E_2 \epsilon_0 \exp(-t / \tau) \\
\end{align}

where $\tau = \eta / E_2$ is the relaxation time.
