function [ rozwiazanie,blad,iteracje ] = calculateMA22( A,G, errorSize)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
    F1 = [1.5; 1.5];
    p = 0.8;
    i=1;
    k=1;
    %tempBlad = [0; 0];
    tempBlad = G - (A * F1);
    blad(1) = sqrt((tempBlad(1)).^2 + (tempBlad(2)).^2);
    rozwiazanie(k,:) = F1;

    %error = 1;
    k=k+1;
    %while error>errorSize
    while blad(k-1)>errorSize
        for j=1:1:size(F1,1)
            f2_1 = F1(j,1) * (G(j,1) / (A(j,:) * F1)) ^ p;
            tempBlad(j) = G(j,1) - (A(j,:) * F1);
            F1(j,1) = f2_1;
        end
        %error = tempBlad(j);    
        rozwiazanie(k,:) = F1;
        blad(k) = sqrt((tempBlad(1)).^2+ (tempBlad(2)).^2);
        k=k+1;
    end
    %i=i+1;
    %bald(i) = sqrt((tempBlad(1)).^2+ (tempBlad(2)).^2);
    iteracje = 1:k-1;
    iteracje = iteracje -1;
end

