function [boolean] = isLegalMove(L,a,b)
if size(L{a},2) == 0
    boolean = 0;
elseif size(L{b},2) == 0
    boolean = 1;
elseif a == b
   boolean = 1;
elseif L{a}(1) < L{b}(1)
   boolean = 1;
else
   boolean = 0;
end
end