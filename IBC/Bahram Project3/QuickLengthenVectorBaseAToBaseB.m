function [ v_out ] = QuickLengthenVectorBaseAToBaseB(v_in, A, B)
v_size = size(v_in, 2);
factor = floor(log(A)/log(B));
v_out = zeros(1,v_size*factor);
for i = 1:v_size;
    insert = (ConvertVectorBaseTenToBase (v_in(i),B));
    while size(insert,2) ~= factor;
        insert = [0 insert];
    end
    v_out((i-1)*factor+1:(i-1)*factor+(factor)) = insert;
end
end