function  out = Classify(U,mu,test,label)
error = zeros(1,10);
N=size(test,2);
for j=1:N                   %loop going through all the test samples
    X = test(:,j);
    distance = zeros(1,10); %projection distance onto the feature vector space
    for k=1:10
        Uq = U{k};                          %calculate the distance step1
        mean1 = mu{k};                      %calculate the distance step2
        z0 = Uq'*(X-mean1);                 %calculate the distance step3
        z1 = Uq*z0;                         %calculate the distance step4
        distance(k) = norm(X - mean1 - z1); %calculate the distance step5
    end
    [~,index] = min(distance);  %find the minimium distance which indicate the digit
    index = index -1;           %-1 because matlab use 1-10, and we use 0-9
    if index ~= label(j,1)         
        m=floor(j/401)+1;           %find classification error for each digit step1
        error(1,m) = error(1,m) +1; %find classification error for each digit step2
    end
end
error_rate = error/4; % error_rate = (# of error)/(400 samples)*100%
out = error_rate;
end