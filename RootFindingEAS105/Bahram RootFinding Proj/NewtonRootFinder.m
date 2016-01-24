function [ root ] = NewtonRootFinder(f, fprime, c, tol)

x = c + 10;
while abs((x-c)) > tol;
    x = c;
    c = c - (f(c))/(fprime(c));
    
end
root = c;
end