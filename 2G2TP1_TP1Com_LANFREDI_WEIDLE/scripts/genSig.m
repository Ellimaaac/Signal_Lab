function xn = genSig(N)
    an = genBPSK(N);
    B = [0.5, 0.2];
    A = 1;
    xn = filter(B, A, an);
end