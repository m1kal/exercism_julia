function bob(stimulus::AbstractString)
  if !ismatch(r"[a-z]",stimulus) && ismatch(r"[A-Z]",stimulus)
    "Whoa, chill out!"
  elseif ismatch(r"\?\s*$",stimulus)
    "Sure."
  elseif ismatch(r"^\s*$",stimulus)
    "Fine. Be that way!"
  else
    "Whatever."
  end
end
