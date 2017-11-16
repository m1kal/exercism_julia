function ispangram(input::AbstractString)
  pangram = true
  for letter='a':'z'
   pangram = pangram && contains(lowercase(input),string(letter))
  end
  pangram
end
