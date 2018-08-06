%     original = sum(error_matrix(:))/100
% 
%     individual= population2{1};
%     feature = gen_feature(fea_library,individual);
%     aaa = round(Classify(feature,mu,data_test,data_ans));
%     p0 = sum(aaa(:))/10
%     
%     individual= population2{2};
%     feature = gen_feature(fea_library,individual);
%     bbb = round(Classify(feature,mu,data_test,data_ans));
%      p1 = sum(bbb(:))/10

% for z=1:20
%     temp = error_perGen{z};
%     error(z) = sum(temp(:))/100;
% end
% plot(error)

for i=1:25
    a = error_perGen{i};
    for j=1:10
    indv_error(j) = sum(a(j,:))/10;
    end
    aaa(i) = min(indv_error);
end
plot(aaa)