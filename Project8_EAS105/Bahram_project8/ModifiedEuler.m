function [w] = ModifiedEuler(f, t, init)
h = t(2)-t(1);
w = zeros(1,size(t,1));
w(1) = init;
for i = 1:size(t,1)-1
    w(i+1) = init + h/2*(f(t(i),init)+f(t(i+1),init+h*f(t(i),init)));
    init = w(i+1);
end
w = w';
end