function[t_out, yp_out] = NDiff5C(t_in,y_in)
h = t_in(2) - t_in(1);
t_out = t_in(3:end-2);
yp_out = (y_in(1:end-4) - 8*y_in(2:end-3) + 8*y_in(4:end-1) - y_in(5:end))/(12*h);
end