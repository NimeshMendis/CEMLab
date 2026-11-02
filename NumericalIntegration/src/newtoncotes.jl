abstract type NewtonCotesRule end

#midpoint is a data type - a subtype 
struct Midpoint <: NewtonCotesRule end

function (::Midpoint)(f::Function, a::T, b::T) where {T}
    return (b-a) * f(((a+b)/2))
end


#Problem 3

struct CompositeNewtonCotes <: IntegrationRule
    nsubintervals::Int
    rule::NewtonCotesRule
end

function (intrule::CompositeNewtonCotes)(f::Function, a::T, b::T) where {T}
    h = (b-a)/ intrule.nsubintervals
    F = 0.0
    for i in 0::(intrule.nsubintervals -1)
        F += intrule.rule(f, a + i *h, a + (i +1) *h)
    end
end