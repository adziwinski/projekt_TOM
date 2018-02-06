function [] = compare32(A,G,x,errorSize)

    y = calc2(A,G,x);
    FP = pinv(A)*G; 
    F = A\G;
    
    [rozwiazanieAA,bladAA,iteracjeAA,~] = calcAA( A,G,errorSize, 50, 1, 1);
    [rozwiazanieMA,bladMA,iteracjeMA,~] = calcMA( A,G, errorSize,50, 0.4, 1);
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
     plot(rozwiazanieAA(:,1),rozwiazanieAA(:,2), 'ko--');
     plot(rozwiazanieMA(:,1),rozwiazanieMA(:,2), 'go--');
     plot(F(1,1), F(2,1),'r*');
     plot(FP(1,1), FP(2,1),'co');
     hold off;
     axis('square')
     axis([0.9 2 0.9 2]);
     T = {'Interpretacja graficzna'};
     title(T)
     xlabel('x')
     ylabel('y')
     grid on
     grid minor
     legend(sprintf('równanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)),...
            sprintf('równanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)),...
            sprintf('równanie y = %.1f*x + %.1f', A(3,1)/A(3,2), G(3)/A(3,2)),... 
            'Additive ART', 'Multiplicative ART', 'Lewe dzielnie', 'Pseudoodwrotnoœæ', 'Location' , 'southwest')

    subplot(1,2,2)  
     semilogy(iteracjeAA, abs(bladAA), 'x-.');
     hold on;
     semilogy(iteracjeMA, abs(bladMA), 'x-.');
     hold off;
     axis('square')
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid on
     grid minor
     legend('Additive ART','Multiplicative ART');
     
     text(-0.2,1.2, 'Porównanie metod (3 równania i 2 niewiadome, sta³a lambda)', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
    
    
    
    
    [rozwiazanieAA,bladAA,iteracjeAA,~] = calcAA( A,G,errorSize, 50, 1.5, 1.1);
    [rozwiazanieMA,bladMA,iteracjeMA,~] = calcMA( A,G, errorSize,50, 0.4, 1.1);
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
     plot(rozwiazanieAA(:,1),rozwiazanieAA(:,2), 'ko--');
     plot(rozwiazanieMA(:,1),rozwiazanieMA(:,2), 'go--');
     plot(F(1,1), F(2,1),'r*');
     plot(FP(1,1), FP(2,1),'co');
     hold off;
     axis('square')
     axis([0.9 2 0.9 2]);
     T = {'Interpretacja graficzna'};
     title(T)
     xlabel('x')
     ylabel('y')
     grid on
     grid minor
     legend(sprintf('równanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)),...
            sprintf('równanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)),...
            sprintf('równanie y = %.1f*x + %.1f', A(3,1)/A(3,2), G(3)/A(3,2)),... 
            'Additive ART', 'Multiplicative ART', 'Lewe dzielnie', 'Pseudoodwrotnoœæ', 'Location' , 'southwest')

    subplot(1,2,2)  
     semilogy(iteracjeAA, abs(bladAA), 'x-.');
     hold on;
     semilogy(iteracjeMA, abs(bladMA), 'x-.');
     hold off;
     axis('square')
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid on
     grid minor
     legend('Additive ART','Multiplicative ART');
     
     text(-0.2,1.2, 'Porównanie metod (3 równania i 2 niewiadome, lambda zmniejszana w ka¿dej iteracji)', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
end

