function [R] = SA2rollcall(SA)
n = size(SA,2); 
R = zeros(1,n);
if mod(n,2) == 0
    p = [3 2 1];
else
    p = [1 2 3];
end
for i = 1:n
    R(i) = p(SA(i));
    k = SA(i);
    if k == 1
        p = [p(1) p(3) p(2)];
    elseif k == 2
        p = [p(3) p(2) p(1)];
    else
        p = [p(2) p(1) p(3)];
    end
end
end