## Timeline ##

## Lectures ##

### 2002_scan_speed ###

Limitations to scanning speed:

1. slow transient response of probe
2. instability limitations of high-quality factor (Q) systems
3. feedback actuator bandwidth
4. error signal saturation
5. rms-to-dc converter

squeeze film damping

## Questions ##

1. active control of effective quality factor Q of the cantilever / why should the cantilever be damped?
2. when the cantilever sacns a downward step, the amplitude would increase as a function of time,
$$
\Delta a(t) = [a_{free} - a_{sp}][ 1 - \exp(-\omega_0 t / 2Q) ]
$$

3. For stable feedback, the gain of the loop should be small for the frequencies where the drive from the controller and the response of the actuator are out of phase

4. At $\omega_0$, there is a $90^\circ$ phase shift from the cantilever and the controller adds an additional $90^\circ$ phase shift (it is dominated by an integrator)
