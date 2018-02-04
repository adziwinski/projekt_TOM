function [ ] = multiplicativeART_2rown_2niew(A,G,x, errorSize)

    y = calc2(A,G,x);

    [ rozwiazanie,blad,iteracje ] = calcMA( A,G, errorSize,100, 0.4, 1);
    % Rysowanie wykresu
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Algorytm Multiplicative ART','pos',windowSize);

    subplot(1,2,1)
     plot(x, y(1,:),'b');
     hold on;
     plot(x, y(2,:), 'r');
     plot(rozwiazanie(:,1),rozwiazanie(:,2), 'ko--');
     hold off;
     axis('square')
     axis([1.2 1.9 1.4 2.1 ])
     set(0, 'defaultTextFontSize',10);
     text(1.5,1.5,'Punkt startowy (1,5, 1,5)  ','HorizontalAlignment', 'right')
     T = {'Interpretacja graficzna'};
     title(T)
     xlabel('x')
     ylabel('y')
     grid on
     grid minor

    subplot(1,2,2)
     semilogy(iteracje, abs(blad), 'x-.');
     axis('square')
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid on
     grid minor

     text(-0.2,1.2, 'Algorytm multiplicative ART (lambda sta³a)', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');




    [ rozwiazanie,blad,iteracje ] = lambdaMA22( A,G, errorSize);
    % Rysowanie wykresu
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Algorytm Multiplicative ART','pos',windowSize);

    subplot(1,2,1)
     plot(x, y(1,:),'b');
     hold on;
     plot(x, y(2,:), 'r');
     plot(rozwiazanie(:,1),rozwiazanie(:,2), 'ko--');
     hold off;
     axis('square')
     axis([1.2 1.9 1.4 2.1 ])
     set(0, 'defaultTextFontSize',10);
     text(1.5,1.5,'Punkt startowy (1,5, 1,5)  ','HorizontalAlignment', 'right')
     T = {'Interpretacja graficzna'};
     title(T)
     xlabel('x')
     ylabel('y')
     grid on
     grid minor

    subplot(1,2,2)
     semilogy(iteracje, abs(blad), 'x-.');
     axis('square')
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid on
     grid minor

     text(-0.2,1.2, 'Algorytm multiplicative ART (lambda zmienna)', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
end

