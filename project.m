
clear all

m = 40; % define how many generation we want
error_matrix = zeros(10,10);
error_perGen = cell(1,m);
feature_used = zeros(1,m);

% This funciton will initialize the first generation and the testing data
[population,fea_library,mu,data_test,data_ans]=initialize();
t0=cputime;

for n=1:m
    n
    for j=1:10  %this loop classify the population to find error rate
    individual= population{j};
    feature = gen_feature(fea_library,individual);
    error_matrix(j,:) = Classify(feature,mu,data_test,data_ans);
    end

    error_perGen{n} = round(error_matrix);
    fitness_matrix = fitness(population,error_matrix);
    [population,feature_used(n)] = selection(fitness_matrix,population,0.5);
    error_matrix=zeros(10,10); 
 
end 

for i=1:m
    a = error_perGen{i};
    for j=1:10
    indv_error(j) = sum(a(j,:))/10;
    end
    aaa(i) = min(indv_error);
end
plot(aaa)

t1 = cputime-t0




%t0=cputime;
%Classify(U,mu);
%t1 = cputime-t0



