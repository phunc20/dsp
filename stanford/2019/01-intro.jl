### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 8ffa93f8-7e46-11eb-24dd-d3a098d446db
run(`pwd`)

# ╔═╡ 771d9d7c-7e45-11eb-333b-89c14c371bb1
begin
  import Pkg
  Pkg.activate(mktempdir())
  Pkg.add([
	  #"AudioDisplay",
	  #"AudioIO",
      "PyPlot",
  ])
end

# ╔═╡ 3890caac-7e40-11eb-1abf-cb2d856fde8b
md"""
$x[n] = A \cos(\omega n T + \phi) = A \cos(2\pi f n T + \phi)$

- ``A``: amplitude
- ``\omega``: angular frequency (`radians/sec`)
- ``f = \omega / 2\pi``: frequency in Hertz (`cycles/sec`)
- ``\phi``: initial phase (`radians`)
- ``n``: time index
- ``t = nT = n / f_s``, where $f_s$ is the sampling frequency
"""

# ╔═╡ 0d70902e-7e44-11eb-353e-a9a2b3249ede
begin
  A = .8
  f = 1000    # i.e. 1000 cycles/sec
  ϕ = pi/2
  fs = 44100  # i.e. 44100 samples/sec
  t = range(-.002, .002, step=1/fs)
  x = A .* cos.(2π*f.*t .+ ϕ)
  size(x)
end

# ╔═╡ 4a3f2772-7e44-11eb-22ed-a1fe51593505
t, size(t)

# ╔═╡ e439ba0e-7e44-11eb-3650-b974bc440e07
size(@. A * cos(2π*f*t + ϕ))

# ╔═╡ Cell order:
# ╠═8ffa93f8-7e46-11eb-24dd-d3a098d446db
# ╠═771d9d7c-7e45-11eb-333b-89c14c371bb1
# ╟─3890caac-7e40-11eb-1abf-cb2d856fde8b
# ╠═0d70902e-7e44-11eb-353e-a9a2b3249ede
# ╠═4a3f2772-7e44-11eb-22ed-a1fe51593505
# ╠═e439ba0e-7e44-11eb-3650-b974bc440e07
