function out = generate_feature(Uq)
% generate the feature vector
% full vector, not just 1 and 0
% the output stored in cell matrix
% out{i} access the indivisual class
% where i is from 1 to 10 represent class 0~9
% each class(0~9) has 90-110 samples
% these 100 ish samples are selected from the 200 largest eigen vectors

  feature = cell(1,10);
  temp=[];
  for j=1:10
    A = randi([0 1],1,200);  
    Uqq = Uq{j};
    for i=1:200
        if A(i)==1
          temp = [temp Uqq(:,i)];    
        end
    end
    feature{j} = temp;
    temp = [];
  end
  out = feature;
end