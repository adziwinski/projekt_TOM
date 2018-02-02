function [rozwiazanie,blad,iteracje] = calculateAA22( A,G,errorSize )

    F1 = [1.5; 1.5];
    lambda = 1;
    k=1;
    rozwiazanie(k,:) = F1;
    tempBlad = G - (A * F1);
    blad(1) = sqrt((tempBlad(1)).^2 + (tempBlad(2)).^2);
    k=k+1;
    while blad(k-1)>errorSize
        for j=1:size(F1,1)
            f1_1 = F1 + (lambda * ((G(j,:) - (A(j,:)) * F1) / (A(j,:) * A(j,:)')) * A(j,:)');
            F1 = f1_1;
            tempBlad = G - (A * F1);
            rozwiazanie(k,:) = F1;
            blad(k) = sqrt((tempBlad(1)).^2 + (tempBlad(2)).^2);
            k=k+1;
        end
    end
    iteracje = 1:k-1;
    iteracje = iteracje - 1;
end