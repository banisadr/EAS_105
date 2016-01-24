function[t_out, yp_out] = NDiff5A(t_in,y_in)
h = t_in(2) - t_in(1);
t_out = t_in(1:end-4);
yp_out = (-25*y_in(1:end-4) + 48*y_in(2:end-3) - 36*y_in(3:end-2) + 16*y_in(4:end-1) - 3*y_in(5:end))/(12*h);
end