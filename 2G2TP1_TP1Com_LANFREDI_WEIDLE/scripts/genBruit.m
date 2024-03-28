function bn = genBruit(N,sigma_carre_b)
    noise = round(randn(1, N));
    bn = noise*sigma_carre_b;
end