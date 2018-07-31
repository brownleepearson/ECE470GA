
clear all
load('X1200.mat')
feature_library=cell(1,10);%init the container for feature vector
mu=cell(1,10);%calculate mean of the training data
Uq_test=[];
m=1200;%m is the size of each class in the training data
n=200; %n determine the size of the feature vector(784 by n)

for i=1:10
   x = X1200(:,m*(i-1)+1:m*i);
   avg = mean(x,2);
   Xh = x-avg;
   C= Xh*Xh';
   [u,~] = eigs(C,n);
   feature_library{i}= u;             
   mu{i} = avg;
end
population = gen_population;  %create a population 

% t0=cputime;
%Classify(U,mu);
% t1 = cputime-t0

fitness(A,error_rate);

