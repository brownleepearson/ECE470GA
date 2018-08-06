function out = gen_population
    % This function generates the population
    % 10 binary encoded vectors are generated for each of the
    % 10 individuals.

    population = cell(1,10);
    index=[];
    for i=1:10 
        for j=1:200
            % 0 has a 60% chance of being chosen
            % 1 has a 40% chance of being chosen
            A = randsample([0 1],10, true, [0.6 0.4]);
           %A = randi([0 1],200,1);
            index = [index; A];
        end
        population{i} = index;
        index=[];
    end
    out = population;
end

