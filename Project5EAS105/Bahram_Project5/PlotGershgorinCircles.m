function PlotGershgorinCircles(M)
CR = MtoCRlist(M);
hold on;
axis equal;
for i = 1:size(CR,1)
    PlotCircle(CR(i,1),CR(i,2),'g');
end
[v d] = eig(M);
plot(diag(d),'o');
end