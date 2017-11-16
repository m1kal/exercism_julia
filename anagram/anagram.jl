function detect_anagrams(subject::AbstractString, candidates::AbstractArray)
    function chars(input)
        sort(split(lowercase(input),""))
    end
    function same_as_subject(candidate)
        lowercase(subject) == lowercase(candidate)
    end
    function anagram(candidate)
      chars(subject)==chars(candidate) && !same_as_subject(candidate)
    end
    filter(anagram,candidates)
end
