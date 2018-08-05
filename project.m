
clear all
%load('X1200.mat')
%fea_library=cell(1,10);%init the container for feature vector
%mu=cell(1,10);%calculate mean of the training data
%data_test=[];
%data_ans=[];
%m=1200;%m is the size of each class in the training data
%n=200; %n determine the size of the feature vector(784 by n)
%error_matrix=zeros(10,10);
%error_matrix2 = zeros(10,10);


% for i=1:10
%    x = X1200(:,m*(i-1)+1:m*i-400);          %generate training data
%    test = X1200(:,(m*i-400)+1:m*i);         %generate test data step1
%    data_test = [data_test,test];            %generate test data step2
%    data_ans = [data_ans;i*ones(400,1)-1];   %generate label for test data
%    avg = mean(x,2);     %PCA
%    Xh = x-avg;          %PCA
%    C= Xh*Xh';           %PCA
%    [u,~] = eigs(C,n);   %PCA
%    fea_library{i}= u;   %PCA, create all the features used later        
%    mu{i} = avg;         %PCA
% end
% population = gen_population;  %create a population 

% This funciton will initialize the first generation and the testing data
[population,fea_library,mu,data_test,data_ans]=initialize();

for j=1:10
    individual= population{j};
    feature = gen_feature(fea_library,individual);
    error_matrix(j,:) = Classify(feature,mu,data_test,data_ans);
end

error_matrix = round(error_matrix);

fitness_matrix = fitness(population,error_matrix);
population2 = selection(fitness_matrix,population);

for k=1:10
    individual= population2{k};
    feature = gen_feature(fea_library,individual);
    error_matrix2(k,:) = Classify(feature,mu,data_test,data_ans);
end
error_matrix2 = round(error_matrix2);


%population2 = newGeneration(population, fitness_matrix); 
% disp('')

% t0=cputime;
%Classify(U,mu);
% t1 = cputime-t0



