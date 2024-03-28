function [ak,dk] = chaineCom(K,g0,sigmab)


% Generation de bits uniformes (bloc K) :
bits = zeros(1,K);       

for k = 1:K
    bits(k) = rand;      % les éléments de bits ont une valeur comprise en 0 et 1.
    if bits(k) >= 0.5
        bits(k) = 1;     % Si la valeur est >= 0.5, on remplace cette valeur par 1.
    end
    if bits(k) < 0.5     % Sinon, on remplace cette valeur par 0.
        bits(k) = 0;
    end
end

% Modulation BPSK :

ak = zeros(1,K);       
for k = 1:K
    if bits(k) == 0      
        ak(k) = -1;     % Si la valeur est égale à 0, alors l'élément de ak vaut -1
    end
    if bits(k) == 1
        ak(k) = 1;      % Sinon, l'élément de ak vaut 1.
    end
end

% Gain :

akg = zeros(1,K);            
for k = 1:K
    akg(k) = ak(k)*g0;      % On ajoute le gain en multipliant les éléments de ak par g0.
end

% Ajout du bruit (blanc additif Gaussien (canal AWGN)) :

varb = sigmab*sigmab;        
moyb = 0;                    
bk = moyb + varb*randn(1,K);   
rk = akg + bk;                % On ajoute le bruit au signal

% Bloc Decision

dk = zeros(1,K);

for k = 1:K
    if rk(k) >= 0
        dk(k) = 1;       % Si l'element k de r est positif, on le remplace par 1.
    end
    
    if rk(k) < 0
        dk(k) = -1;      % Sinon, on le remplace par 0.
    end
end


