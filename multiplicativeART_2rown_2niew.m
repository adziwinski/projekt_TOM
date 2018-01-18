function [ ] = multiplicativeART_2rown_2niew(A,G,F,x, errorSize)

    y = calc2(A,G,x);

    [ rozwiazanie,blad,iteracje ] = calculateMA22( A,G, errorSize);
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
     axis([0.9 2 0.9 2])
     set(0, 'defaultTextFontSize',10);
     text(1.5,1.5,'Punkt startowy (1,5, 1,5)  ','HorizontalAlignment', 'right')
     T = {'Interpretacja graficzna'};
     title(T)
     xlabel('x')
     ylabel('y')
     grid on
     grid minor

    subplot(1,2,2)
     semilogy(iteracje, abs(blad(:,1)), 'x-.');
     axis('square')
     title('B��d oszacowania i-tej iteracji');
     xlabel('i')
     ylabel('b��d')
     grid on
     grid minor

     hold on;
     semilogy(iteracje, abs(blad(:,2)), 'rx-.');
     hold off;
     legend('r�wnanie nr 1','r�wnanie nr 2');

     text(-0.2,1.2, 'Algorytm multiplicative ART', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
end

