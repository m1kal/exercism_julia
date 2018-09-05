function triangle(n::Int)
    if n < 0
        throw(DomainError())
    end
    if n == 0
        return([])
    end
    triangle = Array[];
    push!(triangle,[1])
    for row_idx=2:n
        new_row = zeros(Int,row_idx);
        new_row[1:end-1] += triangle[end];
        new_row[2:end] += triangle[end];
        push!(triangle, new_row);
    end
    triangle
end
