function out = selection(error_matrix,population)
p0=[];        %first parent after selection 
p1=[];        %second parent after selection 
[~,best_indv] = min(error_matrix); % find which individual have best performance on which digit

for i=1:10                      %first parent
    indv = best_indv(i);        %locate the individual 
    digit = i;                  %locate which digit is the individual good at, starting from digit 0
    temp = population{indv};
    p0 =[p0, temp(:,digit)];    %get the feature for best performing digit k, k=1~10
end

for j=1:10                                          %second parent
    error_per_d = error_matrix(:,j);                %locate the individual which gives 2nd smallest error
    rearranged = sort(error_per_d);                 %locate the individual which gives 2nd smallest error
    [indv0,~] = find(error_per_d == rearranged(2)); %locate the individual which gives 2nd smallest error
    digit = j;                                      %locate the digit
    temp = population{indv0};
    p1 =[p1, temp(:,digit)];    %get the feature for best performing digit k, k=1~10
end
out = {p0,p1};


%Crossover
% for y=1:10
%     for x=1:200
%         if p0(x,y)== p1(x,y)
%            new(x,y) =  p0(x,y);
%         elseif randi(2,1) == 1
%            new(x,y) =  p0(x,y);
%         else
%            new(x,y) =  p1(x,y); 
%         end
%     end
% end

end


