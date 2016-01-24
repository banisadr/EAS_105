function [v] = int2baseTwo(x)
hold = dec2base(x,2);
hold = hold(end: -1: 1);
v = zeros(1,(size(hold,2)));
for i = 1:size(hold,2);
    v(i) = hold(i)-48;
end
end