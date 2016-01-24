function [ v_out ] = QuickConvertVectorBaseAToBaseB(v_in, A, B)
if A == B
    v_out = v_in;
elseif v_in == 0
    v_out = v_in;
elseif A>B
    v_out = QuickLengthenVectorBaseAToBaseB(v_in, A, B);
else
    v_out = QuickShortenVectorBaseAToBaseB(v_in, A, B);
end
end