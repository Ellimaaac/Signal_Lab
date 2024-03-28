function Symboles = mappingGray(bits)
    segment = transpose(reshape(bits,4,[]));
    mGray = Gray16QAM();
    mComplex = const16QAM();
    sz = size(segment);
    sz = sz(1);
    Symboles = [];
    for i = 1:sz
        temp = strjoin(string(segment(i,:)), "");
        temp = bin2dec(temp);
        [x,y] = find(mGray == temp, 1, 'last');
        Symboles = [Symboles, mComplex(x,y)];
    end
   
end
