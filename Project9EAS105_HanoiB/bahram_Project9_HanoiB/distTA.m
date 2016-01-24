function [dist] = distTA(A_in,B_in)
if A_in == B_in
    dist = 0;
else
    [A B] = reduceTA(A_in, B_in);
    n = floor(log2(sum(A)+2)-1);
    for i = 1:3
        A(i) = (A(i)-2^(n-1));
        if A(i) < 0
            A(i) = -1;
        end
        B(i) = (B(i)-2^(n-1));
        if B(i) < 0
            B(i) = -1;
        end
    end
    cornerA = A == -1;
    cornerB = B == -1;
    twoBcorner = find(A~= -1 & B~= -1);
    twoBdistance = A(twoBcorner)+B(twoBcorner)+2+2^(n-1)-1;
    oneBdistance = A(cornerB)+B(cornerA)+1;
    if oneBdistance < twoBdistance
        dist = oneBdistance;
    elseif oneBdistance > twoBdistance
        dist = twoBdistance;
    else
        dist = oneBdistance;
    end
end
end