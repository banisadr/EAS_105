function PlotTests(c)
for i = 1:size(c,2)
    figure(i);
    hold on;
    title(['Example ' num2str(i)]);
    y = Euler((c{i}{1}),(c{i}{2}),(c{i}{3}));
    plot((c{i}{2}),y,'color',[0,0,0]);
    y = Midpoint((c{i}{1}),(c{i}{2}),(c{i}{3}));
    plot((c{i}{2}),y,'color',[1,0,0]);
    y = Heun((c{i}{1}),(c{i}{2}),(c{i}{3}));
    plot((c{i}{2}),y,'color',[0,1,0]);
    y = ModifiedEuler((c{i}{1}),(c{i}{2}),(c{i}{3}));
    plot((c{i}{2}),y,'color',[0,0,1]);
    y = RK4((c{i}{1}),(c{i}{2}),(c{i}{3}));
    plot((c{i}{2}),y,'color',[1,1,0]);
    f = (c{i}{4});
    y = f(c{i}{2});
    plot((c{i}{2}),y,'color',[0,1,1]);
    legend('Euler','Midpoint','Heun','ModifiedEuler','RK4','Actual','Location','Best');
    hold off;
end
end