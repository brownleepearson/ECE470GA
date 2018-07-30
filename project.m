
clear all
load('X1200.mat')
mu=[];
U=cell(1,10);
mu=cell(1,10);
Uq_test=[];
m=1200;
n=200;

for i=1:10
   x = X1200(:,m*(i-1)+1:m*i);
   avg = mean(x,2);
   Xh = x-avg;
   C= Xh*Xh';
   [u,~] = eigs(C,n);
   U{i}= u;
   mu{i} = avg;
end

A = generate_feature(U);  %create a population 

% t0=cputime;
% Classify(U,mu);
% t1 = cputime-t0

fitness(A,error_rate);

