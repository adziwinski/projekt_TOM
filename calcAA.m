function [rozwiazanie,blad,iteracje,lambdaVector] = calcAA( A,G,errorSize, maxAmountOfInterations, startPoint,  lambdaInitValue,lambdaDivideCoeff) 

    if (size(A,2) == 2) 
        F1 = [startPoint(1); startPoint(2)]; 
    elseif (size(A,2) == 3)
        F1 = [startPoint(1); startPoint(2); startPoint(3)];
    end
        
    i=1;
    k=1;
    lambda = lambdaInitValue;
    lambdaVector(i) = lambda;
    rozwiazanie(k,:) = F1;
    tempBlad = G - (A * F1);
    blad(k) = sum(abs(tempBlad).^2)^(1/2);
    k=k+1;
    while blad(k-1)>errorSize && k<=maxAmountOfInterations
        for j=1:size(A,1)
            f1_1 = F1 + (lambda * ((G(j,:) - (A(j,:)) * F1) / (A(j,:) * A(j,:)')) * A(j,:)');
            F1 = f1_1;
            tempBlad = G - (A * F1);
            rozwiazanie(k,:) = F1;
            blad(k) = sum(abs(tempBlad).^2)^(1/2);
            k=k+1;
        end
        i=i+1;
        lambda = lambda/lambdaDivideCoeff;
        lambdaVector(i,1) = lambda;
    end
    iteracje = 1:k-1;
    iteracje = iteracje - 1;
end
