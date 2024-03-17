---
title: residue therom and inverse Laplace transform
tags: [Laplace transform]
---

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
However, bases $e^{i \omega t}$ are not orthonormal,
$$
< e^{i \omega t}, e^{i \omega t} > = \int_{-\frac{T}{2}}^{\frac{T}{2}} e^{i \omega t} e^{-i \omega t} \, dt = T = \frac{2\pi}{\delta \omega}
$$
where $T$ is the periodicity of basis on $t$-domain and $\delta \omega$ is the angular *sampling* frequency. Substituting $\eqref{projection}$ into $\eqref{vector_sum}$, we will find the normalization factor $\frac{1}{2\pi}$ in the inverse Fourier transform,
$$
\begin{align*}
        f(t) &= \sum_{\omega=-\infty}^{\infty} \color{blue}{\lim_{T \to \infty}  \frac{\int_{-\frac{T}{2}}^{\frac{T}{2}} f(t') e^{-i \omega t'} \, dt'}{T}} e^{i \omega t} \\
        &= \sum_{\omega=-\infty}^{\infty} \color{blue}{\lim_{\delta \omega \to 0}  \frac{\widetilde{F}(\omega)}{2\pi} \delta \omega} e^{i \omega t} \\
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
\widetilde{F}[k] = \sum_{n=0}^{N-1} f[n] e^{-i 2 \pi k n / N}
$$
Similarly, the inner product of vector bases $e^{i 2 \pi k n / N}$ is $N$, so the inverse discrete Fourier transform is,
$$
\begin{align}
f[n] &= \sum_{k=0}^{N-1} \color{blue}{\frac{< f[n'], e^{i 2 \pi k n' / N} >}{< e^{i 2 \pi k n' / N}, e^{i 2 \pi k n' / N} >}} e^{i 2 \pi k n / N} \\
&= \frac{1}{N} \sum_{k=0}^{N-1} \color{blue}{\widetilde{F}[k]} e^{i 2 \pi k n / N} \label{dft} \\
\end{align}
$$
When $N \to \infty$, Eq. $\eqref{dft}$ will converge to Eq. $\eqref{cft}$, in which $d\omega = 1/N$.

## Fundamentals of complex analysis ##


## Exponential order ##

We say $f(t)$ is of exponential order if there exist numbers $c$, $M>0$ and $T>0$ so that
$$
 |f(t)| \le M e^{ct} \,\,\,\, \text{for} \,\,\,\, t > T
$$

## Region of convergence ##

absolute convergence for integral
$$
\int_0^{\infty} |f(t) e^{-st}| \, dt < \infty
$$

## Inverse Laplace transform ##

The inverse Laplace transform is,
$$
\mathcal{L}^{-1}[F(s)] = \lim_{\omega \to \infty} \int_{\sigma-\omega j}^{\sigma+\omega j} F(s) e^{st} \, ds
$$
where $\sigma$ is the the abscissa of absolute convergence.

