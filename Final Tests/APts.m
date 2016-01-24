function [ P ] = APts( )
theta=linspace(0,2*pi,6);
P=zeros(2,6);
P(1, 1:5)=cos(theta(1:5));
P(2, 1:5)=sin(theta(1:5));
P(1, 6) = P(1, 1);
P(2, 6) = P(2, 1);
end
