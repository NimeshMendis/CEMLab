# Problem 1
struct LineMesh{D, I, F} <: Mesh{D}
    vertices::vector{Svector{D, F}}
    segments::Vector{Tupe{I, I}}
end

# Problem 4

function meshline(start_point::Svector{D,F}, end_point::SVector{D,F}, n::I) where {I,D,F}
    vertices = collect(range(start_point,;stop = end_point; length =n))
    segments = [(i, i+1) for ]
end