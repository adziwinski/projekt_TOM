function [] = compare23(A,G,x,z,errorSize, maxAmountOfInterations, startPoint,lambdaAAInitValue, lambdaMAInitValue, lambdaDivideCoeff)

    y = calc3d(A,G,x,z);
    FP = pinv(A)*G; 
    F = A\G;
    
    [rozwiazanieAA,bladAA,iteracjeAA,~] = calcAA( A,G,errorSize, maxAmountOfInterations, startPoint, lambdaAAInitValue, 1);
    [rozwiazanieMA,bladMA,iteracjeMA,~] = calcMA( A,G,errorSize, maxAmountOfInterations, startPoint, lambdaMAInitValue, 1);
    % Rysowanie wykresu
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Porównanie metod','pos',windowSize);

    subplot(1,2,1)
     [X ,~] = meshgrid(x,z);
     [Y ,Z] = meshgrid(y(1,:),z);
     C = zeros(size(X));
     surf(X,Y,Z, C);
     axis('square')
     axis([0 2 0 2 0 2])
     T = {'Interpretacja graficzna'};
     title(T)
     shading flat;
     alpha(0.5);
     hold on;
     [Y2 ,Z] = meshgrid(y(2,:),z);
     C = ones(size(X));
     surf(X,Y2,Z, C);
     shading flat;
     alpha(0.5);
     plot3(rozwiazanieAA(:,1),rozwiazanieAA(:,2),rozwiazanieAA(:,3),'ko--');
     plot3(rozwiazanieMA(:,1),rozwiazanieMA(:,2),rozwiazanieMA(:,3),'go--');
     plot3(F(1,1), F(2,1), F(3,1),'r*');
     plot3(FP(1,1), FP(2,1), FP(3,1),'co');
     hold off;
     grid on
     grid minor
     xlabel('x');
     ylabel('y');
     zlabel('z');
     legend(sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(1,1)/A(1,2), A(1,3)/A(1,2), G(1)/A(1,2)),...
           sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(2,1)/A(2,2), A(2,3)/A(2,2), G(2)/A(2,2)),...
            'Additive ART', 'Multiplicative ART', 'Lewe dzielenie', 'Pseudoodwrotnoœæ', 'Location' , 'southwest');

    subplot(1,2,2)
     semilogy(iteracjeAA, abs(bladAA), 'x-.');
     hold on;
     semilogy(iteracjeMA, abs(bladMA), 'x-.');
     hold off;
     axis('square')
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid minor
     legend('Additive ART','Multiplicative ART');
     
     text(-0.2,1.2, 'Porównanie metod (2 równania i 3 niewiadome, sta³a lambda)', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
    
    
    
    [rozwiazanieAA,bladAA,iteracjeAA,~] = calcAA( A,G,errorSize, maxAmountOfInterations, startPoint, lambdaAAInitValue, lambdaDivideCoeff);
    [rozwiazanieMA,bladMA,iteracjeMA,~] = calcMA( A,G,errorSize, maxAmountOfInterations, startPoint, lambdaMAInitValue, lambdaDivideCoeff);
    % Rysowanie wykresu
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Porównanie metod','pos',windowSize);

    subplot(1,2,1)
     [X ,~] = meshgrid(x,z);
     [Y ,Z] = meshgrid(y(1,:),z);
     C = zeros(size(X));
     surf(X,Y,Z, C);
     axis('square')
     axis([0 2 0 2 0 2])
     T = {'Interpretacja graficzna'};
     title(T)
     shading flat;
     alpha(0.5);
     hold on;
     [Y2 ,Z] = meshgrid(y(2,:),z);
     C = ones(size(X));
     surf(X,Y2,Z, C);
     shading flat;
     alpha(0.5);
     plot3(rozwiazanieAA(:,1),rozwiazanieAA(:,2),rozwiazanieAA(:,3),'ko--');
     plot3(rozwiazanieMA(:,1),rozwiazanieMA(:,2),rozwiazanieMA(:,3),'go--');
     plot3(F(1,1), F(2,1), F(3,1),'r*');
     plot3(FP(1,1), FP(2,1), FP(3,1),'co');
     hold off;
     grid on
     grid minor
     xlabel('x');
     ylabel('y');
     zlabel('z');
     legend(sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(1,1)/A(1,2), A(1,3)/A(1,2), G(1)/A(1,2)),...
           sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(2,1)/A(2,2), A(2,3)/A(2,2), G(2)/A(2,2)),...
            'Additive ART', 'Multiplicative ART', 'Lewe dzielenie', 'Pseudoodwrotnoœæ', 'Location' , 'southwest');

    subplot(1,2,2)
     semilogy(iteracjeAA, abs(bladAA), 'x-.');
     hold on;
     semilogy(iteracjeMA, abs(bladMA), 'x-.');
     hold off;
     axis('square')
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid minor
     legend('Additive ART','Multiplicative ART');
     
     text(-0.2,1.2, 'Porównanie metod (2 równania i 3 niewiadome, lambda zmniejszana w ka¿dej iteracji)', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
end

