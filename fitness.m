

function [ Fit_matrix ] = fitness( population, error_matrix )
% This function is dedicated to assessing the fitness of the feature
% vectors. The function takes in the Feature vector and the error_rate.
% The function outputs a vector of fitness values which correspond to each
% feature vector.

% Inputs for this function are "population" matrix, and the "error_matrix"
% The populaiton matrix is an array of matrices and takes the form:
%
%   population = [I1 I2 I3 I4 I5 I6 I7 I8 I9 I10]
%
%   where,
%
%         digit 1        digit 2            digit 10
%   I1  [(1 0 1 ...) , (0 1 1 ...) , ... , (1 1 1 ...)]
%   I2  [(1 0 1 ...) , (0 1 1 ...) , ... , (1 1 1 ...)]
%   I3  [(1 0 1 ...) , (0 1 1 ...) , ... , (1 1 1 ...)]
%   I4  [(1 0 1 ...) , (0 1 1 ...) , ... , (1 1 1 ...)]
%   ...
%   I10 [(1 0 1 ...) , (0 1 1 ...) , ... , (1 1 1 ...)]
%           ^^ each grouping contains 200 random binary values. 
%              these indicate which features are to be used.
%               NOTE: these are columns
%
%   Each submatrix in the array (i.e. I1), takes for form of
%        
%        - Rows    : Feature (1s or 0s)
%        - Columns : Digit 1 -> Digit 10
%
%
% The error matrix takes a form very similar to the population matrix
%
%   error_matrix = [IE1 IE2 IE3 IE4 IE5 IE6 IE7 IE8 IE9 IE10]
%
%   where,
%
%            digit 1         digit 2                digit 10
%   IE1  [(I1digit1Error) , (I1digit2Error) , ... , (I1digit10Error)]
%   IE2  [(I2digit1Error) , (I2digit2Error) , ... , (I2digit10Error)]
%   IE3  [(I3digit1Error) , (I3digit2Error) , ... , (I3digit10Error)]
%   IE4  [(I4digit1Error) , (I4digit2Error) , ... , (I4digit10Error)]
%   ...
%   IE10 [(I10digit1Error) , (I10digit2Error) , ... , (I10digit10Error)]
%
%   The error e


%I need to get fitness values for each of the
Fit = zeros(10,10);

for i = (1:10)
    
    individual = population{i};
    
    for j = (1:10)
        ones = sum(individual(j,:) == 1); 
        % Ones in the jth digit in individual i
        error = error_matrix(j,i);
        % Selects error in digit j for Invidual i,
        
        Fit(j,i) = (1-error)/ones; % Fitness function
            % The fitness function divides the success rate by the
            % number of features (ones) used to acheive it.
            % We want to maximize success and minimize error   
    
    end
    
end

Fit_matrix = Fit;
