function printTowers(L)
height = max([size(L{1},2),size(L{2},2),size(L{3},2)]);
for i = 1:3
    L{i} = [zeros(1,(height - size(L{i},2))), L{i}];
end
M = [L{1};L{2};L{3}]';

for i = 1:height
    for j = 1:3
        if M(i,j) == 0
            fprintf(1,['     '])
        elseif M(i,j) > 9
            fprintf(1,['   ',int2str(M(i,j))])
        else
            fprintf(1,['    ',int2str(M(i,j))])
        end
    end
    fprintf(1,'\n')
end
fprintf(1,'---------------\n')
fprintf(1,'    1    2    3 \n')
end