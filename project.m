
clear all


% This funciton will initialize the first generation and the testing data
[population,fea_library,mu,data_test,data_ans]=initialize();
t0=cputime;

for n=1:20   
    for j=1:10  %this loop classify the population to find error rate
    individual= population{j};
    feature = gen_feature(fea_library,individual);
    error_matrix(j,:) = Classify(feature,mu,data_test,data_ans);
    end

    error_perGen{n} = round(error_matrix);
    fitness_matrix = fitness(population,error_matrix);
    population = selection(fitness_matrix,population,0.2);
    error_matrix=zeros(10,10);

end 

for z=1:5
    temp = error_perGen{z};
    sum(temp(:))/100
end
t1 = cputime-t0


%t0=cputime;
%Classify(U,mu);
%t1 = cputime-t0



