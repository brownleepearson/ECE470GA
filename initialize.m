function [population,feature_library,mu,data_test,data_ans] = initialize()
% This function is designed to initialize the testing data and create
% the first generation of the genetic algorithm. This function will out
    load('X1200.mat')
    fea_lib=cell(1,10);%init the container for feature vector
    dataMean=cell(1,10);%calculate mean of the training data
    dataTest=[];
    dataAns=[];
    m=1200;%m is the size of each class in the training data
    n=200; %n determine the size of the feature vector(784 by n)
    error_matrix=zeros(10,10);
    error_matrix2 = zeros(10,10);


    for i=1:10
       x = X1200(:,m*(i-1)+1:m*i-400);          %generate training data
       test = X1200(:,(m*i-400)+1:m*i);         %generate test data step1
       dataTest = [dataTest,test];            %Testing Data
       dataAns = [dataAns;i*ones(400,1)-1];   %Label for Test Data
       avg = mean(x,2);     %PCA
       Xh = x-avg;          %PCA
       C= Xh*Xh';           %PCA
       [u,~] = eigs(C,n);   %PCA
       fea_lib{i}= u;   %PCA, Create all features (used later)        
       dataMean{i} = avg;         %PCA, Mean of the dataset (used later)
    end
    population = gen_population;  %create a population 
    feature_library = fea_lib;
    mu = dataMean;
    data_test = dataTest;
    data_ans = dataAns;
end

