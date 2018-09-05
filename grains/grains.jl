"""Calculate the number of grains on square `square`."""
function on_square(square)
  0 < square < 65 ||  throw(DomainError())
  2^(square - 1)
end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
  0 < square < 65 || throw(DomainError())
  2^square - 1
end
