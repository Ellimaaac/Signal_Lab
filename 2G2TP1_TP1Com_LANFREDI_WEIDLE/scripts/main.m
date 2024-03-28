% Thème 1 : Communication en bande de base BPSK
% Camille LANFREDI
% Rémi WEIDLE

%% Initialisation du programme

clear all; close all; clc; format short g;
%pkg load control;
%pkg load signal;

% Partie 1 : Chaîne de communication BPSK

N = 512; % nb_échantillons
sigma_carre_b = 0.5;
g0=1;
vect_N = 1:N;

% Génération du signal modulé BPSK
an = genBPSK(N); 

% Génération du bruit
bn = genBruit(N,sigma_carre_b); %

rn=g0*an+bn;
an2=decodeBPSK(rn); % BPSK du signal bruité

Nerreur=sum(abs(an-an2))/2; % Nombre d'erreur entre an et an2

% Décodage du signal reçu
cn = decodeBPSK((an+bn));

% Taux d'erreur à la reception
erreur = 0;
for i = 1:1:length(an)
    if an(i) == cn(i)
        erreur = erreur+1;
    end
end
taux_erreur = (N-erreur)/N;


% Calcul de la variance du bruit

EbNodB = 0:12;
%EbN0=10.^(EbN0dB/10);
variance = 0.5*10.^-(EbNodB/10);

%Taux d’erreur binaire du canal AWGN

% Calcul de l'erreur
for i = 1:1:13
    bn = genBruit(N, variance(i));
    an_est = decodeBPSK((an+bn));
    erreur = 0;
    for j = 1:1:length(an)
        if an(j) == an_est(j)
            erreur = erreur+1;
        end
    end
    taux_erreur(i) = (N-erreur)/N;
end

% Calcul probabilité d'erreur binaire

Peb = 0.5 * erfc(sqrt(EbNodB));




%%
%Partie 2 : IES

xn = genSig(N);
rn_real_ideal = xn;
rn_real = xn + bn;
an_real = decodeBPSK(rn_real);

an = dec;
% Utilisation des fonctions développées dans la partie 1 pour tracer le taux d'erreur binaire
EbNodB_values = 0:12;
taux_erreur_canal_non_ideal = zeros(size(EbNodB_values));

for i = 1:length(EbNodB_values)
    bn = genBruit(N, 0.5 * 10^-(EbNodB_values(i)/10));
    rn_real = xn + bn;
    an_real_est = decodeBPSK(rn_real);
    
    erreur = sum(abs(an_real - an_real_est)) / 2;
    taux_erreur_canal_non_ideal(i) = erreur / N;
end

% Tracer le taux d'erreur binaire avec égalisation zero forcing
taux_erreur_zero_forcing = zeros(size(EbNodB_values));

for i = 1:length(EbNodB_values)
    bn = genBruit(N, 0.5 * 10^-(EbNodB_values(i)/10));
    rn_real = xn + bn;
    tn_zero_forcing = egaliZF(rn_real);
    
    % Utilisez la fonction decodeBPSK pour estimer les symboles
    an_real_est_zf = decodeBPSK(tn_zero_forcing);
    
    % Calcul du taux d'erreur binaire avec égalisation zero forcing
    erreur_zf = sum(abs(an_real - an_real_est_zf)) / 2;
    taux_erreur_zero_forcing(i) = erreur_zf / N;
end




%%
Display;

%%

% Partie 1 : Chaîne de communication BPSK

N = 10000; % nb_échantillons
sigma_carre_b = 0.5;
g0 = 1;
vect_N = 1:N;

% Génération du signal modulé BPSK
an = genBPSK(N);

% Génération du bruit
bn = genBruit(N, sigma_carre_b);

rn = g0 * an + bn;
an2 = decodeBPSK(rn); % BPSK du signal bruité

Nerreur = sum(abs(an - an2)) / 2; % Nombre d'erreur entre an et an2

% Décodage du signal reçu
cn = decodeBPSK((an + bn));

% Taux d'erreur à la reception
erreur = sum(an ~= cn);
taux_erreur = erreur / N;

% Calcul de la variance du bruit
EbNodB = 0:12;
variance = 0.5 * 10.^-(EbNodB/10);

% Taux d’erreur binaire du canal AWGN
% Initialisation du vecteur des taux d'erreur
taux_erreur_simule = zeros(size(EbNodB));

% Calcul de l'erreur
for i = 1:1:13
    bn = genBruit(N, variance(i));
    an_est = decodeBPSK((an + bn));
    erreur = sum(an ~= an_est);
    taux_erreur_simule(i) = erreur / N;
end

% Calcul de la probabilité d'erreur binaire théorique
Peb_theorique = 0.5 * erfc(sqrt(10.^(EbNodB/10)));

% Affichage des résultats
figure;
semilogy(EbNodB, taux_erreur_simule, 'o-', 'LineWidth', 2, 'DisplayName', 'Simulé');
hold on;
semilogy(EbNodB, Peb_theorique, 'r-', 'LineWidth', 2, 'DisplayName', 'Théorique');
xlabel('Eb/N0 (dB)');
ylabel('Taux d''erreur binaire');
title('Taux d''erreur binaire pour BPSK avec bruit gaussien');
legend('Location', 'Best');
grid on;








