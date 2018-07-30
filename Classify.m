function  Classify(U,mu)
load('Te28.mat')
load('Lte28.mat')
error = 0;
N=10000;

for j=1:N
    X = Te28(:,j);
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
    if index ~= Lte28(j,1)
        error = error +1;
    end
end

error_rate = error/N*100 %We need this to be in a vector
