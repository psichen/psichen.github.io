---
title: Contrast transfer function in TEM
date: 2022-02-06 15:01:56
tags: [CTF, PSF, envelope function, TEM]
---

The phase of an electron wave is shifted when the electron wave passes near the nucleus of atoms. So the electron wave is imaged on the detected after focused by lens giving a phase contrast in cryo-EM imaging.

<!--more-->

## Interference and phase shift of wave function ##

A wave function can be expressed as,
$$
\Psi(\boldsymbol{r}, t) = A \exp[ i (\boldsymbol{k} \cdot \boldsymbol{r} - \omega t) ]
$$
It means that the displacement of the wave at the position $\boldsymbol{r}$ and time $t$ is equal to $\Psi(\boldsymbol{r}, t)$, and the phase $\phi$ of the wave is equal to $(\boldsymbol{k} \cdot \boldsymbol{r} - \omega t)$.

### interfence ###

When multiple waves meet, they would interfere with each other and the generated displacement is the sum of their respective displacement,
$$
\Psi = A_{1} \exp[i\phi_{1}] + A_{2} \exp[i\phi_{2}] + \dots
$$
Or in the other form of the inverse Fourier transfer,
$$
\Psi(\boldsymbol{r}, t) = \int A(\boldsymbol{k}) \exp[ i (\boldsymbol{k} \cdot \boldsymbol{r} - \omega t) ] d \boldsymbol{k}
$$

### phase shift ###

Because waves can be expressed by the exponential form, so the phsae shift of a wave can be described by the product of wave function,
$$
\exp[ i (\phi_{1} + \phi_{2}) ] = \exp[ i \phi_{1} ] \exp[ i \phi_{2} ]
$$

## Weak phase approximation ##

Let's say the incident electron has the time-independent wavefunction,
$$
\Psi = \exp(i \boldsymbol{k} \cdot \boldsymbol{z})
$$
where $\boldsymbol{k}$ is the wave vector and has the amplitude of $\frac{2 \pi}{\lambda}$. The wave is the propagating direction in the $\boldsymbol{z}$ direction.

After the electron passes through the thin specimen, the wave function reflects the phase shift as,
$$
\Psi = \exp[ i (\boldsymbol{k} \cdot \boldsymbol{z} + \phi(x)) ]
$$
and it'll be diffracted. Assuming $\boldsymbol{z} = 0$ and $\phi(x)$ is very tiny, we can apply Taylor expansion and ignore the high-order terms,
$$
\exp(i \phi(x)) \approx 1 + i \phi(x)
$$
It's called *Weak Phase Approximation*. It means that the introducing a small phase shift in the electron wave (at the specimen) is equivalent to that a diffracted wave $\phi(x)$ interferes with the incident wave. The imaginary number of the wave $\phi(x)$ means the phase of scattered electrons is 90 degrees in advanced.

## Interfere with the incident wave ##

As the incident wave propagates along the $\boldsymbol{z}$ direction, the incident wave and diffracted waves will interfere with each other at $\boldsymbol{z}$ position. Let's say the diffracted angle $\theta = \sin{\frac{\lambda}{d}} \approx \frac{\lambda}{d}$, where $\lambda$ is the wavelength and $d$ is the periodic distance of the specimen. So when the incident wave has a phase shift of $\boldsymbol{k} \cdot \boldsymbol{z}$, the phase shift of diffracted waves is $\boldsymbol{k} \cdot \boldsymbol{z} \cos{\theta}$ due to the geometric relationship. Thus we have the interfered wave at the position $\boldsymbol{z}$,
$$
\Psi = \exp[ i \boldsymbol{k} \cdot \boldsymbol{z} ] + i \phi(x) \exp[ i \boldsymbol{k} \cdot \boldsymbol{z} \cos{\theta} ]
$$
According to quantum mechanics, the intensity of the electron waves is given by the squared amplitude of the wave function,
$$
\begin{align*}
        |\Psi|^2 &= \Psi \cdot \Psi^* \\
        &= \Big{[} \exp[ i \boldsymbol{k} \cdot \boldsymbol{z} ] + i \phi(x) \exp[ i \boldsymbol{k} \cdot \boldsymbol{z} \cos{\theta} ] \Big{]} \cdot \Big{[} \exp[ -i \boldsymbol{k} \cdot \boldsymbol{z} ] - i \phi(x) \exp[ -i \boldsymbol{k} \cdot \boldsymbol{z} \cos{\theta} ] \Big{]} \\
        &= 1 + i \phi ( \exp[i \boldsymbol{k} \cdot \boldsymbol{z} (\cos{\theta} - 1)] - \exp[-i \boldsymbol{k} \cdot \boldsymbol{z} (\cos{\theta} - 1)] ) \\
        \color{blue}{[ e^{ia} - e^{-ia} = 2 i \sin{a}]} &= 1 - 2 \phi \sin(  \boldsymbol{k} \cdot \boldsymbol{z} ( \cos{\theta} - 1 )  )\\
        \color{blue}{[ \cos{a} - 1 \approx -2 \sin^2{\frac{a}{2}} \approx - \frac{1}{2} a^2 ]} &=  1 + 2 \phi \sin(\boldsymbol{k} \cdot \boldsymbol{z} \theta^2 / 2) \\
        \color{blue}{[ k = \frac{2\pi}{\lambda} ]}&= 1 + 2 \phi \sin( \frac{\pi \boldsymbol{z} \lambda}{d^2} ) \\
\end{align*}
$$
So the CTF is defined as the scaling of the intensity change relative to the original phase shift in the specimen,
$$
\begin{align*}
        |\Psi|^2 &= const + 2 \phi(x) CTF \\
        CTF &=  \sin(\frac{\pi \boldsymbol{z} \lambda}{d^2}) \\
\end{align*}
$$
In practice the specimen is usually underfocused, thus the conjugated focus plane is above the specimen and the value of $\boldsymbol{z}$ is negative. So the phase contrast shares the same polarity of the "amplitude contrast" due to the loss of high angels scattered electrons. So CTF has another form,
$$
CTF = \sin(- \pi \lambda \delta f^2)
$$
where $\delta$ is the defocused value and $f = \frac{1}{d}$ is the spatial frequency of the specimen.

## CTF under high spatial frequency ##

Under high spatial frequency, the CTF is mainly influenced by two factors: spherical aberration & envelope function.

### Spherical aberration 

In glass lenses the light is bent more strongly at the periphery than it should. In magnetic lenses the effect is approximated by the same spherical aberration coefficient $C_s$,
$$
CTF = \sin(- \pi \delta \lambda f^2 + \frac{\pi C_{s} \lambda^3 f^4}{2})
$$
### Envelope function ###

Due to spatial and thermal incoherence, the image will be blurred at high spatial frequency and the CTF has a Gaussian decay with the increasing spatial frequency. So it can be written by including the Envelope function,
$$
CTF = CTF_0 \cdot \exp[ - B f^2 / 4 ]
$$
where $B$ is called *B-factor*.

## Point spread function ##

When the electron wave is scattered by the specimen, the higher the spatial frequency of the specimen is, the larger the scattered angel is,
$$
\theta = \lambda / d = \lambda f
$$
So we can imagine that the waves scattered by specimen of high spatial frequency would meet the lens plane far away from the center of the lens. The lens plane is just a 2D Fourier space of the specimen. The intensity of different spatial frequency on the 2D Fourier space should obey the CTF, thus we have,
$$
\mathscr{F}[I] = \mathscr{F}[S] \cdot CTF
$$
where $I$ is the image and $S$ is the specimen. We also know the image is generated by the convolution of PSF and specimen,
$$
\begin{align*}
        I &=  S * PSF \\
        \color{blue}{[ \text{Fourier transfer} ]} \mathscr{F} [I] &=  \mathscr{F}[S] \cdot \mathscr{F}[PSF] \\
\end{align*}
$$
Thus the CTF is the Fourier transfer of the PSF. 

## References ##

[Phase-contrast imaging in the EM](https://nccat.nysbc.org/wp-content/uploads/2020/03/2-Phase-contrast.pdf)
