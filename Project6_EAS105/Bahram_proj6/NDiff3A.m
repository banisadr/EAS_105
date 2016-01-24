function[t_out, yp_out] = NDiff3A(t_in,y_in)
h = t_in(2) - t_in(1);
t_out = t_in(1:end-2);
yp_out = (-3*y_in(1:end-2) + 4*y_in(2:end-1) - y_in(3:end))/(2*h);
end