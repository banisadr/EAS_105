function [ circle_out ] = PlotCircle(c, r, MyColor)
circle_out = rectangle('position',[real(c)-r,imag(c)-r, 2*r, 2*r],'curvature',[1,1],'EdgeColor',MyColor);
end