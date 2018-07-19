
clear all
load('X1200.mat')
mu=[];
U=[];
Uq_test=[];
m=1200;
n=10;

for i=1:10
   x = X1200(:,m*(i-1)+1:m*i);
   avg = mean(x,2);
   Xh = x-avg;
   C= Xh*Xh';
   [u,~] = eigs(C,n);
   U = [U u];
   mu = [mu avg];
end

% U has a total of 10*n columns 

for f = 1:10
    for g=1:10
    number = n*(f-1)+1+randperm(n-1,1);
    Uq_test = [Uq_test U(:,number)]; 
    end
end

t0 = cputime;
Classify(U,mu,n);
t1 = cputime -t0

