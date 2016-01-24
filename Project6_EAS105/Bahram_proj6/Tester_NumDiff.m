function Tester_NumDiff()

%May 2010
%Donna Dietz
%CIS Univeristy of Pennsylvania

%To test EAS105 NumDiff Project

success=zeros(1,10); %zeros(1,n) where n is number of routines to test

fid=fopen('WorkingReportNumDiffProjectEAS105.txt','wt');
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
fprintf(fid, 'Dear Student:  This is a ''working report'' for the NumDiff Project. ');
fprintf(fid, '\n \n');
fprintf(fid, 'Please let me know promptly if you find a bug in this Tester Code. \n');
fprintf(fid, '\n \n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1) Initializing test functions


c=0;
try
    c=TestFunctionDiffList();
    load Tester_NumDiff_key;
    success(1)=1;
catch
end
 
if ~isequal(size(c),[1 12]) || success(1)==0
    fprintf(fid,'You need to have the files TestFunctionDiffList.m and Tester_NumDiff_key.mat in this directory for this to work!\n');
    fclose(fid);
    disp(['See ''WorkingReportNumDiffProjectEAS105.txt'' for results! '])

    return
end


if success(1)==1;
    fprintf(fid, '1) You seem to have the necessary files to work on this!\n');
end  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Try to do all the routines on all the examples if the sizes are
% correct

n=size(c,2);

for i=1:n

   try [newT2a_s{i}, N2a_s{i}]=NDiff2A(c{i}{1},c{i}{2}); catch, end;
   try [newT2b_s{i}, N2b_s{i}]=NDiff2B(c{i}{1},c{i}{2}); catch, end;
   try [newT3a_s{i}, N3a_s{i}]=NDiff3A(c{i}{1},c{i}{2}); catch, end;
   try [newT3b_s{i}, N3b_s{i}]=NDiff3B(c{i}{1},c{i}{2}); catch, end;
   try [newT3c_s{i}, N3c_s{i}]=NDiff3C(c{i}{1},c{i}{2}); catch, end;
   
   if size(c{i}{1},1)>=6
       try [newT5a_s{i}, N5a_s{i}]=NDiff5A(c{i}{1},c{i}{2}); catch, end;
       try [newT5b_s{i}, N5b_s{i}]=NDiff5B(c{i}{1},c{i}{2});catch, end;
       try [newT5c_s{i}, N5c_s{i}]=NDiff5C(c{i}{1},c{i}{2});catch, end;
   end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2) Report on examples

fprintf(fid,'2) Here is a list of all examples which have worked correctly.\n');
tally=0;

for i=1:n

    try 
        a1=CompareMatrices(newT2a_s{i} , newT2a{i}, 0.0001);
        if a1
            fprintf(fid,'In example %d NDiff2A produces correct t-values.\n',i);
            tally=tally+1;
        end
        a2=CompareMatrices(N2a_s{i}, N2a{i}, 0.0001); 
        if a2
            fprintf(fid,'In example %d NDiff2A produces correct estimates.\n',i);
            tally=tally+1;
        end
        
    catch
    end
    
    try 
        a1=CompareMatrices(newT2b_s{i} , newT2b{i}, 0.0001);
        if a1
            fprintf(fid,'In example %d NDiff2B produces correct t-values.\n',i);
            tally=tally+1;
        end
        a2=CompareMatrices(N2b_s{i}, N2b{i}, 0.0001); 
        if a2
            fprintf(fid,'In example %d NDiff2B produces correct estimates.\n',i);
            tally=tally+1;
        end
        
    catch
    end
    
    try 
        a1=CompareMatrices(newT3a_s{i} , newT3a{i}, 0.0001);
        if a1
            fprintf(fid,'In example %d NDiff3A produces correct t-values.\n',i);
            tally=tally+1;
        end
        a2=CompareMatrices(N3a_s{i}, N3a{i}, 0.0001); 
        if a2
            fprintf(fid,'In example %d NDiff3A produces correct estimates.\n',i);
            tally=tally+1;
        end
        
    catch
    end

    try 
        a1=CompareMatrices(newT3b_s{i} , newT3b{i}, 0.0001);
        if a1
            fprintf(fid,'In example %d NDiff3B produces correct t-values.\n',i);
            tally=tally+1;
        end
        a2=CompareMatrices(N3b_s{i}, N3b{i}, 0.0001); 
        if a2
            fprintf(fid,'In example %d NDiff3B produces correct estimates.\n',i);
            tally=tally+1;
        end
        
    catch
    end

    
    try 
        a1=CompareMatrices(newT3c_s{i} , newT3c{i}, 0.0001);
        if a1
            fprintf(fid,'In example %d NDiff3C produces correct t-values.\n',i);
            tally=tally+1;
        end
        a2=CompareMatrices(N3c_s{i}, N3c{i}, 0.0001); 
        if a2
            fprintf(fid,'In example %d NDiff3C produces correct estimates.\n',i);
            tally=tally+1;
        end
        
    catch
    end

    
    if size(c{i}{1},1)>=6
        
        try
            a1=CompareMatrices(newT5a_s{i} , newT5a{i}, 0.0001);
            if a1
                fprintf(fid,'In example %d NDiff5A produces correct t-values.\n',i);
                tally=tally+1;
            end
            a2=CompareMatrices(N5a_s{i}, N5a{i}, 0.0001);
            if a2
                fprintf(fid,'In example %d NDiff5A produces correct estimates.\n',i);
                tally=tally+1;
            end
            
        catch
        end
        
        try
            a1=CompareMatrices(newT5b_s{i} , newT5b{i}, 0.0001);
            if a1
                fprintf(fid,'In example %d NDiff5B produces correct t-values.\n',i);
                tally=tally+1;
            end
            a2=CompareMatrices(N5b_s{i}, N5b{i}, 0.0001);
            if a2
                fprintf(fid,'In example %d NDiff5B produces correct estimates.\n',i);
                tally=tally+1;
            end
            
        catch
        end
        
        
        try
            a1=CompareMatrices(newT5c_s{i} , newT5c{i}, 0.0001);
            if a1
                fprintf(fid,'In example %d NDiff5C produces correct t-values.\n',i);
                tally=tally+1;
            end
            a2=CompareMatrices(N5c_s{i}, N5c{i}, 0.0001);
            if a2
                fprintf(fid,'In example %d NDiff5C produces correct estimates.\n',i);
                tally=tally+1;
            end
            
        catch
        end
        
    end
end %for i=1:n


fprintf(fid, 'Your tally of correct results is %d out of 168.\n\n',tally);


if tally>160 
    success(2)=1; 
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3) 
PlotDiffTests(c);
disp('Are the plots nice?  They must have legends, for example. Don''t close them!!!');
success(3)=input('Answer 1 for yes, and 0 for no: ');
if success(3)==1;
    fprintf(fid, '3) You seem to have nice plots with legends!\n');
else
    fprintf(fid, '3) You need to have nice plots with legends!***********************\n');
end 

close;
close;
close;
close;
close;
close;
close;
close;
close;
close;
close;
close;


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


if success(2)==1 && tally < 168
    fprintf(fid,'You are so close on those routines! You only have a few bugs left! \n');
end


if success(2)==1 && success(3)==0 && tally < 168
  fprintf(fid, 'Your numerical results are mostly right, you can work on the plots now.\n');
end

if success(2)==1 && success(3)==0 && tally == 168
  fprintf(fid, 'Your numerical results are perfect, you can work on the plots now.\n');
end


%If student has completed tasks without prerequisites, then suggest tasks based on current
%progress.




if sum(success(1:3))==3 && tally==168
    fprintf(fid, 'Everything looks great! Zip up your  routines and turn it all in on Blackboard! \n');
end


fclose(fid);


disp(['See ''WorkingReportNumDiffProjectEAS105.txt'' for results! '])

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
