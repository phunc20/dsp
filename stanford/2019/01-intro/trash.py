"""
$$
  x[n] = A \cos(\omega n T + \phi) = A \cos(2\pi f n T + \phi)
$$
- $A$: amplitude
- $\omega$: angular frequency (`radians/sec`)
- $f = \omega / 2\pi$: frequency in Hertz (`cycles/sec`)
- $\phi$: initial phase (`radians`)
- $n$: time index
- $t = nT = n / f_s$, where $f_s$ is the sampling frequency

"""

A = .8
f = 1000    # i.e. 1000 cycles/sec
phi = pi/2
fs = 44100  # i.e. 44100 samples/sec
t = range(-.002, .002)



