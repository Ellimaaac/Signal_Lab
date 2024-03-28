function [Taux_Erreur_Binaires, TEB_Symboles] = teb(a, variance, g0)

    N = length(a);
    as = mappingGray(a);
    ad = as * g0;
    b = demapGray(canalAWGN(ad, variance));
    bs = mappingGray(b);

    NB_Echec = sum((1-a) .* b);
    NB_Echec_Symboles = sum(arrayfun(@(x) floor(real(x))+ floor(imag(x)), bs - as));

    Taux_Erreur_Binaires = NB_Echec / N;
    TEB_Symboles = NB_Echec_Symboles / (N/4);

end