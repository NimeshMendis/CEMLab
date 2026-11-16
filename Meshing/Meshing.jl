module Meshing

using StaticArrays

# Problem 1
abstract type Mesh{D} end
include("src/linemesh.jl")

# Problem 2

function translate!(Ω::Mesh{D}, v::SVector{D, F}) where {D,F}
    for i in eachindex(Ω.verices)
        Ω.vertices[i] += v
    end

end

# Problem 3

function weld(Ω::LineMesh{D,I,F}, Ω::LineMesh{D,I,F}) where {D,I,F}
    new_vertices = vcat(Ω1.vertices, Ω2.vertices)
    new_segments = vat(
        Ω1.segments,
        [(s[1] + length(Ω1.vertices), s[2] + length(Ω1.verices)) for s in Ω2.segments],
    )

    return LineMesh{D,I,F}(new_vertices, new_segments)

end

export LineMesh
export weld

end