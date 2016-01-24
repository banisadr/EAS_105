function drawTowers( L , ax)
set(gcf,'CurrentAxes',ax);
hold on;
axis ([0 72 0 24]);
cla;
%Set up the axis

if size (L{1},2) == 0
    L{1} = [0];
end
if size (L{2},2) == 0
    L{2} = [0];
end
if size(L{3},2) == 0
    L{3} = [0];
end
L{1} = L{1}(end:-1:1);
L{2} = L{2}(end:-1:1);
L{3} = L{3}(end:-1:1);
for i = 1:size(L{1},2)
    if L{1}(i) ~= 0
        rectangle('Position',[12-L{1}(i),i*2-2,2*L{1}(i),2])
        text(12,i*2-1,num2str(L{1}(i)));
    end
end
for i = 1:size(L{2},2)
    if L{2}(i) ~= 0
        rectangle('Position',[36-L{2}(i),i*2-2,2*L{2}(i),2])
        text(36,i*2-1,num2str(L{2}(i)));
    end
end
for i = 1:size(L{3},2)
    if L{3}(i) ~= 0
        rectangle('Position',[60-L{3}(i),i*2-2,2*L{3}(i),2])
        text(60,i*2-1,num2str(L{3}(i)));
    end
end

end