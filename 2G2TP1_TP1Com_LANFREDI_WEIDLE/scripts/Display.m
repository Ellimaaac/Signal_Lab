% Partie 1 : Chaine de communication BPSK
figure;
    subplot(311);
        plot(vect_N, an);
        legend('BPSK');
        xlabel('Nombre d échantillons'); ylabel('Amplitude');
        ylim([-1.2, 1.2]);
        title('Représentation du signal BPSK');
    subplot(312);
        plot(vect_N, bn);
        legend('Bruit');
        xlabel('Echantillons'); ylabel('Amplitude');
        ylim([-1.2, 1.2]);
        title('Représentation du Bruit');
    subplot(313);
        plot(vect_N, cn);
        legend('Bruit');
        xlabel('Echantillons'); ylabel('Amplitude');
        ylim([-1.2, 1.2]);
        title('Représentation du signal décodé bruité');

% BRUIT
figure;
    histogram(bn, 'Normalization', 'probability');
    title('Histogramme du bruit généré');
    xlabel('Valeur du bruit');
    ylabel('Fréquence relative');

% Taux d'erreur binaire du canal AWGN

figure;
subplot(211);
    plot(EbNodB, variance);
    legend('variance du bruit');
    xlabel('Eb/No (dB)'); ylabel('Variance');
    title('Variance du bruit en fonction de Eb/No');
subplot(212);
    plot(EbNodB, taux_erreur);
    legend("Taux d'erreur");
    xlabel("Eb/No (dB)"); ylabel("Taux d'erreur");
    title("Taux d'erreur en fonction de Eb/No");




% Probabilité d'erreur binaire

figure;
    plot(EbNodB, Peb);
    legend("Probabilité d'erreur");
    xlabel('Eb/No (dB)'); 
    ylabel("Probabilité d'erreur binaire");
    ylim([0, 0.01]);
    title("Probabilité d'erreur binaire en fonction de Eb/No");

figure;
    plot(variance, Peb);
    legend("Probabilité d'erreur");
    xlabel('Variance'); ylabel("Probabilité d'erreur binaire");
    ylim([0, 0.01]);
    title("Probabilité d'erreur binaire en fonction de la variance");




% Partie 2 : IES
%%

figure;
stem(1:N, xn);
title('Signal Utile xn');
xlabel('n');
ylabel('xn');


% Visualiser la constellation BPSK avec IES
figure;
scatter(real(rn_real_ideal), imag(rn_real_ideal), 'x');
title('Constellation BPSK');
xlabel('Partie réelle');
ylabel('Partie imaginaire');

%%
% Visualiser la constellation BPSK avec IES
figure;
scatter(real(rn_real), imag(rn_real), 'x');
title('Constellation BPSK avec IES');
xlabel('Partie réelle');
ylabel('Partie imaginaire');

% Tracer le taux d'erreur binaire du canal non-idéal
figure;
semilogy(EbNodB_values, taux_erreur_canal_non_ideal, 'o-', 'LineWidth', 2);
title('Taux d''erreur binaire du canal non-idéal');
xlabel('Eb/N0 (dB)');
ylabel('Taux d''erreur binaire');
grid on;

% Tracer le taux d'erreur binaire avec égalisation zero forcing
figure;
semilogy(EbNodB_values, taux_erreur_zero_forcing, 'o-', 'LineWidth', 2);
title('Taux d''erreur binaire avec égalisation zero forcing');
xlabel('Eb/N0 (dB)');
ylabel('Taux d''erreur binaire');
grid on;


