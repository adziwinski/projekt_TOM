function [ rozwiazanie,blad,iteracje ] = calculateMA22( A,G, errorSize)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
    F1 = [1.5; 1.5];
    p = 1;
    k=1;
    rozwiazanie(k,:) = F1;
    tempBlad = G - (A * F1);
    blad(1) = sqrt((tempBlad(1)).^2 + (tempBlad(2)).^2);
    k=k+1;
    while blad(k-1)>errorSize
        for j=1:1:size(F1,1)
            f2_1 = F1(j,1) * (G(j,1) / (A(j,:) * F1)) ^ p;
            F1(j,1) = f2_1;
            tempBlad(j) = G(j,1) - (A(j,:) * F1);
            %F1(j,1) = f2_1;
        end   
        rozwiazanie(k,:) = F1;
        blad(k) = sqrt((tempBlad(1)).^2+ (tempBlad(2)).^2);
        k=k+1;
    end
    iteracje = 1:k-1;
    iteracje = iteracje - 1;
end

