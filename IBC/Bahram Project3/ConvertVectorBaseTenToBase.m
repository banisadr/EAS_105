function [ v_out ] = ConvertVectorBaseTenToBase(v_in, base_in)
v_out = v_in;
if v_out == 0;
    return;
else
    v_out = v_out(end: -1: 1);
    v_size = size(v_out);
    count = 0;
    sum = 0;
    while count < v_size(2);
        sum = sum + v_out(count+1)*10^(count);
        count = count + 1;
    end
    count = 1;
    v_out = [0];
    while floor(sum/base_in) ~=0;
        v_out(count) = mod(sum,base_in);
        sum = floor(sum/base_in);
        count = count + 1;
    end
    if mod(sum,base_in) ~= 0;
        v_out(count) = mod(sum,base_in);
    end
    v_out = v_out(end: -1: 1);
end
end