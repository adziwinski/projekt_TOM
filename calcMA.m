function [ rozwiazanie,blad,iteracje,lambdaVector] = calcMA( A,G,errorSize, maxAmountOfInterations, startPoint,  lambdaInitValue,lambdaDivideCoeff)  
    
    if (size(A,2) == 2) 
        F1 = [startPoint(1); startPoint(2)]; 
    elseif (size(A,2) == 3)
        F1 = [startPoint(1); startPoint(2); startPoint(3)];
    end

    lambda = lambdaInitValue;
    lambdaVector(1) = lambda;
    k=1;
    tempBlad = G - (A * F1);
    blad=1;
    blad(1) = sum(abs(tempBlad).^2)^(1/2);
    rozwiazanie(k,:) = F1;
    k=k+1;
    m=2;
    while blad(k-1)>errorSize && k<maxAmountOfInterations
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
        lambdaVector(m) = lambda;
        m=m+1;
    end
    iteracje = 1:k-1;
    iteracje = iteracje -1;
end

