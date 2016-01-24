function [ P ] = BPts( )
P=zeros(2,6);
Q=APts();
P(:,1)=Q(:,1);
P(:,2)=Q(:,3);
P(:,3)=Q(:,5);
P(:,4)=Q(:,2);
P(:,5)=Q(:,4);
P(:,6)=P(:,1);
end
