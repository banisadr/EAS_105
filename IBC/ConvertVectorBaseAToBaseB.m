function [ v_out ] = ConvertVectorBaseAToBaseB(v_in, A, B)
holder = ConvertVectorBaseToBaseTen(v_in, A);
v_out =  ConvertVectorBaseTenToBase(holder, B);
end