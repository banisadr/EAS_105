function [ CR ] = MtoCRlist(M)
CR = zeros(size(M,1),2);
CR(:,1) = diag(M);
for i = 1:size(M,1)
    radius = sum(abs(M(i,:)))-abs(M(i,i));
    CR(i,2) = radius;
end
end