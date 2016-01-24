function [SA] = TA2SA(TA)
%n = 0;
%while 2^n < max(TA)
%    n = n+1;
%end
n = floor(log2(sum(TA)+2)-1);

SA = zeros(1,n);
for i = 1:n
    k = find(TA == min(TA));
    if k == 1
        SA(i) = 1;
        TA = [TA(1) TA(2)-2^(n-i) TA(3)-2^(n-i)];
    elseif k == 2
        SA(i) = 2;
        TA = [TA(1)-2^(n-i) TA(2) TA(3)-2^(n-i)];
    else
        SA(i) = 3;
        TA = [TA(1)-2^(n-i) TA(2)-2^(n-i) TA(3)];
    end
end

end