function [rozwiazanie,blad,iteracje] = lambdaAA22( A,G,errorSize )

    F1 = [1.5; 1.5];
    lambda = 1.5;
    %error = 1;
    i=1;
    k=1;
    rozwiazanie(k,:) = F1;
    tempBlad = G - (A * F1);
    blad(1) = sqrt((tempBlad(1)).^2 + (tempBlad(2)).^2);
    k=k+1;
    %while error>errorSize
    while blad(i)>errorSize
        for j=1:size(F1,1)
            f1_1 = F1 + (lambda * ((G(j,:) - (A(j,:)) * F1) / (A(j,:) * A(j,:)')) * A(j,:)');
            tempBlad(j) = G(j) - (A(j,:) * F1);
            F1 = f1_1;
            rozwiazanie(k,:) = F1;
            %error = abs(tempBlad(j));
            k=k+1;
        end
        i=i+1;
        blad(i) = sqrt((tempBlad(1)).^2 + (tempBlad(2)).^2);
        
        lambda = lambda/1.1;
    end
    iteracje = 1:i;
    iteracje = iteracje - 1;


end
