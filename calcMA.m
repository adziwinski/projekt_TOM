function [ rozwiazanie,blad,iteracje ] = calcMA( A,G,errorSize, maxAmountOfIterations, lambdaInitValue, lambdaDivideCoeff) 
    F1 = [1.5; 1.5];
    lambda = lambdaInitValue;
    k=1;
    tempBlad = G - (A * F1);
    blad=1;
    blad(1) = sum(abs(tempBlad).^2)^(1/2);
    rozwiazanie(k,:) = F1;
    k=k+1;
    while blad(k-1)>errorSize && k<maxAmountOfIterations
        for j=1:size(A,1)
            for i=1:size(F1,1)
                f2_1 = F1(i,1) * (G(j) / (A(j,:) * F1)) ^ (lambda*A(j,i));
                F1(i,1) = f2_1;
            end
            tempBlad = G - (A * F1);
            rozwiazanie(k,:) = F1;
            blad(k) = sum(abs(tempBlad).^2)^(1/2);
            k=k+1;
        end   
        lambda = lambda/lambdaDivideCoeff;
    end
    iteracje = 1:k-1;
    iteracje = iteracje -1;
end

