function PlotDiffTests(c)
for i = 1:size(c,2)
    if size((c{i}{1}),1) <= 5
        figure(i);
        hold on;
        title(['Example ' num2str(i)]);
        [x,y] = NDiff2A((c{i}{1}),(c{i}{2}));
        plot(x,y,'color',[0,0,0]);
        [x,y] = NDiff2B((c{i}{1}),(c{i}{2}));
        plot(x,y,'color',[1,0,0]);
        [x,y] = NDiff3A((c{i}{1}),(c{i}{2}));
        plot(x,y,'color',[0,1,0]);
        [x,y] = NDiff3B((c{i}{1}),(c{i}{2}));
        plot(x,y,'color',[0,0,1]);
        [x,y] = NDiff3C((c{i}{1}),(c{i}{2}));
        plot(x,y,'color',[1,1,0]);
        plot((c{i}{1}),(c{i}{3}),'color',[0,1,1]);
        legend('2A','2B','3A','3B','3C','Actual','Location','Best');
        hold off;
    else
        figure(i);
        hold on;
        title(['Example ' num2str(i)]);
        [x,y] = NDiff2A((c{i}{1}),(c{i}{2}));
        plot(x,y,'color',[0,0,0]);
        [x,y] = NDiff2B((c{i}{1}),(c{i}{2}));
        plot(x,y,'color',[1,0,0]);
        [x,y] = NDiff3A((c{i}{1}),(c{i}{2}));
        plot(x,y,'color',[0,1,0]);
        [x,y] = NDiff3B((c{i}{1}),(c{i}{2}));
        plot(x,y,'color',[0,0,1]);
        [x,y] = NDiff3C((c{i}{1}),(c{i}{2}));
        plot(x,y,'color',[1,1,0]);
        [x,y] = NDiff5A((c{i}{1}),(c{i}{2}));
        plot(x,y,'color',[.5,.5,0],'LineWidth',2);
        [x,y] = NDiff5B((c{i}{1}),(c{i}{2}));
        plot(x,y,'color',[0,.5,.5],'LineWidth',2);
        [x,y] = NDiff5C((c{i}{1}),(c{i}{2}));
        plot(x,y,'color',[.5,.5,.5],'LineWidth',2);
        plot((c{i}{1}),(c{i}{3}),'color',[0,1,1]);
        legend('2A','2B','3A','3B','3C','5A','5B','5C','Actual','Location','Best');
        hold off;
    end
end
end