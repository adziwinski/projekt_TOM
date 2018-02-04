function [ ] = additiveART_2rown_2niew( A,G,x,errorSize)

    y = calc2(A,G,x);
    
    [rozwiazanie,blad,iteracje,lambda] = calcAA( A,G,errorSize, 30, 1, 1);
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
     axis([1.1 1.8 1.4 2.1 ])
     T = {'Ortogonalne rzutowanie punktu na proste'; 
     'odpowiadaj¹ce dwóm równaniom';
     'uk³adu z dwiema niewiadomymi'};
     title(T)
     xlabel('x')
     ylabel('y')
     grid minor
     set(0, 'defaultTextFontSize',10);
     text(2,1.5, sprintf('Lambda = %d', lambda))
     legend(sprintf('równanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)), sprintf('równanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)), 'wynik w i-tej iteracji', 'Location' , 'southwest')
     
    subplot(1,2,2)
    semilogy(iteracje, abs(blad(:)), 'x-.');
     axis('square')
     title('B³¹d dla i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid minor
     
     text(-0.2,1.2, 'Algorytm additive ART (const lambda = 1)', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
    
    
    
    [rozwiazanie,blad,iteracje] = lambdaAA22( A,G, errorSize );
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
     axis([1.1 1.8 1.4 2.1 ])
     T = {'Ortogonalne rzutowanie punktu na proste'; 
     'odpowiadaj¹ce dwóm równaniom';
     'uk³adu z dwiema niewiadomymi'};
     title(T)
     xlabel('x')
     ylabel('y')
     grid minor
     legend(sprintf('równanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)), sprintf('równanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)), 'wynik w i-tej iteracji', 'Location' , 'southwest')
     
    subplot(1,2,2)
    semilogy(iteracje, abs(blad(:)), 'x-.');
     axis('square')
     title('B³¹d dla i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid minor

     text(-0.2,1.2, 'Algorytm additive ART (lambda zmniejszana w ka¿dej iteracji)', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
    
    
end

