function rotate(number, string::String)
    join(map(char->rotate(number,char),collect(string)),"")
end

function rotate(number, char::Char)
    if isupper(char)
        Char('A' + Integer(char -'A' + number) % Integer('z' - 'a' + 1) )
    elseif islower(char)
        Char('a' + Integer(char -'a' + number) % Integer('z' - 'a' + 1) )
    else
        char
    end
end
