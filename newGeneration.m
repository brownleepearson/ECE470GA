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


parents = cell(2,10);

for p = (1:10) %iterates through digits
%iterates down the columns
    
    firstBest = 0;
    secondBest = 0;
    firstIndv = 0;
    secondIndv = 0;

    for q = (1:10) %iterates through individuals
    %iterates down the rows
        
        if (fitness_matrix(q,p)) >= firstBest
            secondIndv=firstIndv;
            
            firstBest = fitness_matrix(q,p);
            firstIndv = q;
        end  
    end
    
    p0 = population{firstIndv}; %select best individual
    p1 = population{secondIndv};
    parents{1,p} = p0(:,p);
    parents{2,p} = p1(:,p);
 
end

p0=[];
p1=[];
for i=1:10
    p0 = [p0,parents{1,i}];
    p1 = [p1,parents{2,i}];
end

new = {p0,p1};
    
%Two point ('crossovertwopoint')
% CROSSOVER
%   - From the selected vectors, use crossover to create offspring
% 
%     out = new;
% MUTATION
%   - Use a mutation function to just randomly change a couple offspring


% NEW GENERATION
%   - Once the above stages are complete, the new generation is complete
%   - Output the population


end

