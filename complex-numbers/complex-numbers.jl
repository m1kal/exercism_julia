import Base: +,-,*,/,==,exp,convert,promote_rule,isapprox

struct ComplexNumber <: Number
    real
    imag
end

function ==(a::ComplexNumber, b::ComplexNumber)
    a.real==b.real && a.imag==b.imag
end

function isapprox(a::ComplexNumber, b::ComplexNumber)
  abs(a-b) < eps()
end

real=(a::ComplexNumber)->a.real
imag=(a::ComplexNumber)->a.imag

function +(a::ComplexNumber, b::ComplexNumber)
    ComplexNumber(a.real+b.real,a.imag+b.imag)
end

function -(a::ComplexNumber, b::ComplexNumber)
    ComplexNumber(a.real-b.real,a.imag-b.imag)
end

function *(a::ComplexNumber, b::ComplexNumber)
    ComplexNumber(
        a.real*b.real-a.imag*b.imag,
        a.real*b.imag+a.imag*b.real
    )
end

function /(a::ComplexNumber, b::ComplexNumber)
    a*conj(b)*(1/abs(b)/abs(b))
end

function conj(a::ComplexNumber)
    ComplexNumber(a.real, -a.imag)
end

function abs(a::ComplexNumber)
    sqrt(real(a*conj(a)))
end

function exp(a::ComplexNumber)
    exp(a.real)*ComplexNumber(cos(a.imag),sin(a.imag))
end

jm=ComplexNumber(0,1)

convert(::Type{ComplexNumber},y::Real) = ComplexNumber(y,0)
promote_rule(::Type{ComplexNumber},::Type{T}) where T<:Real = ComplexNumber
