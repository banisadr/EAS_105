function [ newtonTime, bisectionTime ] = CompareNewtonWithBisection(f, fprime, a, b, tol)

tic;
BisectionRootFinder(f, a, b, tol);
bisectionTime = toc;

c = (a+b)/2;
tic;
NewtonRootFinder(f, fprime, c, tol);
newtonTime = toc;

end