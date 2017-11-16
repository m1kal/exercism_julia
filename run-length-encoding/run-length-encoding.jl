function encode(s)
    chars = split(s,"");
    push!(chars,"0");
    output = "";
    n=1;
    while length(chars) > 1
        current = shift!(chars);
        if current == chars[1]
            n+= 1;
        else
            if (n == 1)
                n = ""
            end
            output = string(output,n,current);
            n = 1;
        end
    end
    output
end

function decode(s)
    output = ""
    for match=eachmatch(r"(\d*)?(\D)",s)
        if length(match[1]) > 0
            output = string(output,match[2]^parse(match[1]))
        else
            output = string(output,match[2])
        end
    end
    output
end
