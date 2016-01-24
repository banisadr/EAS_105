function [TA] = SA2TA(SA)
n = size(SA,2);
holder = [];
for i = 1:n
    if SA(i) == 1
        holder = [holder; [0 1 1]*2^(n-i)];
    elseif SA(i) == 2
        holder = [holder; [1 0 1]*2^(n-i)];
    else
        holder = [holder; [1 1 0]*2^(n-i)];
    end
end
TA(1) = sum(holder(:,1));
TA(2) = sum(holder(:,2));
TA(3) = sum(holder(:,3));
end