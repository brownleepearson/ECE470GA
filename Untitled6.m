for n=60:80
    for j=1:10  %this loop classify the population to find error rate
    individual= population{j};
    feature = gen_feature(fea_library,individual);
    error_matrix(j,:) = Classify(feature,mu,data_test,data_ans);
    end

    error_perGen{n} = round(error_matrix);
    fitness_matrix = fitness(population,error_matrix);
    population = selection(fitness_matrix,population,0.1);
    error_matrix=zeros(10,10);

end

for i=60:80
    a = error_perGen{i};
    for j=1:10
    indv_error(j) = sum(a(j,:))/10;
    end
    aaa(i) = min(indv_error);
end
plot(aaa)