function [rozwiazanie,blad,iteracje] = calculateAA22( A,G,errorSize )

    F1 = [1.5; 1.5];
    lambda = 1;
    i=1;
    k=1;
    blad(i) = 0;
    rozwiazanie(k,:) = F1;
    tempBlad = G - (A * F1);
    blad(1) = sqrt((tempBlad(1)).^2 + (tempBlad(2)).^2);
    k=k+1;
    %while blad(i)>errorSize
    while k<10
        for j=1:size(F1,1)
            f1_1 = F1 + (lambda * ((G(j,:) - (A(j,:)) * F1) / (A(j,:) * A(j,:)')) * A(j,:)');
            F1 = f1_1;
            rozwiazanie(k,:) = F1;
            tempBlad(k,:) = G(j) - (A(j,:) * F1);
            %F1 = f1_1;
            k=k+1;
        end
        blad(i) = sqrt((tempBlad(1)).^2 + (tempBlad(2)).^2);
        i=i+1;
    end
    iteracje = 1:2:k;
    iteracje = iteracje - 1;
end


% F1 = [1.5; 1.5];
%     lambda = 1;
%     error = 1;
%     rozwiazanie(1,:) = F1;
%     tempBlad = (G - (A * F1))';
%     k=2;
%     while error>errorSize
%         for j=1:1:size(F1)
%             f1_1 = F1 + (lambda * ((G(j,:) - (A(j,:)) * F1) / (A(j,:) * A(j,:)')) * A(j,:)');
%             tempBlad(k-1,j) = G(j) - (A(j,:) * F1);
%             F1 = f1_1;
%             rozwiazanie(k,:) = F1;
%             error = tempBlad(k-1,j);
%             k=k+1;
%             
%         end
%     end
%     tempBlad(k-1,j-1) = G(j-1) - (A(j-1,:) * F1);
%     iteracje = 1:k-1;
%     iteracje = iteracje - 1;
%     blad = sqrt((tempBlad(:,1)).^2+ (tempBlad(:,2)).^2);
