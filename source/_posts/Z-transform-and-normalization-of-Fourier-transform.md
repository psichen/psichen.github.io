---
title: Z-transform and normalization of Fourier transform
tags:
  - Fourier transform
  - Z-transform
  - vector space
  - complex analysis
date: 2024-03-23 12:35:50
---


## Z transform ##

Z transform can be considered as the discrete-time equivalent of the [Laplace transform](http://psichen.github.io/tags/Laplace-transform/). If we sample a continuous signal $x(t)$ with a discrete sampling rate $\frac{1}{T}$, we can substitute the discrete signal $x_d[n]$ by the underlying signal $x_d(t)$ on continuous domain,
$$
x_d(t) = \sum_{n=-\infty}^{\infty} x(nT) \delta(t - nT)
$$
Now we can take the Laplace transform on both sides with respect to time $t$,
$$
\mathcal{L}[x_d(t)] = \sum_{n=-\infty}^{\infty} x(nT) \, \mathcal{L}[\delta (t - nT)] = \sum_{n=-\infty}^{\infty} x(nT) e^{-nTs} = X(e^{Ts})
$$
Let $z=e^{Ts}$, thus the Z transform is given by,
$$
\begin{equation}
X_d(z) = X(e^{Ts}) = \sum_{n=-\infty}^{\infty} x[n] z^{-n} \label{z-transform} = \mathcal{Z}\{x[n]\}
\end{equation}
$$
where $z=e^{Ts}$ is also a complex variable. If we let $z=r \exp(i \omega)$ and let $r=1$, the Z transform would degenerate to the discrete Fourier transform,
$$
X(\omega) = \mathcal{F} \{ x[n] \} = \sum_{n=-\infty}^{\infty} x[n] \exp(-i \omega n) \label{Fourier}
$$
Thus, the discrete Fourier transform is a specialized Z transform which is evaluated on the unit circle in the complex $z$ domain.

```tikz
\begin{document}
\begin{tikzpicture}
\node at (0, 3) {\Large $s$-domain};
\draw [->] (-2,0) to ++(4,0) node [below] {\Large Re($s$)};
\draw [->] (0,-2) to ++(0,4) node [right] {\Large Im($s$)};
\draw [thick, ->, dashed] (2.5,1) to node [midway,above] {\Large $z=e^{Ts}$} (3.5,1);
\node at (6, 3) {\Large $z$-domain};
\draw [->] (4,0) to ++(4,0) node [below] {\Large Re($z$)};
\draw [->] (6,-2) to ++(0,4) node [right] {\Large Im($z$)};
\draw [ultra thick,blue] (6,0) circle [radius=1];
\draw [ultra thick,blue] (0,-1) to (0,1);
\end{tikzpicture}
\end{document}
```

As we can see, the inner product of unit circles in vector space $<e^{i\theta}, e^{i\theta} >_{\theta}$ is equal to $2\pi$, thus normalization is required to ensure conservation.

## Normalization of Fourier transform ##

The $\sin(\theta)$ and $\cos(\theta)$ functions and the corresponding exponential form $e^{i \theta}$ have a periodicity of $2\pi$, which makes $e^{i \theta}$ as vector bases in function space are not orthonormal (the inner product $< e^{i \theta}, e^{i \theta} > = \int_{-\pi}^{\pi} e^{i \theta} e^{-i \theta} \, d\theta= 2 \pi$). So normalization is needed between forward and backward Fourier transform.

### continuous ###

The function $f(t)$ defined on $[-\frac{T}{2}, \frac{T}{2}]$ can be expressed by a set of bases in vector space of functions,
$$
\begin{equation}
f(t) = \sum_{\omega=-\infty}^{\infty} A_{\omega} e^{i \omega t} \label{vector_sum}
\end{equation}
$$
where $e^{i \omega t}$ is the vector basis and $A_{\omega}$ is the projected length of $f(t)$ on the basis $e^{i \omega t}$,
$$
\begin{equation}
A_{\omega} = \frac{< f(t), e^{i \omega t} >}{< e^{i \omega t}, e^{i \omega t} >} \label{projection}
\end{equation}
$$
The Fourier transform $\widetilde{F}(\omega)$ is defined exactly as $< f(t), e^{i \omega t} > = \int_{-\frac{T}{2}}^{\frac{T}{2}} f(t) e^{-i \omega t} \, dt$. However, bases $e^{i \omega t}$ are not orthonormal,
$$
< e^{i \omega t}, e^{i \omega t} > = \int_{-\frac{T}{2}}^{\frac{T}{2}} e^{i \omega t} e^{-i \omega t} \, dt = T = \frac{2\pi}{\delta \omega}
$$
where $T$ is the periodicity of basis on $t$-domain and $\delta \omega$ is the angular *sampling* frequency. Substituting $\eqref{projection}$ into $\eqref{vector_sum}$, we will find the normalization factor $\frac{1}{2\pi}$ in the inverse Fourier transform,
$$
\begin{align*}
        f(t) &= \sum_{\omega=-\infty}^{\infty} \lim_{T \to \infty}  \frac{\color{blue}{\int_{-\frac{T}{2}}^{\frac{T}{2}} f(t') e^{-i \omega t'} \, dt'}}{T} e^{i \omega t} \\
        &= \sum_{\omega=-\infty}^{\infty} \lim_{\delta \omega \to 0}  \frac{\color{blue}{\widetilde{F}(\omega)}}{2\pi} \delta \omega e^{i \omega t} \\
        &= \frac{1}{2\pi} \int_{-\infty}^{\infty} \widetilde{F}(\omega) e^{i \omega t} \, d\omega \\
\end{align*}
$$
So the normalization factor comes from the periodicity of vector bases that we choose. If we use $e^{i 2 \pi \omega t}$ as bases, then the Fourier transform and inverse transform are normalized by $1$,
$$
\begin{align}
        \widetilde{F}(\omega) &= \int_{-\infty}^{\infty} f(t) e^{-i 2\pi \omega t} \, dt \\
        f(t) &= \int_{-\infty}^{\infty} \widetilde{F}(\omega) e^{i 2\pi \omega t} \, d\omega \label{cft} \\
\end{align}
$$
where $d\omega=\frac{1}{T}$ is *sampling* frequency here.

### discrete ###

Supposing the $N$-element discrete signal on continuous domain is given by,
$$
f_d(t) = \sum_{n=0}^{N-1} f(nT) \delta(t-nT)
$$
where $T$ is the sampling interval and $T = 1/N$ if we treat the signal as one cycle and make time unit. The Fourier transform is given by,
$$
\mathcal{F}[f_d(t)] = \sum_{n=0}^{N-1} f(nT) \mathcal{F}[\delta(t-nT)] = \sum_{n=0}^{N-1} f(nT) e^{-i \omega nT}
$$
The $N$-element signal can be evaluated as one cycle at discrete angular frequency, 
$$
\omega = \frac{2 \pi}{N} k
$$
where $k=0,1,...,N-1$. Thus the discrete Fourier transform is given by,
$$
\widetilde{F}[k] = \sum_{n=0}^{N-1} f[n] e^{-i 2 \pi k n T / N}
$$
Similarly, the inner product of vector bases $e^{i 2 \pi k n T / N}$ is $N$, so the inverse discrete Fourier transform is,
$$
\begin{align}
f[n] &= \sum_{k=0}^{N-1} \color{blue}{\frac{< f[n'], e^{i 2 \pi k n' T / N} >}{< e^{i 2 \pi k n' T / N}, e^{i 2 \pi k n' T / N} >}} e^{i 2 \pi k n T / N} \\
&= \frac{1}{N} \sum_{k=0}^{N-1} \color{blue}{\widetilde{F}[k]} e^{i 2 \pi k n T / N} \label{dft} \\
\end{align}
$$
When $N \to \infty$, Eq. $\eqref{dft}$ will converge to Eq. $\eqref{cft}$, in which $d\omega = 1/N$.
