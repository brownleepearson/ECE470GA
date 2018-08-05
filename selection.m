function out = selection(fitness_matrix,population,mutation_rate)
p0=[];        %first parent after selection 
p1=[];        %second parent after selection 
second_best = zeros(1,10);
population2 = cell(1,10);
[~,best_indv] = max(fitness_matrix); % find which individual have best performance on which digit

for i=1:10                      %first parent
    indv = best_indv(i);        %locate the individual 
    digit = i;                  %locate which digit is the individual good at, starting from digit 0
    temp = population{indv};
    p0 =[p0, temp(:,digit)];    %get the feature for best performing digit k, k=1~10
end

for j=1:10                                          %second parent
    error_per_d = fitness_matrix(:,j);                %locate the individual which gives 2nd smallest error
    rearranged = sort(error_per_d);                 %locate the individual which gives 2nd smallest error
    [indv0,~] = find(error_per_d == rearranged(9)); %locate the individual which gives 2nd smallest error
    digit = j;                                      %locate the digit
    temp = population{indv0};
    p1 =[p1, temp(:,digit)];    %get the feature for best performing digit k, k=1~10
    second_best(j)=indv0(1);    %if there two identical second smallest, just get one and igore the other
end

%Crossover
for p=1:10                  %loop to generate 10 new individual 
    new = zeros(200,10);
    for y=1:10                %loop through column 1 to 10
        for x=1:200           %loop through every element under the column        
            if randi(2,1) == 1      %randomly select a parent
            new(x,y) =  p0(x,y);    
            else                    
            new(x,y) =  p1(x,y);    
            end
        end                   %finsih all the elements under the column
    end                       %finsih all the columns
    population2{p} = new;
end


%Mutation
num_mutation = mutation_rate*2000;   %decides how many mutation we gonna do
for k=1:10                          %loop through 10 individuals
    indv_mut =  population2{k};     %get the indv out for mutation
    for l=1:num_mutation            %loop to do a certain number of mutaion per indv
        index0 = randi(200,1);
        index1 = randi(10,1);
        if indv_mut(index0,index1)==1    %mutate '1' to '0', and '0' to '1'
            indv_mut(index0,index1)=0;
        else 
            indv_mut(index0,index1)=1;
        end
    end                             %end of the mutation for an individual
    population2{k} = indv_mut;      %push the mutated indv back to population
end                                 %end of the mutation for the population

out = population2;

end


