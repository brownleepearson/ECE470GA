

function [ Fit ] = fitness( feature,error_rate )
% This function is dedicated to assessing the fitness of the feature
% vectors. The function takes in the Feature vector and the error_rate.
% The function outputs a vector of fitness values which correspond to each
% feature vector.

    tempVect = [];

    for i = 1:10
        
        ones = sum(feature(i,:) == 1); %Counts the number of features used
        error = error_rate[i];
        
        tempVect[i] = (1-error)/ones;
        
    
    end
    
    Fit = tempVect; 
end

