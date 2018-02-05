function [rozwiazanie,blad,iteracje,lambdaVector] = calcAA( A,G,errorSize, maxAmountOfInterations, lambdaInitValue, lambdaDivideCoeff) 

    F1 = [1.5; 1.5];
    lambda = lambdaInitValue;
    lambdaVector = 0;
    i=1;
    k=1;
    blad=1;
    rozwiazanie(k,:) = F1;
    tempBlad = G - (A * F1);
    blad(1) = sum(abs(tempBlad).^2)^(1/2);
    k=k+1;
    while blad(i)>errorSize && i<maxAmountOfInterations
        for j=1:size(A,1)
            f1_1 = F1 + (lambda * ((G(j,:) - (A(j,:)) * F1) / (A(j,:) * A(j,:)')) * A(j,:)');
            tempBlad(j) = G(j) - (A(j,:) * F1);
            F1 = f1_1;
            rozwiazanie(k,:) = F1;
            k=k+1;
        end
        i=i+1;
        blad(i) = sum(abs(tempBlad).^2)^(1/2);
        lambdaVector(i) = lambda;
        lambda = lambda/lambdaDivideCoeff;
        
    end
    iteracje = 1:i;
    iteracje = iteracje - 1;
end
