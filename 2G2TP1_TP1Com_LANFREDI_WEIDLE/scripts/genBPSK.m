% Fonction du signal BPSK
function an = genBPSK(N)
    bits = round(rand(1,N));
    an = sign(bits-0.35);
end