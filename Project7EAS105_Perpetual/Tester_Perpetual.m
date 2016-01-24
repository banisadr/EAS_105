function Tester_Perpetual()

%July 2011
%Donna Dietz
%EAS105 Univeristy of Pennsylvania

%To test EAS105 Perpetual Calendar Project

success=zeros(1,15); %zeros(1,n) where n is number of routines to test

fid=fopen('WorkingReportPerpetualProjectEAS105F2011.txt','wt');
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
fprintf(fid, 'Dear Student:  This is a ''working report'' for the Perpetual Calendar Project. ');
fprintf(fid, '\n \n');
fprintf(fid, 'Please let me know promptly if you find a bug in this Tester Code. \n');
fprintf(fid, '\n \n');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1)

v=[0,0,0,0,0,0,0];

try
  v(1)=IsValidDate(2000,1,31);
  v(2)=IsValidDate(2000,1,32);
  v(3)=IsValidDate(1,1,2000);
  v(4)=IsValidDate(2000,2,32);
  success(1)=isequal(v,[1,0,0,0,0,0,0]);
catch
end
 

if success(1)==1
    fprintf(fid, '1) Basic test of IsValidDate is working!\n');
else
    fprintf(fid, '1) IsValidDate needs serious work at this point  *********************** !\n');
end  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2)

v=2*ones(1,12);

try
    v(1)=IsValidDate(2000,1,32);
    v(2)=IsValidDate(2000,2,30);
    v(3)=IsValidDate(2000,3,32);
    v(4)=IsValidDate(2000,4,31);
    v(5)=IsValidDate(2000,5,32);
    v(6)=IsValidDate(2000,6,31);
    v(7)=IsValidDate(2000,7,32);
    v(8)=IsValidDate(2000,8,32);
    v(9)=IsValidDate(2000,9,31);
    v(10)=IsValidDate(2000,10,32);
    v(11)=IsValidDate(2000,11,31);
    v(12)=IsValidDate(2000,12,32);
    
    success(2)=isequal(v,zeros(1,12));
catch
end


if success(2)==1
    fprintf(fid, '2) Months test of IsValidDate is working!\n');
else
    fprintf(fid, '2) Basic tests of month length are incorrect  *********************** !\n');
end  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3)

v=2*ones(1,6);

try
    v(1)=IsValidDate(1800,2,29);
    v(2)=IsValidDate(1900,2,29);
    v(3)=IsValidDate(2000,2,29);
    v(4)=IsValidDate(2100,2,29);
    v(5)=IsValidDate(2004,2,29);
    v(6)=IsValidDate(2001,2,29);
    success(3)=isequal(v,[0,0,1,0,1,0]);
catch
end


if success(3)==1
    fprintf(fid, '3) LeapYear test of IsValidDate is working!\n');
else
    fprintf(fid, '3) February LeapYear tests are incorrect  *********************** !\n');
end  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4)

CellA={};

try
    for i = 0:6
       CellA{i+1}=IntToDayOfWeek(i); 
    end
    
    success(4)=isequal(CellA,{'Saturday','Sunday','Monday','Tuesday','Wednesday',...
        'Thursday','Friday'});
catch
end


if success(4)==1
    fprintf(fid, '4) IntToDayOfWeek is working!\n');
else
    fprintf(fid, '4) IntToDayOfWeek tests are incorrect  *********************** !\n');
end  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 5)

[T,s]=TestCases();
v=1;

try
    for i=1:14
        m=size(T{i},2);
        for j=1:m
            v_hold=(ComputeDayOfWeek(T{i}(j),1,1)==s(i));
            v=v*v_hold;
            if ~v_hold
                fprintf(fid,num2str(T{i}(j)));
                fprintf(fid,' failed the Jan 1 test.\n');
            end
            
        end
    end
    
    
catch
    v=0;
end

success(5)=v;

if success(5)==1
    fprintf(fid, '5) Jan 1 tests passed\n');
else
    fprintf(fid, '5) Jan 1 tests failed *********************** !\n');
end  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 6)

[T,s]=TestCases();
v=1;

try
    for i=1:14
        m=size(T{i},2);
        for j=2:m
            for month=1:12
                for date2=1:28
                    v_hold=(ComputeDayOfWeek(T{i}(j),month,date2)==ComputeDayOfWeek(T{i}(1),month,date2));
                    v=v*v_hold;
                    if ~v_hold
                        fprintf(fid,num2str(T{i}(j)));
                        fprintf(fid,' failed the similar years test, part one.\n');
                    end
                end
            end
            
        end
    end
    
    
catch
    v=0;
end


try
    for i=1:14
        m=size(T{i},2);
        for j=2:m
            for month=1:12
                for date2=1:31
                    v_hold=(IsValidDate(T{i}(j),month,date2)==IsValidDate(T{i}(1),month,date2));
                    v=v*v_hold;
                    if ~v_hold
                        fprintf(fid,num2str(T{i}(j)));
                        fprintf(fid,' failed the similar years test, part two.\n');
                    end
                end
            end
            
        end
    end
catch
    v=0;
end

success(6)=v;

if success(6)==1
    fprintf(fid, '6) Similar years tests passed\n');
else
    fprintf(fid, '6) Similar years tests failed *********************** !\n');
end  







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
if sum(success(1:end))==13
    fprintf(fid, 'Your calculations looks great! After the GUI works, \nzip up your routines and turn it all in on Blackboard! \n');
end


 fclose(fid);


disp(['See ''WorkingReport...ProjectEAS105F2011.txt'' for results! '])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

