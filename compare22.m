function [ ] = compare22( A,G,x,errorSize, maxAmountOfInterations, startPoint,lambdaAAInitValue, lambdaMAInitValue, lambdaDivideCoeff)
    y = calc2(A,G,x);
    FP = pinv(A)*G; 
    F = A\G;
    
    [ rozwiazanieAA,bladAA,iteracjeAA, ~] = calcAA( A,G,errorSize, maxAmountOfInterations, startPoint, lambdaAAInitValue, 1);
    [ rozwiazanieMA,bladMA,iteracjeMA, ~] = calcMA( A,G,errorSize, maxAmountOfInterations, startPoint, lambdaMAInitValue, 1);
    % Rysowanie wykresu
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
     axis([1.1 1.8 1.4 2.1])
     T = {'Interpretacja graficzna'};
     title(T)
     xlabel('x')
     ylabel('y')
     grid minor;
     legend(sprintf('r�wnanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)), sprintf('r�wnanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)),...
            'Additive ART','Multiplicative ART', 'Lewe dzielenie', 'Pseudoodwrotno��', 'Location' , 'southwest')

    subplot(1,2,2)
     semilogy(iteracjeAA, abs(bladAA), 'x-.');
     hold on;
     semilogy(iteracjeMA, abs(bladMA), 'x-.');
     hold off;
     axis('square');
     title('B��d oszacowania i-tej iteracji');
     xlabel('i-ta iteracja');
     ylabel('b��d');
     grid minor;
     legend('Additive ART','Multiplicative ART');

     text(-0.2,1.2, 'Por�wnanie metod (2 r�wnania i 2 niewiadome, sta�a lambda)', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized')
    
    
    
    
    [ rozwiazanieAA,bladAA,iteracjeAA, ~] = calcAA( A,G,errorSize, maxAmountOfInterations, startPoint, lambdaAAInitValue, lambdaDivideCoeff);
    [ rozwiazanieMA,bladMA,iteracjeMA, ~] = calcMA( A,G,errorSize, maxAmountOfInterations, startPoint, lambdaMAInitValue, lambdaDivideCoeff);
    
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
     axis([1.1 1.8 1.4 2.1])
     T = {'Interpretacja graficzna'};
     title(T)
     xlabel('x')
     ylabel('y')
     grid minor;
     legend(sprintf('r�wnanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)), sprintf('r�wnanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)), 'Additive ART','Multiplicative ART', 'Pseudoodwrotno��', 'Lewe dzielenie', 'Location' , 'southwest')

    subplot(1,2,2)
     semilogy(iteracjeAA, abs(bladAA), 'x-.');
     hold on;
     semilogy(iteracjeMA, abs(bladMA), 'x-.');
     hold off;
     axis('square');
     title('B��d oszacowania i-tej iteracji');
     xlabel('i');
     ylabel('b��d');
     grid minor;
     legend('Additive ART','Multiplicative ART');

     text(-0.2,1.2, 'Por�wnanie metod (2 r�wnania i 2 niewiadome, lambda zmniejszana w ka�dej iteracji)', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized')
end

