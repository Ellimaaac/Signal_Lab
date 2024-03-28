function an = decodeBPSK(r_n)
    l = length(r_n);
    an = (1:l);
    for r_i = 1:1:l
        if r_n(r_i) > 0
            an(r_i) = 1;
        else
            an(r_i) = -1;
        end
    end
end