function [ root ] = BisectionRootFinder(f, a, b, tol)

root = (a+b)/2;
while abs(a-b) > tol;
    root = (a+b)/2;
    if f(root) > 0 && f(b) > 0;
        b = root;
    elseif f(root) >0 && f(b) < 0;
        a = root;
    elseif f(root) < 0 && f(a) < 0;
        a = root;
    elseif f(root) < 0 && f(a) > 0;
        b = root;
    elseif f(root) == 0;
        return;
        
    end
    
end

end


    