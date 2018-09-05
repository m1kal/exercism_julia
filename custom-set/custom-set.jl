import Base: isempty, in, ==, push!, copy, length, iterate

mutable struct CustomSet <: AbstractSet{Any}
    data
end

isempty(s::CustomSet) = isempty(s.data)

issubset(a::CustomSet, b::CustomSet) = all(value->(value in b.data),a.data)

in(value, s::CustomSet) = in(value,s.data)

function disjoint(a::CustomSet,b::CustomSet)
    isempty(a) || isempty(b) || !(any(value->(value in a),b.data))
end

==(a::CustomSet, b::CustomSet) = sort(a.data) == sort(b.data)

push!(s::CustomSet, value) = in(value,s) || push!(s.data,value)

function intersect(a::CustomSet, b::CustomSet)
    s=CustomSet([])
    for element in a.data
        element in b && push!(s,element)
    end
    s
end

function intersect!(a::CustomSet,b::CustomSet)
    a.data=intersect(a,b).data
end

function complement(a::CustomSet, b::CustomSet)
    s=CustomSet([])
    for element in a.data
        element in b || push!(s,element)
    end
    s
end

function complement!(a::CustomSet,b::CustomSet)
    a.data=complement(a,b).data
end

function union!(a::CustomSet,b::CustomSet)
    for element in b.data
        push!(a, element)
    end
end

function union(a::CustomSet,b::CustomSet)
    s = copy(a)
    union!(s, b)
    s
end

length(s::CustomSet) = length(s.data)

function iterate(s::CustomSet, state=1)
    state > length(s) ? nothing : (s.data[state], state + 1)
end

copy(s::CustomSet)=CustomSet(copy(s.data))

