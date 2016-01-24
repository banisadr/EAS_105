function [w] = RK4(f, t, init)
h = t(2)-t(1);
w = zeros(1,size(t,1));
w(1) = init;
for i = 1:size(t,1)-1
    k1 = h*f(t(i),init);
    k2 = h*f(t(i)+h/2,init+1/2*k1);
    k3 = h*f(t(i)+h/2,init+1/2*k2);
    k4 = h*f(t(i+1),init+k3);
    w(i+1) = init + 1/6*(k1+2*k2+2*k3+k4);
    init = w(i+1);
end
w = w';
end