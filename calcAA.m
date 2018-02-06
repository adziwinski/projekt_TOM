function [rozwiazanie,blad,iteracje,lambdaVector] = calcAA( A,G,errorSize, maxAmountOfInterations, lambdaInitValue, lambdaDivideCoeff) 

    if (size(A,2) == 2) 
        F1 = [1.5; 1.5]; 
    elseif (size(A,2) == 3)
        F1 = [1.5; 1.5; 1.5];
    end
        
    i=1;
    k=1;
    lambda = lambdaInitValue;
    lambdaVector(i) = lambda;
    blad=1;
    rozwiazanie(k,:) = F1;
    tempBlad = G - (A * F1);
    blad(i) = sum(abs(tempBlad).^2)^(1/2);
    k=k+1;
    while blad(i)>errorSize && i<=maxAmountOfInterations
        for j=1:size(A,1)
            f1_1 = F1 + (lambda * ((G(j,:) - (A(j,:)) * F1) / (A(j,:) * A(j,:)')) * A(j,:)');
            tempBlad(j) = G(j) - (A(j,:) * F1);
            F1 = f1_1;
            rozwiazanie(k,:) = F1;
            k=k+1;
        end
        i=i+1;
        blad(i) = sum(abs(tempBlad).^2)^(1/2);
        lambda = lambda/lambdaDivideCoeff;
        lambdaVector(i,1) = lambda;
    end
    iteracje = 1:i;
    iteracje = iteracje - 1;
end
