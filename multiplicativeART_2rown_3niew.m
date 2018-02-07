function [ ] = multiplicativeART_2rown_3niew(A,G,x,z,errorSize, maxAmountOfInterations, startPoint,  lambdaInitValue,lambdaDivideCoeff)

    y = calc2(A,G,x);
    y = calc3d(A,G,x,z);

    [ rozwiazanie,blad,iteracje,lambda ] = calcMA( A,G,errorSize, maxAmountOfInterations, startPoint, lambdaInitValue, 1);
    % Rysowanie wykresu
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Algorytm Multiplicative ART','pos',windowSize);

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
     plot3(rozwiazanie(:,1),rozwiazanie(:,2),rozwiazanie(:,3),'ko--');
     hold off;
     grid on
     grid minor
     xlabel('x');
     ylabel('y');
     zlabel('z');
     set(0, 'defaultTextFontSize',10);
     text(0.5,4.2,0.2, sprintf('Wartoœæ lambdy:\n Lambda = %.2f', lambda(1,1)))
     legend(sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(1,1)/A(1,2), A(1,3)/A(1,2), G(1)/A(1,2)),...
           sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(2,1)/A(2,2), A(2,3)/A(2,2), G(2)/A(2,2)), 'wynik w i-tej iteracji', 'Location' , 'southwest');

    subplot(1,2,2)
     semilogy(iteracje, abs(blad), 'x-.');
     axis('square')
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid minor
    
    text(-0.2, 1.15, 'Algorytm Multiplicative ART (2 równania i 3 niewiadome, sta³a lambda)', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
    
    
    
    [rozwiazanie_1,blad_1,iteracje_1, lambda_1] = calcMA( A,G,errorSize, maxAmountOfInterations, startPoint, lambdaInitValue, lambdaDivideCoeff);
    % Rysowanie wykresu
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Algorytm Multiplicative ART','pos',windowSize);

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
     plot3(rozwiazanie_1(:,1),rozwiazanie_1(:,2),rozwiazanie_1(:,3),'ko--');
     hold off;
     grid on
     grid minor
     xlabel('x');
     ylabel('y');
     zlabel('z');
     set(0, 'defaultTextFontSize',10, 'defaultTextRotation',90);
     text(0.4,4.2,-0.2, sprintf('Wartoœæ lambdy w i-tej iteracji'))
     set(0, 'defaultTextFontSize',8, 'defaultTextRotation',0);
     text(0.5,4.2,0.2, sprintf('Lambda = %.3f\n', lambda_1(1,:)))
     legend(sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(1,1)/A(1,2), A(1,3)/A(1,2), G(1)/A(1,2)),...
           sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(2,1)/A(2,2), A(2,3)/A(2,2), G(2)/A(2,2)), 'wynik w i-tej iteracji', 'Location' , 'southwest');

    subplot(1,2,2)
     semilogy(iteracje_1, abs(blad_1), 'x-.');
     axis('square')
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid minor
    
    text(-0.2, 1.15, 'Algorytm Multiplicative ART (2 równania i 3 niewiadome, lambda zmniejszana w ka¿dej iteracji)', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
end

