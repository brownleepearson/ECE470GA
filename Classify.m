function  out = Classify(U,mu,test,label)
error = zeros(1,10);
N=size(test,2);
for j=1:N
    X = test(:,j);
    distance = zeros(1,10);
    for k=1:10
        Uq = U{k};
        mean1 = mu{k};
        z0 = Uq'*(X-mean1);
        z1 = Uq*z0;
        distance(k) = norm(X - mean1 - z1);
    end
    [~,index] = min(distance);
    index = index -1;
    if index ~= label(j,1)
        m=floor(j/401)+1;
        error(1,m) = error(1,m) +1;
    end
end
error_rate = error/4; %Computes the error rate for the individual
out = error_rate;
end