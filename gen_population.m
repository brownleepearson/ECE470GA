function out = gen_population

population = cell(1,10);
index=[];
for i=1:10 
    for j=1:10
        A = randi([0 1],200,1);
        index = [index, A];   
    end
    population{i} = index;
    index=[];
end
out = population;
end

