function [ rozwiazanie,blad,iteracje ] = calcMA( A,G,errorSize, maxAmountOfInterations, lambdaInitValue, lambdaDivideCoeff) 
    F1 = [1.5; 1.5];
    labmda = lambdaInitValue;
    k=1;
    tempBlad = G - (A * F1);
    blad=1;
    blad(1) = sum(abs(tempBlad).^2)^(1/2);
    rozwiazanie(k,:) = F1;
    k=k+1;
    while blad(k-1)>errorSize && k<maxAmountOfInterations
        for j=1:1:size(F1,1)
            f2_1 = F1(j,1) * (G(j,1) / (A(j,:) * F1)) ^ labmda;
            tempBlad(j) = G(j,1) - (A(j,:) * F1);
            F1(j,1) = f2_1;
        end   
        rozwiazanie(k,:) = F1;
        blad(k) = sum(abs(tempBlad).^2)^(1/2);
        k=k+1;
        
        labmda = labmda/lambdaDivideCoeff;
    end
    iteracje = 1:k-1;
    iteracje = iteracje -1;
end

