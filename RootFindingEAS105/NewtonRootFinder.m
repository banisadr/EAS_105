function [ root ] = NewtonRootFinder(f, fprime, c, tol)

x = c;
c = c - (f(c)/fprime(c));
while abs((x-c)) > tol;
    x = c;
    c = c - (f(c))/(fprime(c));
    
end
root = c;
end