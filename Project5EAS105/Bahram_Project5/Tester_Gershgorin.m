function Tester_Gershgorin()


%Donna Dietz
%CIS Univeristy of Pennsylvania

%To test EAS105 Gershgorin Project

success=zeros(1,10); %zeros(1,n) where n is number of routines to test

fid=fopen('WorkingReportGershgorinProjectEAS105F2011.txt','wt');
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
fprintf(fid, 'Dear Student:  This is a ''working report'' for the Gershgorin Project. ');
fprintf(fid, '\n \n');
fprintf(fid, 'Please let me know promptly if you find a bug in this Tester Code. \n');
fprintf(fid, '\n \n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1) First M

Mreal= [16.6235    0.2785    0.9572    0.7922    0.6787    0.7060;
    1.3587    3.3556    0.7281    1.4392    1.1366    0.0477;
    0.1270    0.9575   21.6090    0.6557    0.7431    0.2769;
    0.9134    0.9649    0.1419   10.8445    0.3922    0.0462;
    0.3162    0.0788    0.2109    0.4246   13.4642    0.0486;
    0.0975    0.9706    0.9157    0.9340    0.1712    6.6322];

Mcomplex=  [15.1425    0.7655    0.7094    0.1190    0.7513    0.5472;
    0.4756   15.2428    1.1320    0.7475    0.3826    0.2079;
    0.9502    0.1869   12.7237    0.9597    0.5060    0.1493;
    0.0344    0.4898    0.6797    7.7880    0.6991    0.2575;
    0.2194    0.2228    0.3275    0.2926   11.3385    0.4204;
    0.3816    0.6463    0.1626    0.2238    0.9593    4.7019];

M=Mreal+Mcomplex*sqrt(-1);

CRreal = [  16.6235    4.7128;
    3.3556    5.8199;
   21.6090    4.3102;
   10.8445    3.7537;
   13.4642    1.9495;
    6.6322    4.4249];

CRcomplex = [ 15.1425         0;
   15.2428         0;
   12.7237         0;
    7.7880         0;
   11.3385         0;
    4.7019         0];
CR=CRreal+sqrt(-1)*CRcomplex;

try
   CRstudent=MtoCRlist(M);
   if sum(sum(abs(CR-CRstudent)))<0.003
        success(1)=1;
   end
catch
end



if success(1)==1
   fprintf(fid, '1) MtoCRlist seems to work fine!\n');
  
else
   fprintf(fid, '1) You need to work on MtoCRlist.*****************\n');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2) PlotGershgorinCircles

try
    PlotGershgorinCircles(M);
    plotFine=0;
    disp(['Check to see that a plot with circles and points actually appears.']);
    plotFine=input('Enter a 1 if a reasonable plot appeared, otherwise 0: ');
    
    if plotFine==1
        success(2)=1;
    end
    
    if success(2)==1
        fprintf(fid, '2) PlotGershgorinCircles produces plots!\n');
        
    else
        fprintf(fid, '2) Your PlotGershgorinCircles doesn''t produce reasonable plots yet.*****************\n');
    end
    
catch
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3) PlotGershgorinCircles

try
    for i=1:6
       rectangle('position',[real(CR(i,1))-CR(i,2) imag(CR(i,1))-CR(i,2) 2*CR(i,2) 2*CR(i,2)],'curvature',[1,1],'EdgeColor','r'); 
    end
    disp(['Are the circles in the right places?']);
    plotFine=0;
    plotFine=input('Enter a 1 if red circles are on the other ones, otherwise 0: ');
    
    if plotFine==1
        success(3)=1;
    end
    if success(3)==1
        fprintf(fid, '3) PlotGershgorinCircles puts circles in the correct places!\n');
        
    else
        fprintf(fid, '3) Your PlotGershgorinCircles doesn''t put circles in the right places yet.*****************\n');
    end
    
    
    
catch
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4) PlotGershgorinCircles

try
    [v d]=eig(M);
    for i=1:6
       plot(d(i,i),'o','Color','r'); 
    end
    disp(['Are the points in the right places?']);
    plotFine=0;
    plotFine=input('Enter a 1 if red points are on the other ones, otherwise 0: ');
    
    if plotFine==1
        success(4)=1;
    end
    
    quant=gcf;
    for ii=1:quant
    close;
    end
    
    if success(4)==1
        fprintf(fid, '4) PlotGershgorinCircles puts eigenvalues in the correct places!\n');
        
    else
        fprintf(fid, '4) Your PlotGershgorinCircles doesn''t put eigenvalues in the right places yet.*****************\n');
    end
    
catch
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5) PlotGershgorinCirclesOneByOne

try
    PlotGershgorinCirclesOneByOne(M);
    
    success(5)=input('Enter a 1 if 6 plots appeared, otherwise 0: ');
    
    disp(['(I will close the plots for you!!!)']);
    success(6)=input('Enter a 1 if points were inside each of the circles:  ');
    if success(5)==1 && success(6)==1
        fprintf(fid, '5) PlotGershgorinCirclesOneByOne seems to work!\n');
        
    else
        fprintf(fid, '5) Your PlotGershgorinCirclesOneByOne still needs work.*****************\n');
    end
    
    quant=gcf;
    for ii=1:quant
    close;
    end
    
    
catch
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6) PlotCircle
try
 PlotCircle(1+sqrt(-1), 2, 'r');
 axis equal
 success(7)=input('Enter 1 if a red circle of radius 2 at (1,1) showed up. 0 if not: ');
 
    quant=gcf;
    for ii=1:quant
    close;
    end
 
 
 PlotCircle(0, 1, [0.9 0.9 0.9]);
 axis equal
 success(8)=input('Enter 1 if a gray unit circle showed up. 0 if not: ');
 
    quant=gcf;
    for ii=1:quant
    close;
    end
 
 
catch
    
end

    if success(7)==1 && success(8)==1 
        fprintf(fid, '6) PlotCircle seems to work!\n');
        
    else
        fprintf(fid, '6) Your PlotCircle still needs work.*****************\n');
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Make suggestions for what to do next!

fprintf(fid, '\n \n');

%Tasks which have no prerequisites
if success(1)==0
    fprintf(fid, 'You should start to work on MtoCRlist, which has no prerequisites!\n');
end

if success(8)+success(7)<2
    fprintf(fid, 'You should work on PlotCircle.  Recall commands ''real'' and ''imag''. \n');
end


if success(3) + success(4) ==2 && success(5)+success(6)<2
    fprintf(fid,'You have the single plot working but not the multi-plot version of it. Try sorting items! \n');
end


%If student has completed tasks without prerequisites, then suggest tasks based on current
%progress.




if sum(success(1:8))==8
    fprintf(fid, 'Everything looks great! Zip up your  routines and turn it all in on Blackboard! \n');
end


fclose(fid);


disp(['See ''WorkingReportGershgorinProjectEAS105F2011.txt'' for results! '])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
