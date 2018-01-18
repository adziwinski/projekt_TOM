function [ ] = additiveART_2rown_2niew( A,G,F,x,errorSize)

    y = calc2(A,G,x);
    F1 = [1; 1];
    lambda = 1;

%     ROZW1(1,:) = F1;
%     blad = 1;
%     i=1;
%     j=1;
%     liczbaIteracji=1;
%     for j=1:size(F1,1)
% %        while blad>errorSize
%            for i=1:5
%             f1_1 = F1 + (lambda * ((G(j) - (A(j,:)) * F1) / (A(j,:) * A(j,:)')) * A(j,:)');
%             blad1(i,j) = G(j,1) - (A(j,:) * F1);
%             F1 = f1_1;
%             ROZW1(i+1,:) = F1;
%             blad = blad1(i,j);
% %             i=i+1;
%        end
%        blad=1;
%        liczbaIteracji(j) = i;
%        i=1;
%     end
%     iteracje(1,:) = 1:liczbaIteracji(1);
%     iteracje(2,:) = 1:liczbaIteracji(2);

        ROZW1(1,:) = F1;
        for i=1:1:5
            for j=1:1:size(F1,1)
                f1_1 = F1 + (lambda * ((G(j) - (A(j,:)) * F1) / (A(j,:) * A(j,:)')) * A(j,:)');
                blad1(i,j) = G(j) - (A(j,:) * F1);
                F1 = f1_1;
                ROZW1(i,:) = F1;
           end
        end
iteracje = 1:i;
    % Rysowanie wykresu
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Algorytm Additive ART','pos',windowSize);

    subplot(1,2,1)
     plot(x, y(1,:),'b');
     hold on;
     plot(x, y(2,:), 'r');
     plot(ROZW1(:,1),ROZW1(:,2), 'ko--');
     hold off;
     axis('square')
     axis([0.9 2 0.9 2])
     set(0, 'defaultTextFontSize',10);
     text(0.9,0.65,'Punkt startowy (1, 1)')
     T = {'Ortogonalne rzutowanie punktu na proste'; 
     'odpowiadaj¹ce dwóm równaniom';
     'uk³adu z dwiema niewiadomymi'};
     title(T)
     xlabel('x')
     ylabel('y')
     grid on
     grid minor

    subplot(1,2,2)
%      semilogy(iteracje(:,1), abs(blad1(:,1)), 'x-.');
    semilogy(iteracje, abs(blad1(:,1)), 'x-.');
     axis('square')
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i')
     ylabel('b³¹d')
     grid on
     grid minor

     hold on;
%      semilogy(iteracje(:,2), abs(blad1(:,2)), 'rx-.');
      semilogy(iteracje, abs(blad1(:,2)), 'rx-.');

     hold off;
     legend('równanie nr 1','równanie nr 2');

     text(-0.2,1.2, 'Algorytm additive ART', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
end

