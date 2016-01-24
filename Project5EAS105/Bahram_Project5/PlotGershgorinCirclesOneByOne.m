function PlotGershgorinCirclesOneByOne(M)
CR = MtoCRlist(M);
CR = sort(CR);
[v d] = eig(M);
dgnl = sort(diag(d));
for i = 1:size(CR,1)
    figure(i);
    hold on;
    PlotCircle(CR(i,1),CR(i,2),'g');
    axis equal;
    plot(dgnl(i),'o');
    hold off;
end
end