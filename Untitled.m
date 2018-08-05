    original = sum(error_matrix(:))/100

    individual= parents{1};
    feature = gen_feature(fea_library,individual);
    aaa = round(Classify(feature,mu,data_test,data_ans));
    p0 = sum(aaa(:))/10
    
    individual= parents{2};
    feature = gen_feature(fea_library,individual);
    bbb = round(Classify(feature,mu,data_test,data_ans));
     p1 = sum(bbb(:))/10
