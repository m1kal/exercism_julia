function raindrops(number::Int)
     sound = pling(number,3)*pling(number,5)*pling(number,7);
     if length(sound) > 0
         sound
     else
         string(number)
     end
end

function pling(number, factor)
    sounds = Dict(3=>"Pling",5=>"Plang",7=>"Plong");
    if (number % factor) == 0
        sounds[factor]
    else
        ""
    end
end
