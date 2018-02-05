function [ ] = compare22( A,G,x, errorSize )
    y = calc2(A,G,x);
    FP = pinv(A)*G; 
    F = A\G;
    
    [ rozwiazanieAA,bladAA,iteracjeAA, ~] = calcAA( A,G,errorSize, 30, 1, 1);
    [ rozwiazanieMA,bladMA,iteracjeMA, ~] = calcMA( A,G, errorSize,100, 0.4, 1);
    
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Porownanie metod','pos',windowSize);

    subplot(1,2,1)
     plot(x, y(1,:),'b');
     hold on;
     plot(x, y(2,:), 'r');
     plot(rozwiazanieAA(:,1),rozwiazanieAA(:,2), 'ko--');
     plot(rozwiazanieMA(:,1),rozwiazanieMA(:,2), 'go--');
     plot(F(1,1), F(2,1),'r*');
     plot(FP(1,1), FP(2,1),'co');
     hold off;
     axis('square')
     axis([0.9 2 0.9 2])
     set(0, 'defaultTextFontSize',10);
     text(1.5,1.5,'Punkt startowy Multiplicative ART  ','HorizontalAlignment', 'right')
     text(1,1,'  Punkt startowy Additive ART','HorizontalAlignment', 'left')
     T = {'Interpretacja graficzna'};
     title(T)
     xlabel('x')
     ylabel('y')
     grid minor;
     legend('równanie nr 1', 'rónanie nr 2', 'Additive ART','Multiplicative ART', 'Pseudoodwrotnoœæ', 'Lewe dzielenie');

    subplot(1,2,2)
     semilogy(iteracjeAA, abs(bladAA), 'x-.');
     hold on;
     semilogy(iteracjeMA, abs(bladMA), 'x-.');
     hold off;
     axis('square');
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i');
     ylabel('b³¹d');
     grid minor;
     legend('Additive ART','Multiplicative ART');

     text(-0.2,1.2, 'Porównanie metod', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized')
end

