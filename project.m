
clear all
load('X1200.mat')
fea_library=cell(1,10);%init the container for feature vector
mu=cell(1,10);%calculate mean of the training data
data_test=[];
data_ans=[];
m=1200;%m is the size of each class in the training data
n=200; %n determine the size of the feature vector(784 by n)
error_matrix=zeros(10,10);

for i=1:10
   x = X1200(:,m*(i-1)+1:m*i-400);
   test = X1200(:,(m*i-400)+1:m*i);
   data_test = [data_test,test];
   data_ans = [data_ans;i*ones(400,1)-1];
   avg = mean(x,2);
   Xh = x-avg;
   C= Xh*Xh';
   [u,~] = eigs(C,n);
   fea_library{i}= u;             
   mu{i} = avg;
end
population = gen_population;  %create a population 

for j=1:10
    individual= population{j};
    feature = gen_feature(fea_library,individual);
    error_matrix(j,:) = Classify(feature,mu,data_test,data_ans);
end

% t0=cputime;
%Classify(U,mu);
% t1 = cputime-t0

fitness(A,error_rate);

