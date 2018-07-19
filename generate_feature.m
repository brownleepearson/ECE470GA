function out = generate_feature(Uq)
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