function [] = compare32(A,G,F,x,errorSize)

    y = calc2(A,G,x);
    FP = pinv(A)*G; 
    
    [rozwiazanieAA,bladAA,iteracjeAA] = calcAA( A,G,errorSize, 30, 1, 1);
    [rozwiazanie_lAA,blad_lAA,iteracje_lAA] = calcAA( A,G,errorSize, 30, 1.5, 1.1);
    [rozwiazanieMA,bladMA,iteracjeMA] = calcMA( A,G, errorSize,100, 0.4, 1);
    [rozwiazanie_lMA,blad_lMA,iteracje_lMA] = calcMA( A,G,errorSize, 100, 0.4, 1.1);
    % Rysowanie wykresu
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Porównianie metod','pos',windowSize);

    subplot(1,2,1)
     plot(x, y(1,:),'b');
     hold on;
     plot(x, y(2,:), 'r');
     plot(x, y(3,:), 'c');
     plot(rozwiazanieAA(:,1),rozwiazanieAA(:,2), 'k--');
     plot(rozwiazanie_lAA(:,1),rozwiazanie_lAA(:,2), 'm--');
     plot(rozwiazanieMA(:,1),rozwiazanieMA(:,2), 'g--');
     plot(rozwiazanie_lMA(:,1),rozwiazanie_lMA(:,2), 'b--');
     plot(F(1,1), F(2,1),'r*');
     plot(FP(1,1), FP(2,1),'co');
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
     legend('równanie 1', 'równanie 2', 'równanie 3', ...
        'Additive ART \lambda = const', ...
        'Additive ART \lambda zmniejszana w ka¿dej iteracji',...
        'Multiplicative ART \lambda = const', ...
        'Multiplicative ART \lambda zmniejszana w ka¿dej iteracji',...
        'Lewe dzielnie',...
        'Pseudoodwrotnoœæ',...
        'Location' , 'southwest')

    subplot(1,2,2)  
     semilogy(iteracjeMA, abs(bladMA), '-');
     ylim([errorSize 1]);
     hold on;
     semilogy(iteracje_lMA, abs(blad_lMA), '-');
     semilogy(iteracjeAA, abs(bladAA(:)), '-');
     semilogy(iteracje_lAA, abs(blad_lAA(:)), '-');
     hold off;
     axis('square')
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid on
     grid minor
     legend( 'Additive ART \lambda = const',...
         'Additive ART \lambda zmniejszana w ka¿dej iteracji',...
         'Multiplicative ART \lambda = const',...
         'Multiplicative ART \lambda zmniejszana w ka¿dej iteracji',...
         'Location' , 'southwest');
     text(-0.2,1.2, 'Trzy równania, dwie niewiadome - Porównie metod', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
end

