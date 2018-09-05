function score(str::AbstractString)
    sum(map(points,split(lowercase(str),"")))
end

function points(char)
    scores = [["aeioulnrst",1],
              ["dg",2],
              ["bcmp",3],
              ["fhvwy",4],
              ["k",5],
              ["jx",8],
              ["qz",10]];
    for idx = 1:length(scores)
        if contains(scores[idx][1], char) && length(char) > 0
            return scores[idx][2];
        end
    end
    0
end
