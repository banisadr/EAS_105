function Tester_IVP()

%May 2010
%Donna Dietz
%CIS Univeristy of Pennsylvania

%To test EAS105 IVP Project

success=zeros(1,10); %zeros(1,n) where n is number of routines to test

fid=fopen('WorkingReportIVPProjectEAS105F2011.txt','wt');
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
fprintf(fid, 'Dear Student:  This is a ''working report'' for the IVP Project. ');
fprintf(fid, '\n \n');
fprintf(fid, 'Please let me know promptly if you find a bug in this Tester Code. \n');
fprintf(fid, '\n \n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1) Initializing test functions


c=0;
try

    c=TestFunctionList();
    load Tester_IVP_key;
    success(1)=1;
    fid=myfileis;
    
catch
end
 



if ~isequal(size(c),[1 12]) || success(1)==0
    fprintf(fid,'You need to have the files TestFunctionList.m and Tester_IVP_key.mat in this directory for this to work!\n');


    fclose(fid);
    disp(['See ''WorkingReportIVPProjectEAS105F2011.txt'' for results! '])

    return
end




if success(1)==1
    

    fprintf(fid, '1) You seem to have the necessary files to work on this!\n');
end  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Try to do all the routines on all the examples if the sizes are
% correct

n=size(c,2);

for i=1:n

   Eu_s{i}=Euler(c{i}{1},c{i}{2},c{i}{3});
   He_s{i}=Heun(c{i}{1},c{i}{2},c{i}{3});
   Me_s{i}=ModifiedEuler(c{i}{1},c{i}{2},c{i}{3});
   Md_s{i}=Midpoint(c{i}{1},c{i}{2},c{i}{3});
   RKtest_s{i}=RK4(c{i}{1},c{i}{2},c{i}{3});

end

%save Tester_IVP_key

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2) Report on examples

fprintf(fid,'2) Here is a list of all examples which have worked correctly.\n');
tally=0;

for i=1:n
    
    try
        a1=CompareMatrices(Eu_s{i} , Eu{i}, 0.0001);
        if a1
            fprintf(fid,'In example %d Euler produces correct values.\n',i);
            tally=tally+1;
        end
        
        
    catch
    end
    
    try
        a1=CompareMatrices(He_s{i} , He{i}, 0.0001);
        if a1
            fprintf(fid,'In example %d Heun produces correct values.\n',i);
            tally=tally+1;
        end
        
        
    catch
    end
    
    try
        a1=CompareMatrices(Me_s{i} , Me{i}, 0.0001);
        if a1
            fprintf(fid,'In example %d ModifiedEuler produces correct values.\n',i);
            tally=tally+1;
        end
        
        
    catch
    end
    
    try
        a1=CompareMatrices(Md_s{i} , Md{i}, 0.0001);
        if a1
            fprintf(fid,'In example %d Midpoint produces correct values.\n',i);
            tally=tally+1;
        end
        
        
    catch
    end
    
    try
        a1=CompareMatrices(RKtest_s{i} , RKtest{i}, 0.0001);
        if a1
            fprintf(fid,'In example %d RK4 produces correct values.\n',i);
            tally=tally+1;
        end
        
        
    catch
    end
    
    
    

 end %for i=1:n


fprintf(fid, 'Your tally of correct results is %d out of 60.\n\n',tally);


if tally>57
    success(2)=1; 
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3) 
PlotTests(c);
disp('Are the plots nice?  They must have legends, for example. Don''t close them!!!');
success(3)=input('Answer 1 for yes, and 0 for no: ');
if success(3)==1;
    fprintf(fid, '3) You seem to have nice plots with legends!\n');
else
    fprintf(fid, '3) You need to have nice plots with legends!***********************\n');
end 

quant=gcf;
for ii=1:quant
close;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Make suggestions for what to do next!

fprintf(fid, '\n \n');

%Tasks which have no prerequisites
if success(1)==0
    fprintf(fid, 'You should collect appropriate files!\n');
end

if success(2)==0
    fprintf(fid, 'You should work on the procedures which are not giving correct results. \n');
end


if success(2)==1 && tally < 57
    fprintf(fid,'You are so close on those routines! You only have a few bugs left! \n');
end


if success(2)==1 && success(3)==0 && tally < 57
  fprintf(fid, 'Your numerical results are mostly right, you can work on the plots now.\n');
end

if success(2)==1 && success(3)==0 && tally == 60
  fprintf(fid, 'Your numerical results are perfect, you can work on the plots now.\n');
end


%If student has completed tasks without prerequisites, then suggest tasks based on current
%progress.




if sum(success(1:3))==3 && tally==60
    fprintf(fid, 'Everything looks great! Zip up your  routines and turn it all in on Blackboard! \n');
end


 fclose(fid);


disp(['See ''WorkingReportIVPProjectEAS105F2011.txt'' for results! '])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end



function [ boo ] = CompareMatrices( c1, c2, tol )
%
boo=false;

c1sz=size(c1);
c2sz=size(c2);
if ~isequal(c1sz,c2sz)
    boo=false;
    return
end

for i = 1:numel(c1)
    
       if  max(max(abs(c1(i)-c2(i)))) > tol
           boo=false;
           return
       end
        
end



boo=true;

end
