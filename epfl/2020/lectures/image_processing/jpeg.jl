### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ 624310f3-37b1-49aa-9089-ad860f4690a8
begin
  using Pkg
  Pkg.activate(Base.Filesystem.homedir() * "/.config/julia/projects/oft")
end

# ╔═╡ 6a5292a2-c3ad-11eb-125a-3f1bbc0b7a2c
using Images#, FileIO

# ╔═╡ 4c03a12c-4128-4da6-a6e1-ef91afa02614
begin
  path_image = "./dog04.jpeg"
  image = load(path_image)
end

# ╔═╡ 541f8b1f-2773-442f-8104-9b430afef1b0
size(image)

# ╔═╡ e2eddba9-3c11-43f6-bfd8-722c66bfbf9d
image[1,1]

# ╔═╡ afbeff8b-f0f1-4ed2-a09e-3848db5c47fb
typeof(image)

# ╔═╡ 8e60dfbc-9a80-41e9-9091-67910940aeec
RGB(1,0,0)

# ╔═╡ 0e5ddc64-3943-45d5-ac8d-e00e7e10c1cf
typeof(RGB(1,0,0))

# ╔═╡ 0323a47c-3dcc-4162-b82b-d0504a7b029d
typeof(1)

# ╔═╡ 5446ce8a-5143-4209-a5ea-bd2b5bd20e1a
typeof(image[1,1])

# ╔═╡ 39595f13-7a31-401d-bc56-5a1106f567bc
n0f8(1)

# ╔═╡ 094184ad-325a-4b17-8e7a-89a29b5df473
image[1,1].r

# ╔═╡ a0b12e5b-31e8-4af9-9abb-6e676d13a4cf
n0f8(image[1,1].r)

# ╔═╡ f14e73f2-8d78-4d13-b7fd-3f7c2a729ebb
typeof(RGB(n0f8(0.5), 0, 0))

# ╔═╡ 9a793cd5-d7f2-496d-9a8e-2ec58716ec41
typeof(n0f8(0.5))

# ╔═╡ 948ceeda-6c71-41f7-a653-9ce961b586fd
typeof(RGB(n0f8(0.5), n0f8(0), n0f8(0)))

# ╔═╡ 8de562f7-b519-40a6-a46b-250fd0c365d3
function redify(color)
	RGB(color.r, 0, 0)
end

# ╔═╡ 2d24ddbe-58d1-4eb2-b176-08ac0842e083
R = redify.(image)

# ╔═╡ cf617485-1af4-4d0d-a9ef-1c3f986d413a
md"""
**(?)** Why the data type inside `RGB` is no more `N0f8` but `Float32`?
"""

# ╔═╡ 0fbffd3c-e548-4344-b9fd-013911219a27
typeof(redify.(image))

# ╔═╡ 2f6c7c75-0f53-42b1-8bcd-93fa489bf14b
G = (color -> RGB(0, color.g, 0)).(image)

# ╔═╡ 30050264-358d-46f6-b36e-ffc868034d06
typeof(G)

# ╔═╡ f9bbf516-c618-4ac8-a416-9716997d4358
B = (color -> RGB(0, 0, color.b)).(image)

# ╔═╡ c4d7b9a5-9aaf-4350-bd31-61fe1d999916
md"""
$(R+G+B) ``=`` $R ``\huge \bf +`` $G ``+`` $B
"""

# ╔═╡ 2b5f1501-430c-4ce3-bf89-827e906cc36e
begin
  step = 20
  md"""
$((R+G+B)[1:step:end, 1:step:end]) ``=`` $(R[1:step:end, 1:step:end]) ``+`` $(G[1:step:end, 1:step:end]) ``+`` $(B[1:step:end, 1:step:end])
  """
end

# ╔═╡ Cell order:
# ╠═624310f3-37b1-49aa-9089-ad860f4690a8
# ╠═6a5292a2-c3ad-11eb-125a-3f1bbc0b7a2c
# ╠═4c03a12c-4128-4da6-a6e1-ef91afa02614
# ╠═541f8b1f-2773-442f-8104-9b430afef1b0
# ╠═e2eddba9-3c11-43f6-bfd8-722c66bfbf9d
# ╠═afbeff8b-f0f1-4ed2-a09e-3848db5c47fb
# ╠═8e60dfbc-9a80-41e9-9091-67910940aeec
# ╠═0e5ddc64-3943-45d5-ac8d-e00e7e10c1cf
# ╠═0323a47c-3dcc-4162-b82b-d0504a7b029d
# ╠═5446ce8a-5143-4209-a5ea-bd2b5bd20e1a
# ╠═39595f13-7a31-401d-bc56-5a1106f567bc
# ╠═094184ad-325a-4b17-8e7a-89a29b5df473
# ╠═a0b12e5b-31e8-4af9-9abb-6e676d13a4cf
# ╠═f14e73f2-8d78-4d13-b7fd-3f7c2a729ebb
# ╠═9a793cd5-d7f2-496d-9a8e-2ec58716ec41
# ╠═948ceeda-6c71-41f7-a653-9ce961b586fd
# ╠═8de562f7-b519-40a6-a46b-250fd0c365d3
# ╠═2d24ddbe-58d1-4eb2-b176-08ac0842e083
# ╟─cf617485-1af4-4d0d-a9ef-1c3f986d413a
# ╠═0fbffd3c-e548-4344-b9fd-013911219a27
# ╠═2f6c7c75-0f53-42b1-8bcd-93fa489bf14b
# ╠═30050264-358d-46f6-b36e-ffc868034d06
# ╠═f9bbf516-c618-4ac8-a416-9716997d4358
# ╠═c4d7b9a5-9aaf-4350-bd31-61fe1d999916
# ╠═2b5f1501-430c-4ce3-bf89-827e906cc36e
