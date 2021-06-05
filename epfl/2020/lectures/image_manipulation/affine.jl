### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ 6a2c9516-dbda-4005-8d85-c19b5c0f54ee
begin
  using Pkg
  Pkg.activate(Base.Filesystem.homedir() * "/.config/julia/projects/oft")
  using Plots
  using LinearAlgebra
end

# ╔═╡ 4cdf2cb0-568c-47f6-bb13-a4a693e042f6
md"""
## Affine Transformations
An _affine transformation_ is a _linear transformation_ plus _a displacment_.
```math
\begin{array}
  &\mathbb{R}^2 &\to &\mathbb{R}^2& \\
  \begin{bmatrix}
    t_{1}' \\
    t_{2}'
  \end{bmatrix}
  &\mapsto
  &A
  \begin{bmatrix}
    t_{1} \\
    t_{2}
\end{bmatrix}
  + b&
  = 
  \begin{bmatrix}
    a_{1,1} & a_{1,2} \\
    a_{2,1} & a_{2,2} \\
  \end{bmatrix}
  \begin{bmatrix}
    t_{1} \\
    t_{2}
  \end{bmatrix}
  +
  \begin{bmatrix}
    b_{1} \\
    b_{2}
  \end{bmatrix}
\end{array}
```
"""

# ╔═╡ f4611f9f-7f42-4164-8135-0fdcbf8f7ca0
begin
  chapeau_xy = [-1 -1 7 4 7 -1
                -5  5 5 3 1  1]
  function draw_flag(A, b, linecolor; new=false)
    if new
      plot()
    end
    xmax = 15
    ymax = xmax
    # chapeau_xy = [-1 -1 7 4 7 -1
    #               -5  5 5 3 1  1]
    transformed = A*chapeau_xy .+ b
    plot!(transformed[1, 1:end],
          transformed[2, 1:end],
          lw=3,
          framestyle=:zerolines,
          aspect_ratio=:equal,
          linecolor=linecolor,
          legend=false,
          xlims=[-xmax, xmax],
          ylims=[-ymax, ymax],
    )
  end
end

# ╔═╡ 5c95082e-75e5-466d-89e5-11b501add71d
md"""
### Translation
"""

# ╔═╡ 6aa15192-3ec7-417f-9847-97248d7b3ca5
begin
  draw_flag(I(2), [0 0]', :grey; new=true)
  draw_flag(I(2), [4 3]', :red)
end

# ╔═╡ 434c9a7f-14f1-488e-9580-78b4f250e126
begin
  draw_flag(I(2), [1 2]', :grey; new=true)
  draw_flag(I(2), [-3 4]', :red)
end

# ╔═╡ b7e57e32-d5f1-40ba-b833-01e131ca0e64
md"""
### Scaling
"""

# ╔═╡ cfc871af-0ab3-4f7c-8f3d-a1421a32f3f5
begin
  draw_flag(I(2), [0 0]', :grey; new=true)
  draw_flag(2*I(2), [0 0]', :red)
end

# ╔═╡ bd68e9bc-bff8-4820-9e8a-cbcfeee76371
begin
  draw_flag(I(2), [0 0]', :grey; new=true)
  draw_flag((1/3)*I(2), [0 0]', :red)
end

# ╔═╡ 8ca625d1-a595-4b00-8b0c-810c04d5927e
let  # We use let here because we shall repeatedly use the matrix A
  A = [2 0
       0 1/2]
  draw_flag(I(2), [0 0]', :grey; new=true)
  draw_flag(A, [0 0]', :red)
end

# ╔═╡ b34d9ee0-13ea-4b5b-846e-69785abadec2
md"""
### Rotation
"""

# ╔═╡ 6154092f-a161-45a4-8b86-5c3e436c1442
let
  θ = 2π / 3
  A = [cos(θ) -sin(θ)
       sin(θ)  cos(θ)]
  draw_flag(I(2), [0 0]', :grey; new=true)
  draw_flag(A, [0 0]', :red)
end

# ╔═╡ c48341a5-4434-4816-a026-638e59d1344c
let
  θ = -π / 6
  A = [cos(θ) -sin(θ)
       sin(θ)  cos(θ)]
  draw_flag(I(2), [0 0]', :grey; new=true)
  draw_flag(A, [0 0]', :red)
end

# ╔═╡ 2cc2fab1-ca14-4940-9050-e8f7d145a646
md"""
### Flips
"""

# ╔═╡ d9fe42fd-587f-4a1e-bd93-6553208109fe
let
  # horizontal flip
  A = [-1 0
        0 1]
  draw_flag(I(2), [0 0]', :grey; new=true)
  draw_flag(A, [0 0]', :red)
end

# ╔═╡ 99f2817e-f951-4123-9347-79c071329748
let
  # vertical flip
  A = [1  0
       0 -1]
  draw_flag(I(2), [0 0]', :grey; new=true)
  draw_flag(A, [0 0]', :red)
end

# ╔═╡ 516ebe04-e164-424b-832d-c9a91583788c
md"""
### Shearing
"""

# ╔═╡ ae6c8a6b-0ab5-4a0b-b058-2f5e3fecb0af
let
  s = 1.5
  A = [1 s
       0 1]
  draw_flag(I(2), [0 0]', :grey; new=true)
  draw_flag(A, [0 0]', :red)
end

# ╔═╡ fb1068ee-597a-44d5-be66-db42be7d7fb5
let
  s = 1.5
  A = [1 0
       s 1]
  draw_flag(I(2), [0 0]', :grey; new=true)
  draw_flag(A, [0 0]', :red)
end

# ╔═╡ a38ed456-87e3-4572-be89-e4f34d4196f9
let
  s = 1.5
  A = [1 -s
       0 1]
  draw_flag(I(2), [0 0]', :grey; new=true)
  draw_flag(A, [0 0]', :red)
end

# ╔═╡ Cell order:
# ╠═6a2c9516-dbda-4005-8d85-c19b5c0f54ee
# ╟─4cdf2cb0-568c-47f6-bb13-a4a693e042f6
# ╠═f4611f9f-7f42-4164-8135-0fdcbf8f7ca0
# ╟─5c95082e-75e5-466d-89e5-11b501add71d
# ╠═6aa15192-3ec7-417f-9847-97248d7b3ca5
# ╠═434c9a7f-14f1-488e-9580-78b4f250e126
# ╟─b7e57e32-d5f1-40ba-b833-01e131ca0e64
# ╠═cfc871af-0ab3-4f7c-8f3d-a1421a32f3f5
# ╠═bd68e9bc-bff8-4820-9e8a-cbcfeee76371
# ╠═8ca625d1-a595-4b00-8b0c-810c04d5927e
# ╟─b34d9ee0-13ea-4b5b-846e-69785abadec2
# ╠═6154092f-a161-45a4-8b86-5c3e436c1442
# ╠═c48341a5-4434-4816-a026-638e59d1344c
# ╟─2cc2fab1-ca14-4940-9050-e8f7d145a646
# ╠═d9fe42fd-587f-4a1e-bd93-6553208109fe
# ╠═99f2817e-f951-4123-9347-79c071329748
# ╟─516ebe04-e164-424b-832d-c9a91583788c
# ╠═ae6c8a6b-0ab5-4a0b-b058-2f5e3fecb0af
# ╠═fb1068ee-597a-44d5-be66-db42be7d7fb5
# ╠═a38ed456-87e3-4572-be89-e4f34d4196f9
