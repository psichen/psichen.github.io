---
title: Convolution, Nyquist frequency and PSF/CTF
tags: [transfer function, susceptibility, linear response, convolution]
---

## Convolution ##

Convolution is defined as,
$$
(f*g)(t) := \int_{-\infty}^{\infty} f(\tau) g(t-\tau) d\tau
$$
The sum of variables in function $f$ and $g$ is equal to the variable in the convolved function $(f*g)$.
It's a widely-used concept in probability theory and linear response.

#### probability theory ####

For random variables $X$ and $Y$ with known probability density funciton (PDF), the PDF of a new random variable $N := X+Y$ is given by,
$$
f_{N}(n) = \int_{-\infty}^{\infty} f_{x}(n-k)f_{y}(k) dk 
$$
As we can see, the event number $n$ is contributed from $n-k$ of $X$ and $k$ of $Y$.

Let's take the Poisson distribution as a simple example. The Fourier transfer of the convolution of $X \sim P(\lambda)$ and $Y \sim P(\mu)$ is the product of their respective Fourier transfer, and according to [the moment generating function](https://psichen.github.io/2021/02/13/common-probability-mass-functions/) and [characteristic function](https://psichen.github.io/2021/02/11/generating-functions-of-probability-distribution/#characteristic-functions), the Fourier transfer of Poisson distribution is as the similar expression of its characteristic function,
$$
\begin{align*}
(P_{\lambda} * P_{\mu}) (t)
&=  \mathscr{F}^{-1}[ \mathscr{F}[P_{\lambda}] \cdot \mathscr{F}[P_{\mu}] ] \\
&=  \mathscr{F}^{-1}[ e^{\lambda ( e^{-it} - 1 )} \cdot e^{\mu ( e^{-it} - 1 )}] \\
&=  \mathscr{F}^{-1}[ e^{ (\lambda + \mu) (e^{-it} - 1) } ] \\
\end{align*}
$$

So the probability mass function of $X+Y$ is,
$$
X+Y \sim P(\lambda + \mu) = \frac{(\lambda+\mu)^k e^{-(\lambda + \mu)}}{k!}
$$
which is consistent with the additivity of Poisson distribution.

#### linear response ####

We can imagine an input $h(\mathbf{x},t)$ (e.g. force) and an output $s(\mathbf{x},t)$ (e.g. position). If $h(\mathbf{x},t)$ is a weak perturbation, we can presume a linear response, but usually the response will dependent not only on the present $h(\mathbf{x},t)$ but also the past values. It's intuitive because system needs time to decay or relax after stimulated. Approximately $s(\mathbf{x},t)$ is a weighted sum of the previous values of $h(\mathbf{x}',t')$, and the weights are given by the linear response function $\chi(\mathbf{x}-\mathbf{x}',t-t')$
$$
s(\mathbf{x}, t) = \int d\mathbf{x'} \int_{-\infty}^{t} dt' \chi(\mathbf{x} - \mathbf{x}', t-t') h(\mathbf{x}', t')
$$
The response function $\chi(\mathbf{x}-\mathbf{x}',t-t')$ is also called transfer function, point spread function, susceptibility, impulse response or impedance, dependent on which scenario it is.

In imaging, the photon detectors are typically linearly responded to photons, and convert the optical signals to digital signals. The pixel would be affected by the near activated pixels, so the final image is actually a convolution of spatial distribution of detected photons and point spread function (PSF).

## contrast transfer function ##

The phase of an electron wave is shifted when the electron wave pass near the nucleus of atoms, thus giving a phase contrast in cryo-EM imaging.

### scattered electrons ###

Let's say the incident electron has the time-independent wavefunction,
$$
\Psi = \exp(i \boldsymbol{k} \cdot \boldsymbol{z})
$$
where $\boldsymbol{k}$ is the wave vector and has the amplitude of $\frac{2 \pi}{\lambda}$. The wave is the propagating direction in the $\boldsymbol{z}$ direction.

After the electron passes through the thin specimen, the wave function reflects the phase shift as,
$$
\Psi = \exp[ i (\boldsymbol{k} \cdot \boldsymbol{z} + \phi(x)) ]
$$
Assuming $\boldsymbol{z} = 0$ and applying Taylor expansion,
$$
\exp(i \phi(x)) \approx 1 + i \phi(x)
$$
It's called *Weak Phase Approximation*.

The phase of scattered electrons are 90 degrees in advanced.

$$
CTF = \sin(- \pi \Delta z \lambda k^2 + \frac{\pi C_{s} \lambda^3 k^4}{2})
$$

The CTF is the Fourier transfer of the point spread function (PSF).

## SNR ##
Bell is the unit to describe the ratio of power,
$$
B = \log(\frac{P_{1}}{P_{2}})
$$
So decibel is defined as,
$$
dB = 10 \log(\frac{P_{1}}{P_{2}})
$$
just like decimeter. For non-power quantities like voltage or pressure, the power is proportional to the square of voltage or pressure, so the decibel is defined as,
$$
dB = 20 \log(\frac{V_{1}}{V_{2}})
$$

## Bandwidth ##

## B-splines ##

## References ##

[Phase-contrast imaging in the EM](https://nccat.nysbc.org/wp-content/uploads/2020/03/2-Phase-contrast.pdf)

