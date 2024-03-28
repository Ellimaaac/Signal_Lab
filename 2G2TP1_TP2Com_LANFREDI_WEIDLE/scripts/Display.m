function [] = Display(M, mComplex, mGray)
    x = real(mComplex(:));
    y = imag(mComplex(:));
    z = mGray(:);

    % new figure
    figure

    % dessiner les points de la constellation
    scatter(x, y, 50, 'b*');          
    axis([-sqrt(M) sqrt(M) -sqrt(M) sqrt(M)]);

    % ajouter codes de Gray 
    for k = 1 : M
        text(x(k)-0.6, y(k)+0.3, dec2base(z(k), 2, log2(M)), 'Color', [1 0 0]);
    end

    %parametres figure
    title('Codage de Gray de la 16-QAM');
    xlabel('I');
    ylabel('Q');
    grid on;
end