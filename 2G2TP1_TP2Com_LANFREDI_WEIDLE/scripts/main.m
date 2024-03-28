% Thème 2 : Communication complexe équivalente en bande de base de la 16-QAM
% Camille LANFREDI
% Rémi WEIDLE

%% Initialisation du programme

% 1 - Constellation 16-QAM
% Question 1
% Matrice mComplex
M = 16;
N = 512 * 16;
g0 = 1;
variance = 0.5;


mComplex = zeros(sqrt(M));

for i = sqrt(M):-1:1
    for k = 1:sqrt(M)
        mComplex(k, i) = (-3 + 2*(i-1) + 1i*(3 - 2*(k-1)));
    end
end
mGray = Gray16QAM();

disp('mComplex:');
disp(mComplex);
Display(M, mComplex, mGray);

% Matrice QPSK
mComplex2 = zeros(2);

for i = 1:sqrt(4)
    for k = 1:sqrt(4)
        mComplex2(k, i) = (-1 + 2*(i-1) + 1i*(1 - 2*(k-1)));
    end
end
%plot(real(signal_Received), imag(signal_Received,"X"));
disp('mComplex2:');
disp(mComplex2);
%%
mGray2 = Gray16QAM();
% Matrice des codes de Gray pour QPSK
L = ["0" "1"];
az2 = zeros(2);

for c = 1:2
    for d = 1:2
        az2(c, d) = bin2dec(strcat(L(d), L(3-c)));
    end
end


disp('mGray2:');
disp(az2);

% Appel de la fonction Display pour QPSK
Display(4, mComplex2, mGray2);

%%








%%
mComplex = const16QAM();
mGray = Gray16QAM();
M = 16;

N = 512 * 64;
%pour figure2
% N= 512 *32 (ou16)
variance = 0.1;
g0=1;

[signalBits, signalReceivedBits, signalSymbols, signalReceived, signalSymbolsReceivedCor]= chaine16QAM(N, variance);
signalSymbols;
signalReceived;
x = real(mComplex(:));
y = imag(mComplex(:));
z = mGray(:);


%Figure Symboles
figure(1);
%constellation
scatter(x,y,50,'b*');
axis([-sqrt(M) sqrt(M) -sqrt(M) sqrt(M)]);

%code Gray
for k=1:M
    text(x(k)-0.6,y(k)+0.3,...
        dec2base(z(k),2,log2(M)),'Color',[1 0 0]);
end

%parametre
title('Codage Gray M-QAM');
xlabel('I');
ylabel('Q');
grid on;
hold on;

%Figure Symboles et signal reçu avec bruit
figure(2);
%constellation
scatter(x,y,50,'b*');
axis([-sqrt(M) sqrt(M) -sqrt(M) sqrt(M)]);

%code Gray
for k=1:M
    text(x(k)-0.6,y(k)+0.3,...
        dec2base(z(k),2,log2(M)),'Color',[1 0 0]);
end

%parametre
title('Codage Gray M-QAM, et signal buité');
xlabel('I');
ylabel('Q');
grid on;
hold on;

%signal recu buité
plot(real(signalReceived), imag(signalReceived),"X");


%Figure Symboles et signal reconstitué avec la fonction DemapGray
figure(3);
%constellation
scatter(x,y,50,'b*');
axis([-sqrt(M) sqrt(M) -sqrt(M) sqrt(M)]);

%code Gray
for k=1:M
    text(x(k)-0.6,y(k)+0.3,...
        dec2base(z(k),2,log2(M)),'Color',[1 0 0]);
end

%parametre
title('Codage Gray M-QAM et signal reconstitué par la fonction demapGray');
xlabel('I');
ylabel('Q');
grid on;
hold on;

%signal recu buité
plot(real(signalSymbolsReceivedCor), imag(signalSymbolsReceivedCor),"X");

%Analyse taux erreur et RSB

rsbn = 1:1:13;
ratio = 3*log(M)/((M-1)*log(2));
variances = 1./(ratio * 10 .^ ((rsbn) / 10));
Taux_Erreur_Binaires, TEB_Symboles = arrayfun(@(x) teb(signalBits,x,g0), variances);

%Affichage du Taux d'erreurs binaires en fonction de RSB
figure(4);
semilogy(rsbn, [Taux_Erreur_Binaires;TEB_Symboles]);
ylim([0 max(Taux_Erreur_Binaires)]);
legend(["Pb(min)(e) Mesure (bits)","Ps(min)'e) Mesure(symbole)"]);
title("taux d'erreurs binaires en fonction de RSB");
ylabel("Taux d'erreur bianire");
xlabel("Eb/N0 en dB");

%Affichage de la probabilité d'erreur minimal théorique et expérimental en
%fonction de RSB
 figure(5);

 coef1 =4*(sqrt(M)-1)/(sqrt(M)*(log(M)/log(2)));
 coef2 = 3*(log(M) /log(2)) / (M-1);

 erfcs = arrayfun(@(x) 0.5 *coef1 *erfc(sqrt(coef2*0.5*10.^(x/10))), rsbn);
 erfcs_bis = erfcs*(log(M)/log(2));
 erfcs2 =Taux_Erreur_Binaires;
 erfcs2_bis = TEB_Symboles;

 semilogy(rsbn, [erfcs; erfcs_bis; erfcs2; erfcs2_bis]);
 title("Probabilité d'erreur minimal, théorique et expérimental = f(RSB)");
 legend(["Pb(min)(e) Théorique(bits)","Ps(min)(e) Théorique(symbole)","Pb(min)(e) Expérimentale(bits)","Ps(min)(e) Expérimentale(symbole)"]);
 ylim([0 max(erfcs)]);
 ylabel("Probabilité d'erreur minimal");
 xlabel("Eb/N0 en dB");





