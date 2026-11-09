include("./../../NumericalIntegration/NumericalIntegration.jl")

using .NumericalIntegration

##

# Problem 2
f(x) = x^2
a = 0.0
b = 1.0
F_analytic = 1 / 3

intrule_midpoint = Midpoint()
F_midpoint = intrule_midpoint(f, a, b)
relerror_midpoint = abs(F_midpoint - F_analytic) / abs(F_analytic)
println("Midpoint Rule: F = $F_midpoint, Error = $relerror_midpoint")

##

# Problem 4
for n in [1, 2, 4, 8]
    intrule_compmidpoint = CompositeNewtonCotes(n, Midpoint())
    F_compmidpoint = intrule_compmidpoint(f, a, b)
    relerror_compmidpoint = abs(F_compmidpoint - F_analytic) / abs(F_analytic)
    println(
        "Composite Midpoint Rule ($n subintervals): F = $F_compmidpoint, Error = $relerror_compmidpoint",
    )
end

##
# Problem 9

f(x) = x^2 * cos(10 *x^2)
F_analytic = -0.03925821571649867


for n in 2:4
    intrule_guasslegendre = GaussLegendre(order=n)
    F_gausslegendre = intrule_guasslegendre(f, a, b)
    relerror_gausslegendre = abs(F_gausslegendre - F_analytic) / abs(F_analytic)
    println(
        "Guass Legendre Quadrature (order $n): F = $F_gausslegendre, Error = $relerror_gausslegendre",
    )
end