function [L] = rollcall2List(R)
L = {[],[],[]};
R = R(end:-1:1);
for i = 1:size(R,2)
    L{(R(i))} = [L{(R(i))},i];
end
end