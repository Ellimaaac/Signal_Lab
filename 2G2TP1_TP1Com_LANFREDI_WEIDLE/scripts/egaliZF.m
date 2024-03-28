function tn = egaliZF(rn)
    g = [0.5, 0.2]; % Coefficients de G(z)
    tn = filter(1/g(1), g, rn); %  FZF(z) = G(z)^(-1)
end