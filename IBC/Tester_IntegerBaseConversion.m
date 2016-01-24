function Tester_IntegerBaseConversion ()

%May 2010
%Donna Dietz
%CIS Univeristy of Pennsylvania

%%To test EAS105 IntegerBaseConversion Project

success=zeros(1,8); %zeros(1,n) where n is number of tests to run

fid=fopen('WorkingReportIntegerBaseConversionProjectEAS105F2010.txt','wt');
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
fprintf(fid, 'Dear Student:  This is a ''working report'' for the Integer Base Conversion Project. ');
fprintf(fid, '\n \n');
fprintf(fid, 'Please let me know promptly if you find a bug in this Tester Code. \n');
fprintf(fid, '\n \n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1) ConvertVectorBaseToBaseTen


answ=-10;
answ2=10;

try
    answ=ConvertVectorBaseToBaseTen([15 14 10 2 0],16);
    answ2=ConvertVectorBaseToBaseTen([1 3 4 2 0],5);
catch
end


if  size(answ,2)==7 && size(answ2,2)==4 && ...
    sum(answ==[1 0 4 2 9 7 6])==7 && sum(answ2==[1 1 1 0])==4
   fprintf(fid, '1) ConvertVectorBaseToBaseTen seems to work fine!\n');
   success(1)=1;
else
   fprintf(fid, '1) You need to work on ConvertVectorBaseToBaseTen.*****************\n');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 2) ConvertVectorBaseTenToBase


answ=-10;
answ2=10;

try
    answ=ConvertVectorBaseTenToBase([3 4 6 9 2 1 0],16);
    answ2=ConvertVectorBaseTenToBase([1 3 4 2 0],5);
catch
end


if  size(answ,2)==6 && size(answ2,2)==6 && ...
    sum(answ==[3 4 14 15 9 10])==6 && sum(answ2==[4 1 2 1 4 0])==6
   fprintf(fid, '2) ConvertVectorBaseTenToBase seems to work fine!\n');
   success(2)=1;
else
   fprintf(fid, '2) You need to work on ConvertVectorBaseTenToBase.*****************\n');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3) ConvertVectorBaseAToBaseB


answ=-10;
answ2=10;

try
    answ=ConvertVectorBaseAToBaseB([13 24 16 29 22 11 10],36,57);
    answ2=ConvertVectorBaseAToBaseB([1 3 4 2 0],5,11);
catch
end


if  size(answ,2)==6 && size(answ2,2)==3 && ...
    sum(answ==[49    27    52    18    53    31])==6 && ...
    sum(answ2==[9 1 10])==3
   fprintf(fid, '3) ConvertVectorBaseAToBaseB seems to work fine!\n');
   success(3)=1;
else
   fprintf(fid, '3) You need to work on ConvertVectorBaseAToBaseB.*****************\n');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 4) QuickShortenVectorBaseAToBaseB, QuickLengthenVectorBaseAToBaseB
%    by way of converting and reconverting and comparing equality


M1 =floor(rand(7,7)*81);
M2 =zeros(7,7);
for i=1:7
hold=QuickShortenVectorBaseAToBaseB(QuickLengthenVectorBaseAToBaseB(M1(i,:),81,3),3,81);    
   if size(hold,2)==7
       M2(i,:)=hold;
   end
end

M3=floor(rand(8,8)*5);
M4=zeros(8,8);
for i=1:8
hold=QuickLengthenVectorBaseAToBaseB(QuickShortenVectorBaseAToBaseB(M3(i,:),5,625),625,5);    
   if size(hold,2)==8
       M4(i,:)=hold;
   end
end

if sum(sum(M1==M2))==49 && sum(sum(M3==M4))==64
   fprintf(fid, '4) QuickShortenVectorBaseAToBaseB and QuickLengthenVectorBaseAToBaseB both seem to work fine!\n');
   success(4)=1;
else
   fprintf(fid, '4) You need to work on QuickShortenVectorBaseAToBaseB and/or QuickLengthenVectorBaseAToBaseB .*****************\n');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5) QuickConvertVectorBaseAToBaseB, same results as before
%    by way of converting and reconverting and comparing equality

%M1=floor(rand(7,7)*81);
M2=zeros(7,7);
for i=1:7
hold=QuickConvertVectorBaseAToBaseB(QuickConvertVectorBaseAToBaseB(M1(i,:),81,3),3,81);    
   if size(hold,2)==7
       M2(i,:)=hold;
   end
end

%M3=floor(rand(8,8)*5);
M4=zeros(8,8);
for i=1:8
hold=QuickConvertVectorBaseAToBaseB(QuickConvertVectorBaseAToBaseB(M3(i,:),5,625),625,5);    
   if size(hold,2)==8
       M4(i,:)=hold;
   end
end

if sum(sum(M1==M2))==49 && sum(sum(M3==M4))==64
   fprintf(fid, '5) QuickConvertVectorBaseAToBaseB both seem to work fine!\n');
   success(5)=1;
else
   fprintf(fid, '5) You need to work on QuickConvertVectorBaseAToBaseB.*****************\n');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6) Speed Test!
%    by way of converting and reconverting and comparing equality while
%    timing

%M1=floor(rand(7,7)*81);
tic;
M2=zeros(7,7);
for i=1:7
hold=QuickConvertVectorBaseAToBaseB(QuickConvertVectorBaseAToBaseB(M1(i,:),81,3),3,81);    
   if size(hold,2)==7
       M2(i,:)=hold;
   end
end
quick_time=toc;

%M1=floor(rand(7,7)*81);
tic;
M2=zeros(7,7);
for i=1:7
hold=ConvertVectorBaseAToBaseB(ConvertVectorBaseAToBaseB(M1(i,:),81,3),3,81);    
   if size(hold,2)==7
       M2(i,:)=hold;
   end
end
regular_time=toc;


if quick_time < regular_time
   fprintf(fid, '6) Your Quick routines are surely faster! %f < %f \n',quick_time, regular_time);
   success(6)=1;
else
   fprintf(fid, '6) Your Quick routines are NOT faster than your other ones.*****************\n');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Make suggestions for what to do next!

fprintf(fid, '\n \n');

%Tasks which have no prerequisites
if success(1)==0
    fprintf(fid, 'You should start to work on ConvertVectorBaseToBaseTen, which has no prerequisites!\n');
end

if success(2)==0
    fprintf(fid, 'You could start to work on ConvertVectorBaseTenToBase, which has no prerequisites!\n');
end




% %If student has completed tasks without prerequisites, then suggest tasks based on current
% %progress.
% 

if sum(success(1:3)==[1 1 0])==3
   fprintf(fid, 'You could start to work on ConvertVectorBaseAToBaseB. \n');
end

if sum(success(1:4)==[1 1 1 0])==4
   fprintf(fid, 'You should use your ConvertVector routines to help you debug your Quick routines. Their outputs should be the same. \n');
end

if sum(success(1:5)==[1 1 1 1 0])==5
   fprintf(fid, 'Fixing QuickConvert should be easy. Your QuickShorten and QuickLengthen work! \n');
end


if success(6)==1
   fprintf(fid, 'Note: Whoever grades your project will check to see that your Quick routines actually implement the fast algorithm given in class. \n'); 
end

if sum(success(1:6)==[1 1 1 1 1 0])==6
   fprintf(fid, 'Your Quick routines should actually be faster. This Tester tests for this. Do not divert calculations to Quick routines if that''s what you''re doing. \n'); 
end

% if sum(success(1:3))==3
%     fprintf(fid, 'Everything looks great! Zip up your three routines and turn it all in on Blackboard! \n');
% end
% 

fclose(fid);


disp(['See ''WorkingReportIntegerBaseConversionProjectEAS105F2010.txt'' for results! '])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

