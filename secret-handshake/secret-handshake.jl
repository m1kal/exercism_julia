function secret_handshake(code::Integer)
    handshakes = ["wink","double blink","close your eyes","jump"];
    handshake=[];
    for bit=0:3
        if (code & (2^bit)) > 0
            push!(handshake,handshakes[bit+1]);
        end
    end
    if (code & 16) > 0
        reverse(handshake)
    else
        handshake
    end
end
