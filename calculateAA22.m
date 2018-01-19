
function [rozwiazanie,blad,iteracje] = calculateAA22( A,G,errorSize )

    F1 = [1; 1];
    lambda = 1;
    error = 1;
    i=1;
    rozwiazanie(1,:) = F1;
    tempBlad = [0; 0];
    
    while error>errorSize
        for j=1:1:size(F1,1)
            f1_1 = F1 + (lambda * ((G(j,:) - (A(j,:)) * F1) / (A(j,:) * A(j,:)')) * A(j,:)');
            tempBlad(i,j) = G(j) - (A(j,:) * F1);
            F1 = f1_1;
            rozwiazanie(i+1,:) = F1;
            error = tempBlad(i,j);          
        end
        i=i+1;
    end
    iteracje = 1:i-1;
    blad = sqrt((tempBlad(:,1)).^2+ (tempBlad(:,2)).^2);


end