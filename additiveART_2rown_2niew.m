function [ ] = additiveART_2rown_2niew( A,G,F,x,errorSize)

    y = calc2(A,G,x);
    
    [rozwiazanie,blad,iteracje] = calculateAA22( A,G,errorSize );
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
     plot(rozwiazanie(:,1),rozwiazanie(:,2), 'ko--');
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
     grid minor
     text(1,1,'  Punkt startowy (1, 1)','HorizontalAlignment', 'left');
     
    subplot(1,2,2)
    semilogy(iteracje, abs(blad), 'x-.');
     axis('square')
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i')
     ylabel('b³¹d')
     grid minor


     text(-0.2,1.2, 'Algorytm additive ART', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
end

