function new = newGeneration( population, fitness_matrix )
%NEWGENERATION Summary of this function goes here
%   Detailed explanation goes here


% SELECTION
%   - Stochastic
%   - Assign weights to each feature vector
%   - The weight can be determined by dividing fitness by sum of fitness
%   - Pick the top vectors at random (taking into account weights)

% iterate all fitness values for each digit, 
% find the largest two fitness values for each digit
% Find index 

% The parents cell takes on the form
%
%   parents = { best digit 1  , best digit 2  , ... , best digit 10  }
%             { 2nd best dgt 1, 2nd best dgt 2, ... , 2nd best dgt 10}
%
%
%
%
%

parents = cell(2,10);

for i = (1:10) %iterates through digits
%iterates down the columns
    
    firstBest = 0;
    secondBest = 0;
    firstIndv = 0;
    secondIndv = 0;

    for j = (1:10) %iterates through individuals
    %iterates down the rows
        
        if fitness_matrix(j,i) >= firstBest
            secondBest=firstBest;
            secondIndv=firstIndv;
            
            firstBest = fitness_matrix(j,i);
            firstIndv = j;
        end  
    end
    
    parent1 = population{firstIndv}; %select best individual
    parent2 = population{secondIndv};
    parents{1,i} = parent1(:,i);
    parents{2,i} = parent2(:,i);
    
end
    

% CROSSOVER
%   - From the selected vectors, use crossover to create offspring
%   - I think you have to have two parents to make a crossover
%   - You only make enough offspring to equal the population size

% MUTATION
%   - Use a mutation function to just randomly change a couple offspring


% NEW GENERATION
%   - Once the above stages are complete, the new generation is complete
%   - Output the population


end

