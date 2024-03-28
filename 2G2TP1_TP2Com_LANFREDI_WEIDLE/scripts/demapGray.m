function bits = demapGray(Symbols)
    mGray = Gray16QAM();
    mComplex = const16QAM();
    N = length(Symbols);

    codeGray = [];

    for i = 1 : N
        value = Symbols(i);
        dist = [];
        for x = 1 : 4
            for y = 1 : 4
                realdist = (real(value) - real(mComplex(x, y)));
                imagdist = (imag(mComplex(x, y)) - imag(value));
                temp = realdist * realdist + imagdist * imagdist;
                dist = [dist, temp];
            end
        end
        z = find(dist == min(dist));
        x = ceil(z / 4);
        y = mod(z + 4, 4);
        if y == 0
            y = 4;
        end 
        symbole = mComplex(x, y);
        gray = mGray(x, y);
        codeGray = [codeGray, gray];
    end
    bits = split(strjoin(reshape(string(dec2bin(codeGray, 4)), 1, []), ""), "");
    bits = bits(2:end-1);
    bits = reshape(cell2mat(arrayfun(@(x) str2num(x), bits, 'UniformOutput', false)), 1, []);
end
