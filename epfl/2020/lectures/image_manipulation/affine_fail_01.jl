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

# ╔═╡ a7ce1316-bac0-47cc-9829-c8d3062d3169
# begin
#   flag_x = [-1, -1, 7, 4, 7, -1]
#   flag_y = [-5, 5, 5, 3, 1, 1]
#   flag = plot(flag_x,
# 		      flag_y,
# 		      lw=3,
# 		      framestyle=:zerolines,
# 	          aspect_ratio=:equal,
# 		      linecolor=:red,
# 		      legend=false,
# 	)
# end

# ╔═╡ 019427cd-dee6-4d81-9e0e-ba86657d2d12
begin
  #flag_x = [-2, -2, 5, 3, 5, -2]
  #flag_y = [-5, 5, 5, 3, 1, 1]
  flag_xy = transpose([-2 -2 5 3 5 -2
                       -5  5 5 3 1  1])
  flag = plot(flag_xy[1:end, 1],
              flag_xy[1:end, 2],
              lw=3,
              framestyle=:zerolines,
              aspect_ratio=:equal,
              linecolor=:red,
              legend=false,
              xlims=[-10,10],
              ylims=[-10,10],
  )
end

# ╔═╡ c293aa81-9192-4cc2-8221-55077399f475
#displacement = [2 2]
displacement = [[4] [3]]

# ╔═╡ 6819c041-ad77-4ede-bf8e-32d67b589fa8
flag

# ╔═╡ ecf18f1d-7f6e-486e-b434-529787f5ef3f
begin
  ## No use.
  #flag

  plot!(flag_xy[1:end, 1],
       flag_xy[1:end, 2],
              lw=3,
              framestyle=:zerolines,
              aspect_ratio=:equal,
              linecolor=:gray,
              legend=false,
              xlims=[-10,10],
              ylims=[-10,10],
  )
  flag_displaced = plot!((flag_xy .+ displacement)[1:end, 1],
                        (flag_xy .+ displacement)[1:end, 2],
                        lw=3,
                        framestyle=:zerolines,
                        aspect_ratio=:equal,
                        linecolor=:red,
                        legend=false,
                        xlims=[-10, 10],
                        ylims=[-10, 10],
  )
end

# ╔═╡ f4611f9f-7f42-4164-8135-0fdcbf8f7ca0
begin
  #chapeau_xy = [-1 -1 7 4 7 -1
  #              -5  5 5 3 1  1]
  function draw_flag(A, b, linecolor)
    #plot()
    xmax = 15
    ymax = xmax
    chapeau_xy = [-1 -1 7 4 7 -1
                  -5  5 5 3 1  1]
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

# ╔═╡ 9c16f909-cfa8-4230-ae2c-65a599f7265d
I(3)

# ╔═╡ 58e1a38d-e958-43ff-b5f1-1a80dbe9b840
I(2) * [-1 -1 7 4 7 -1
 -5  5 5 3 1  1]

# ╔═╡ cf03b357-bd2a-4f41-a7b0-aa31628b1df6
[-1 -1 7 4 7 -1
 -5  5 5 3 1  1] .+ [4 5]'

# ╔═╡ 6554aaa3-50df-4847-b568-75a2ff5852dc
typeof([4; 5])

# ╔═╡ 5281457f-b58c-464b-97a6-efc50de31443
typeof([4, 5])

# ╔═╡ ca8edc5c-f713-4584-99f9-3fd843d31b95
typeof([4 5])

# ╔═╡ 7145ab5c-3aff-4767-9fa6-46de9f46e29d
[4 5]

# ╔═╡ adbf610d-7cb5-49c6-92b3-ca1ee519e51a
[4 5]'

# ╔═╡ 6aa15192-3ec7-417f-9847-97248d7b3ca5
draw_flag(I(2), [4 3]', :red)

# ╔═╡ a8f0d2e2-59fa-46af-bafe-5b67b799a1f6
I(2) * [-1 -1 7 4 7 -1
        -5  5 5 3 1  1] .+ [3 4]'

# ╔═╡ Cell order:
# ╠═6a2c9516-dbda-4005-8d85-c19b5c0f54ee
# ╟─4cdf2cb0-568c-47f6-bb13-a4a693e042f6
# ╠═a7ce1316-bac0-47cc-9829-c8d3062d3169
# ╠═019427cd-dee6-4d81-9e0e-ba86657d2d12
# ╠═c293aa81-9192-4cc2-8221-55077399f475
# ╠═6819c041-ad77-4ede-bf8e-32d67b589fa8
# ╠═ecf18f1d-7f6e-486e-b434-529787f5ef3f
# ╠═f4611f9f-7f42-4164-8135-0fdcbf8f7ca0
# ╠═9c16f909-cfa8-4230-ae2c-65a599f7265d
# ╠═58e1a38d-e958-43ff-b5f1-1a80dbe9b840
# ╠═cf03b357-bd2a-4f41-a7b0-aa31628b1df6
# ╠═6554aaa3-50df-4847-b568-75a2ff5852dc
# ╠═5281457f-b58c-464b-97a6-efc50de31443
# ╠═ca8edc5c-f713-4584-99f9-3fd843d31b95
# ╠═7145ab5c-3aff-4767-9fa6-46de9f46e29d
# ╠═adbf610d-7cb5-49c6-92b3-ca1ee519e51a
# ╠═6aa15192-3ec7-417f-9847-97248d7b3ca5
# ╠═a8f0d2e2-59fa-46af-bafe-5b67b799a1f6
