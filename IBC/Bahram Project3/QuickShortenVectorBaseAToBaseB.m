function [ v_out ] = QuickShortenVectorBaseAToBaseB(v_in, A, B)
factor = floor(log(B)/log(A));
v_size = ceil(size(v_in,2)/factor);
missing = mod(-size(v_in,2),factor);
if missing ~= 0;
    v_in = [zeros(1,missing) v_in];
end
v_out = zeros(1,v_size);
for i = 1:v_size;
    chunk = v_in((i-1)*factor+1:(i-1)*factor+(factor));
    insert = 0;
    chunk = chunk(end:-1:1);
    for j = 1:factor;
        insert = insert + chunk(j)*A^(j-1);
    end
    v_out(i) = insert;
end
v_out = floor(v_out);
end