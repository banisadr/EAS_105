function Frame( t )
P=APts();
Q=BPts();
R=t*P+(1-t)*Q;
plot(R(1,:),R(2,:),'Linewidth',2);
hold on
axis equal
end
