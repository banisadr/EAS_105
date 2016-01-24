function [w] = Heun(f, t, init)
h = t(2)-t(1);
w = zeros(1,size(t,1));
w(1) = init;
for i = 1:size(t,1)-1
    w(i+1) = init + h/4*(f(t(i),init) + 3*f(t(i)+2/3*h,init+2/3*h*f(t(i),init)));
    init = w(i+1);
end
w = w';
end