function [L] = makeMove(L,a,b)
if isLegalMove(L,a,b)
    L{b} = [L{a}(1),L{b}];
    L{a} = L{a}(2:end);
else
    return;
end