function [S] = rollcall2SA(R)
n = size(R,2);
S = zeros(1,n);
if mod(n,2) == 0
    p = [3 2 1];
else
    p = [1 2 3];
end
for i = 1:n
    S(i) = find(p == R(i));
    k = S(i);
    if k == 1
        p = [p(1) p(3) p(2)];
    elseif k == 2
        p = [p(3) p(2) p(1)];
    else
        p = [p(2) p(1) p(3)];
    end
end
end