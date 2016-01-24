function [ v_out ] = ConvertVectorBaseToBaseTen(v_in, base_in)
v_in = v_in(end:-1:1);
v_size = size(v_in);
count = 1;
sum = 0;
while count <= v_size(2);
    sum = sum + v_in(count)*base_in^(count-1);
    count = count + 1;
end
count = 1;
v_out = [0];
while floor(sum/10) ~= 0;
    v_out(count) = mod(sum,10);
    sum = floor(sum/10);
    count = count + 1;
end
if mod(sum,base_in) ~= 0;
    v_out(count) = mod(sum,base_in);
end
v_out = v_out(end:-1:1);
end