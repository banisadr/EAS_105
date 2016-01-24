function Tester_RootFinding()

%Sept 19 2011 
%Donna Dietz
%CIS Univeristy of Pennsylvania

%To test EAS105 RootFinding Project

success=zeros(1,3); %zeros(1,n) where n is number of routines to test

fid=fopen('WorkingReportRootFindingProjectEAS105F2010.txt','wt');
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
fprintf(fid, 'Dear Student:  This is a ''working report'' for the Root Finding Project. ');
fprintf(fid, '\n \n');
fprintf(fid, 'Please let me know promptly if you find a bug in this Tester Code. \n');
fprintf(fid, '\n \n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1)BisectionRootFinder

f=@(x)(x^3);
answ=-10;
answ2=10;

f2=@(x)(5-x^3);
answ3=-10;

try
    answ=BisectionRootFinder(f,-1,1,0.001);
    answ2=BisectionRootFinder(f,-0.2,1,0.00001);
    answ3=BisectionRootFinder(f2,0,10,0.0000001);
catch
end


if abs(answ) <= 0.0015 && abs(answ2) <= 0.000015  && abs(answ3^3-5)<=0.000001
   fprintf(fid, '1) BisectionRootFinder seems to work fine!\n');
   success(1)=1;
else
   fprintf(fid, '1) You need to work on BisectionRootFinder.*****************\n');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 2)NewtonRootFinder

f=@(x)(x^2-5);
fp=@(x)(2*x);
answ=-10;
f2=@(x)(-x^3-5);
fp2=@(x)(-3*x^2);
answ2=10;

try
    answ=NewtonRootFinder(f,fp,3,0.000001);
    answ2=NewtonRootFinder(f2,fp2,3,0.000001);
catch
end


if abs(answ-2.236067977499978) <= 0.0000015  &&  ...
     abs(answ2+1.709975946676697) <= 0.0000015    
   fprintf(fid, '2) NewtonRootFinder seems to work fine!\n');
   success(2)=1;
else
   fprintf(fid, '2) You need to work on NewtonRootFinder.*****************\n');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3) CompareNewtonWithBisection

f=@(t)(sin(t).*t.^2-4);
fprime=@(t)(  (sin(t)).*(2*t) + (t.^2-4).*(cos(t))  );
a=-6;
b=0;
t1=100;
t2=100;

f2=@(t)(10*t.^3-0.1);
f2prime=@(t)(30*t.^2 );
a2=-1;
b2=4;
t3=100;
t4=100;

f3=@(x)(x.^10-0.1);
fp3=@(x)(10*x.^9);
tn=2;
tb=20;

try
    t1sum=0;
    t2sum=0;
    t3sum=0;
    t4sum=0;
    tnsum=0;
    tbsum=0;
    for i=1:1000
        [t1, t2]=CompareNewtonWithBisection(f,fprime,a,b,0.0001);
        t1sum=t1sum+t1;
        t2sum=t2sum+t2;
        [t3, t4]=CompareNewtonWithBisection(f2,f2prime,a2,b2,0.000000001);
        t3sum=t3sum+t3;
        t4sum=t4sum+t4;
        [tn,tb]=CompareNewtonWithBisection(f3,fp3,-1,40,0.1);
        tnsum=tnsum+tn;
        tbsum=tbsum+tb;
    end
catch
end


if  t1sum < t2sum  &&  t3sum < t4sum && tnsum > tbsum
   fprintf(fid, '3) CompareNewtonWithBisection seems to work fine!\n');
   success(3)=1;
else
   fprintf(fid, '3) You need to work on CompareNewtonWithBisection.*****************\n');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% Make suggestions for what to do next!

fprintf(fid, '\n \n');

%Tasks which have no prerequisites
if success(1)==0
    fprintf(fid, 'You should start to work on BisectionRootFinder, which has no prerequisites!\n');
end

if success(2)==0
    fprintf(fid, 'You could start to work on NewtonRootFinder, which has no prerequisites!\n');
end



%If student has completed tasks without prerequisites, then suggest tasks based on current
%progress.

if sum(success([1 2]))==2

    if ~success(3)
        fprintf(fid, 'You should work on CompareNewtonWithBisection next. \n');
    end

end




if sum(success(1:3))==3
    fprintf(fid, 'Everything looks great! Zip up your three routines and turn it all in on Blackboard! \n');
end


fclose(fid);


disp(['See ''WorkingReportRootFindingProjectEAS105F2010.txt'' for results! '])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
