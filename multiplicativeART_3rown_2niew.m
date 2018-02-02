function [ ] = multiplicativeART_3rown_2niew(A,G,F,x, errorSize)

    y = calc2(A,G,x);

    [ rozwiazanie,blad,iteracje ] = calcMA( A,G, errorSize,30, 1, 1);
    [rozwiazanie_l,blad_l,iteracje_l] = calcMA( A,G,errorSize, 30, 1.5, 1.1);
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
     plot(x, y(3,:), 'c');
     plot(rozwiazanie(:,1),rozwiazanie(:,2), 'k--');
     plot(rozwiazanie_l(:,1),rozwiazanie_l(:,2), 'm--');
     hold off;
     axis('square')
     axis([0.9 2 0.9 2]);
     set(0, 'defaultTextFontSize',10);
     text(1.5,1.5,'Punkt startowy (1,5, 1,5)  ','HorizontalAlignment', 'right')
     T = {'Interpretacja graficzna'};
     title(T)
     xlabel('x')
     ylabel('y')
     grid on
     grid minor
     legend('równanie 1', 'równanie 2', 'równanie 3', '\lambda = const', '\lambda zmniejszana w ka¿dej iteracji','Location' , 'southwest')

    subplot(1,2,2)  
     semilogy(iteracje, abs(blad), '-');
     ylim([errorSize 1]);
     hold on;
     semilogy(iteracje_l, abs(blad_l), '-');
     hold off;
     axis('square')
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid on
     grid minor
     legend( '\lambda = const', '\lambda zmniejszana w ka¿dej iteracji', 'Location' , 'southwest');
     text(-0.2,1.2, 'Algorytm multiplicative ART', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
end

