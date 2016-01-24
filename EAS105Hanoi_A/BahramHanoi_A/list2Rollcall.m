function [R] = list2Rollcall(L)
len = (size((L{1}),2) + size((L{2}),2) + size((L{3}),2));
R = zeros(1,len);
for i = 1:len
    if size((L{1}),2)== 0
        L{1} = [0];
    end
    if size((L{2}),2)== 0
        L{2} = [0];
    end
    if size((L{3}),2)== 0
        L{3} = [0];
    end
    if L{1}(end)>L{2}(end) && L{1}(end)>L{3}(end)
        R(i) = 1;
        if size((L{1}),2) == 1
            L{1} = [0];
        else
            L{1} = L{1}(1:end-1);
        end    
    elseif L{2}(end)>L{1}(end) && L{2}(end)>L{3}(end)
        R(i) = 2;
        if size((L{2}),2) == 1
            L{2} = [0];
        else
            L{2} = L{2}(1:end-1);
        end    
    else
        R(i) = 3;
        if size((L{3}),2) == 1
            L{3} = [0];
        else
            L{3} = L{3}(1:end-1);
        end
    end
        
end