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
        for j=1:1:size(A,1)
%             f2_1 = F1(j,1) * (G(j,1) / (A(j,:) * F1)) ^ lambda;
            f2_1 = F1 * (G(j) / (A(j,:) * F1)) ^ lambda;
            tempBlad(j) = G(j,1) - (A(j,:) * F1);
            F1 = f2_1;
        end   
        rozwiazanie(k,:) = F1;
        blad(k) = sum(abs(tempBlad).^2)^(1/2);
        k=k+1;
        
        lambda = lambda/lambdaDivideCoeff;
    end
    iteracje = 1:k-1;
    iteracje = iteracje -1;
end

