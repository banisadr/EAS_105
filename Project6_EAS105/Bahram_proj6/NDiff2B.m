function[t_out, yp_out] = NDiff2B(t_in,y_in)
h = t_in(2) - t_in(1);
t_out = t_in(2:end);
yp_out = (y_in(2:end) - y_in(1:end-1))/h;
end