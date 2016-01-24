function play()
disp('Sup bro... Lets play a game of towers of hanoi');
disks = input('Please select a number of disks to play with: ');
fprintf(1,'\n \n');
R = randLocationR(disks);
S = rollcall2SA(R);
T = SA2TA(S);
L = rollcall2List(R);
solved = SA2TA(rollcall2SA(ones(1,disks)*3));
while distTA(T,solved) ~= 0
    distance = distTA(T,solved);
    printTowers(L);
    disp('Now try to move all of the disks to stack 3. (Just hit return to quit)');
    fprintf(1,['Shortest number of moves to completion: ',int2str(distance),'\n \n'])
    from = input('Take from stack: ');
    if isempty(from)
        return;
    end
    to = input('Put on stack: ');
    fprintf(1,'\n \n');
    if isempty(to)
        return;
    end
    if isLegalMove(L,from,to)
        L = makeMove(L,from,to);
        R = list2Rollcall(L);
        S = rollcall2SA(R);
        T = SA2TA(S);
    else
        disp('Well this is awkward. You can not do that.');
    end
end
printTowers(L);
disp('You Win! I am proud of you!');
end