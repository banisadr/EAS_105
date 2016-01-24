function Tester_HanoiA()

%Oct 17 2011
%Donna Dietz
%CIS Univeristy of Pennsylvania

%To test EAS105 Hanoi Project

success=zeros(1,15); %zeros(1,n) where n is number of routines to test

fid=fopen('WorkingReportHanoiAProjectEAS105F2011.txt','wt');
myfileis=fid;
fprintf(fid, date);
fprintf(fid, '\n \n');
k=clock;
if k(4)<=12
   if k(4)<=11 
      suffix=' am';
   else
      suffix=' pm';
   end
   
   if k(4)==0
       k(4)=12;
   end
else
    k(4)=k(4)-12;
    suffix=' pm';
end

if k(5)<10
    fprintf(fid, cat(2,num2str(k(4)),':','0',num2str(k(5)),suffix));
else
fprintf(fid, cat(2,num2str(k(4)),':',num2str(k(5)),suffix));
end

fprintf(fid, '\n \n');
fprintf(fid, 'Dear Student:  This is a ''working report'' for the Hanoi Project part A. ');
fprintf(fid, '\n \n');
fprintf(fid, 'Please let me know promptly if you find a bug in this Tester Code. \n');
fprintf(fid, '\n \n');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1)

a1=[1,2,3,4,5];
a2=[1,2,3,4,5];
a3=[1,2,3,4,5];

try
  a1 = int2baseTwo(2);
  a2 = int2baseTwo(74);  
  a3 = int2baseTwo(2363243);  
catch
end
 
if isequal(a1, [0,1] ) && isequal(a2,[0,1,0,1,0,0,1] ) && isequal(a3, [1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1])
    success(1)=1;
end

if success(1)==1
    fprintf(fid, '1) int2baseTwo is working!\n');
else
    fprintf(fid, '1) int2baseTwo is NOT working  *********************** !\n');
end  



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2) 

r = [4,5,6];
try
   r = randLocationR(100); 
catch
end
  
testspassed=1;

if isempty(find(r==1,1)) || isempty(find(r==2,1)) || isempty(find(r==3,1))
    testspassed=0;
end

if size(r,2)~=100
    testspassed=0;
end

for i=1:100
    try
        if ~(r(i)==1||r(i)==2||r(i)==3)
            testspassed=0;
        end
    catch
        testspassed=0;
    end
end

if sum(r)<175 || sum(r)>225
    testspassed=0;
end

success(2)=testspassed;

if success(2)==1
    fprintf(fid, '2) randLocationR is working!\n');
else
    fprintf(fid, '2) randLocationR is NOT working  *********************** !\n');
end  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3) rollcall2List
% 


a1=[6];
a2=[6];
a3=[6];
k1={[2,5,7],[4,6],[1,3]};
k2={[1,5],[4],[2,3]};
k3={[7,8,9],[4,5,6],[1,2,3]};
testspassed=1;
try
    if  ~isequal(rollcall2List([1,2,1,2,3,1,3]), k1) ||...
        ~isequal(rollcall2List([1,2,3,3,1]),k2)||...
        ~isequal(rollcall2List([1,1,1,2,2,2,3,3,3]),k3) 
        testspassed=0;
    end
catch
    testspassed=0;
end

success(3)=testspassed;    

if success(3)==1
    fprintf(fid, '3) rollcall2List is working!\n');
else
    fprintf(fid, '3) rollcall2List is NOT working  *********************** !\n');
end  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4) list2Rollcall
% 

testspassed=1;
try
for i=5:100
    r1=randLocationR(i);
    L=rollcall2List(r1);
    r2=list2Rollcall(L);
    if ~isequal(r1,r2)
        testspassed=0;
    end
end
catch
    testspassed=0;
end

success(4)=testspassed;    

if success(4)==1
    fprintf(fid, '4) list2Rollcall is working!\n');
else
    fprintf(fid, '4) list2Rollcall is NOT working  *********************** !\n');
end  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5) 
printTowers(rollcall2List(randLocationR(6)));
disp(' ');
printTowers(rollcall2List(randLocationR(16)));


disp('Are these two towers displayed nicely (not crooked)? ');
success(5)=input('Answer 1 for yes, and 0 for no: ');
if success(5)==1;
    fprintf(fid, '5) You seem to have nice towers!\n');
else
    fprintf(fid, '5) You need to have nice tower plots!***********************\n');
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6) makeMove (which probably calls isLegalMove) for playing a simple game
 
L={[4],[1,2,3],[]};
testspassed=1;
try
    L=makeMove(L,3,1);
    L=makeMove(L,3,3);
    L=makeMove(L,1,3);
    L=makeMove(L,2,3);
    L=makeMove(L,2,1);
    L=makeMove(L,3,1);
    L=makeMove(L,2,3);
    L=makeMove(L,1,2);
    L=makeMove(L,1,3);
    L=makeMove(L,2,3);
    
catch
    testspassed=0;
end

k={[],[],[1,2,3,4]};
if ~isequal(L{3},k{3})
    testspassed=0;
end

if ~isempty(L{1}) || ~isempty(L{2})
    testspassed=0;
end

success(6)=testspassed;
if success(6)==1;
    fprintf(fid, '6) A simple game play passed!\n');
else
    fprintf(fid, '6) Your code failed the simple game play simulation!***********************\n');
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7)

R=[2,1,3,1,1,2,1];
SA=[2,3,2,1,1,3,2];
testspassed=1;
try
   if ~isequal(SA, rollcall2SA(R))
       testspassed=0;
   end
catch
    testspassed=0;
end

success(7)=testspassed;
if success(7)==1;
    fprintf(fid, '7) rollcall2SA passed!\n');
else
    fprintf(fid, '7) rollcall2SA failed!***********************\n');
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 8)
testspassed=1;
                
for j=5:10                
 R1=randLocationR(j);
 SA=rollcall2SA(R1);
 R2=SA2rollcall(SA);
 if ~isequal(R1,R2)
     testspassed=0;
 end
end
                
success(8)=testspassed;
if success(8)==1;
    fprintf(fid, '8) SA2rollcall passed!\n');
else
    fprintf(fid, '8) SA2rollcall failed!***********************\n');
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 9)
testspassed=1;

try

       if ~isequal(SA2TA([1,3,1,2]),[5,14,11])||...
       ~isequal(SA2TA([1,2,0,1]+1),[13,6,11])||...
       ~isequal(SA2TA([0,0,0]+1),[0,7,7])||...
       ~isequal(SA2TA([0,0,2]+1),[1,7,6])||...
        ~isequal(SA2TA([1,1,1]+1),[7,0,7])||...
        ~isequal(SA2TA([1,2,2]+1),[7,3,4])||...
        ~isequal(SA2TA([2,0,1]+1),[5,6,3])||...
        ~isequal(SA2TA([1,2,1,0,0,2,1]+1),[115,46,93])
            testspassed=0;
       end
catch
        testspassed=0;
end
                
         
success(9)=testspassed;
if success(9)==1;
    fprintf(fid, '9) SA2TA passed!\n');
else
    fprintf(fid, '9) SA2TA failed!***********************\n');
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 10)
testspassed=1;            
                
try
              SA1=randLocationR(j);%It's just 1,2,3's anyhow
              TA=SA2TA(SA1);
              SA2=TA2SA(TA);
              if ~isequal(SA1,SA2)
                  testspassed=0;
              end
catch
    testspassed=0;
end

success(10)=testspassed;
if success(10)==1;
    fprintf(fid, '10) TA2SA passed!\n');
else
    fprintf(fid, '10) TA2SA failed!***********************\n');
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 11)
testspassed=1;      
try
        SA1=[1,2,0,1,2,1,0,1]+1;
        SA2=[1,2,0,2,1,0,2,1]+1;
        TA1=SA2TA(SA1);
        TA2=SA2TA(SA2);
        [TA1,TA2]=reduceTA(TA1,TA2);
        
        Q=sortrows([TA1;TA2]')';
        TA1=Q(1,:);
        TA2=Q(2,:);
        
        RSA1=TA2SA(TA1);
        RSA2=TA2SA(TA2);
        if ~isequal(RSA1,[1,2,1,3,1]) || ~isequal(RSA2,[2,1,3,2,1])
            testspassed=0;
        end
        
        SA1=[2,1,0,0,2,0,1,2,0,0,0]+1;
        SA2=[2,1,0,0,2,0,2,1,0,1,0]+1;
        TA1=SA2TA(SA1);
        TA2=SA2TA(SA2);
        [TA1,TA2]=reduceTA(TA1,TA2);
        
        Q=sortrows([TA1;TA2]')';
        TA1=Q(1,:);
        TA2=Q(2,:);
        
        RSA1=TA2SA(TA1);
        RSA2=TA2SA(TA2);
        if ~isequal(RSA1,[1,2,3,3,3]) || ~isequal(RSA2,[2,1,3,1,3])
            testspassed=0;
        end
        
        SA1=[2,1,0,0,2,0,1,2,0,0,0]+1;
        SA2=[2,1,0,0,2,0,1,2,0,0,0]+1;
        TA1=SA2TA(SA1);
        TA2=SA2TA(SA2);
        [TA1,TA2]=reduceTA(TA1,TA2);
        
        Q=sortrows([TA1;TA2]')';
        TA1=Q(1,:);
        TA2=Q(2,:);
        
        RSA1=TA2SA(TA1);
        RSA2=TA2SA(TA2);
        if  (size(RSA1,2)>1)
            testspassed=0;
        end

catch
    
    testspassed=0;
end

success(11)=testspassed;
if success(11)==1;
    fprintf(fid, '11) reduceTA passed!\n');
else
    fprintf(fid, '11) reduceTA failed!***********************\n');
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 12)
testspassed=1;
try
    if  ~isequal(distTA([5,14,11],[13,6,11]),12) ||...
        ~isequal(distTA([1,7,6],[7,2,5]),7) ||...
        ~isequal(distTA(SA2TA([0,0,0,2]+1),SA2TA([1,1,2,0]+1)),14) ||...
        ~isequal(distTA(SA2TA([1,2,1,0,0,0,2]+1),SA2TA([1,2,1,1,1,2,0]+1)),14) ||...
        ~isequal(distTA(SA2TA([0,0,0,2]+1),SA2TA([0,0,0,2]+1)),0) ||...
	~isequal(distTA([7,3,4],[7,4,3]),1)
        testspassed=0;
    end
catch
    testspassed=0;
end

success(12)=testspassed;
if success(12)==1;
    fprintf(fid, '12) distTA passed!\n');
else
    fprintf(fid, '12) distTA failed!***********************\n');
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 13) distance measure coherence

fprintf('Test of distance coherence (13) is now being run. If you do not like this long wait, change the\n');
fprintf('number of iterations to 10 temporarily or comment out this test!\n');
testspassed=1;
try 
for iterations = 1:10000    
            R_A=randLocationR(8);
            T_A=SA2TA(rollcall2SA(R_A));
            L_A=rollcall2List(R_A);
            R_B=randLocationR(8);
            T_B=SA2TA(rollcall2SA(R_B));
            dist0=distTA(T_A,T_B);
            %look for neighbors of A, and their distances to B
            Legal=[[0,0,0],[0,0,0],[0,0,0]];
            for i =1:3
                for j =1:3
                    Legal(i,j)=isLegalMove(L_A,i,j);
                end
                Legal(i,i)=0; %not neighbor to self
            end
            distVect=[];
            for i =1:3
                for j =1:3
                    if Legal(i,j);
                        L_A=makeMove(L_A,i,j);
                        T_temp=SA2TA(rollcall2SA(list2Rollcall(L_A)));
                        distVect=[distVect , distTA(T_temp,T_B)];
                        L_A=makeMove(L_A,j,i); %undo it for the next round
                    end
                end
            end
            
            if (dist0~=0) && (isempty(find(dist0-1==distVect,1)))
                disp('432')
                T_A
                T_B
                testspassed=0;
            end
            
            distVect=abs(distVect-dist0);
            for i=1:size(distVect,2)
                if distVect(i)>1  %neighbors' distances are equal or off by one
                    disp('441')
                    T_A
                    T_B
                    distVect
                    Legal
                    testspassed=0;
                end
            end
            if size(distVect,2)>3 || size(distVect,2)<2
                disp('448')
                T_A
                T_B
                testspassed=0;
            end
            
end
catch
    disp('453 catch')
    testspassed=0;
end
     
success(13)=testspassed;
if success(13)==1;
    fprintf(fid, '13) distance coherence passed!\n');
else
    fprintf(fid, '13) distance coherence failed!***********************\n');
end                 
            

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
if sum(success(1:end))==13
    fprintf(fid, 'Everything on the automated side looks great! After the play routine works, \nzip up your routines and turn it all in on Blackboard! \n');
end


 fclose(fid);


disp(['See ''WorkingReportIVPProjectEAS105F2010.txt'' for results! '])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

