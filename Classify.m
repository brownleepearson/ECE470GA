<<<<<<< HEAD
function  Classify(U,mu,n)
load('Te28.mat')
load('Lte28.mat')
error = 0;
N=300;
for j=1:N
    X = Te28(:,j);
    distance = zeros(1,10);
    for k=1:10
        Uq = U(:,n*(k-1)+1:n*k);
        %Uq = U(:,10*(k-1)+1:10*k);
        mean1 = mu(:,k);
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
error_rate = error/N*100
=======
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

error_rate = error/N*100
>>>>>>> 1db4a888c5f07d43fb414eda34a51b135cbbf8d0
