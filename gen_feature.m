function out = gen_feature(library,individual)
% library is the feature library
% index is the individual
% generate the feature vector
% the output stored in cell matrix
% out{i} access the indivisual digit
% where i is from 1 to 10 represent digit 0~9
% each digit(0~9) has 90-110 samples
% these 100 ish samples are selected from the 200 largest eigen vectors

  feature = cell(1,10);
  temp=[];
  
  %generate feature vector
  for j=1:10
    A = individual(:,j);  
    Uq = library{j};
    for i=1:200
        if A(i)==1
          temp = [temp Uq(:,i)];    
        end
    end
    feature{j} = temp;
    temp = [];
  end
  out = feature;
  
end
