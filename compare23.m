function [] = compare23(A,G,x,z,errorSize)

    y = calc3d(A,G,x,z);
    FP = pinv(A)*G; 
    F = A\G;
    
     plot(F(1,1), F(2,1),'r*');
     plot(FP(1,1), FP(2,1),'co');
    [rozwiazanieAA,bladAA,iteracjeAA,~] = calcAA( A,G,errorSize, 30, 1, 1);
    [rozwiazanie_lAA,blad_lAA,iteracje_lAA,~] = calcAA( A,G,errorSize, 30, 1.5, 1.1);
    [rozwiazanieMA,bladMA,iteracjeMA,~] = calcMA( A,G, errorSize,100, 0.4, 1);
    [rozwiazanie_lMA,blad_lMA,iteracje_lMA,~] = calcMA( A,G,errorSize, 100, 0.4, 1.1);
    
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Porównie rozi¹zañ u dla dwóch równañ ','pos',windowSize);

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
     
    [rozwiazanieAA,bladAA,iteracjeAA,~] = calcAA( A,G,errorSize, 30, 1, 1);
    [rozwiazanie_lAA,blad_lAA,iteracje_lAA,~] = calcAA( A,G,errorSize, 30, 1.5, 1.1);
    [rozwiazanieMA,bladMA,iteracjeMA,~] = calcMA( A,G, errorSize,100, 0.4, 1);
    [rozwiazanie_lMA,blad_lMA,iteracje_lMA,~] = calcMA( A,G,errorSize, 100, 0.4, 1.1);
    
     plot3(rozwiazanieAA(:,1),rozwiazanieAA(:,2),rozwiazanieAA(:,3),'m--');
     plot3(rozwiazanie_lAA(:,1),rozwiazanie_lAA(:,2),rozwiazanie_lAA(:,3),'k--');
     plot3(rozwiazanieMA(:,1),rozwiazanieMA(:,2),rozwiazanieMA(:,3),'g--');
     plot3(rozwiazanie_lMA(:,1),rozwiazanie_lMA(:,2),rozwiazanie_lMA(:,3),'b--');
     plot3(F(1),F(2),F(3), 'r*');
     plot3(FP(1),FP(2),FP(3), 'ko');
     hold off;
     grid on
     grid minor
     xlabel('x');
     ylabel('y');
     zlabel('z');
     set(0, 'defaultTextFontSize',10);
     legend(sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(1,1)/A(1,2), A(1,3)/A(1,2), G(1)/A(1,2)),...
           sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(2,1)/A(2,2), A(2,3)/A(2,2), G(2)/A(2,2)),...
            'Additive ART \lambda = const', ...
            'Additive ART \lambda zmniejszana w ka¿dej iteracji',...
            'Multiplicative ART \lambda = const', ...
            'Multiplicative ART \lambda zmniejszana w ka¿dej iteracji',...
            'Lewe dzielnie',...
            'Pseudoodwrotnoœæ',...
            'Location' , 'southwest');

    subplot(1,2,2)
     semilogy(iteracjeMA, abs(bladMA), '-');
     hold on;
     semilogy(iteracje_lMA, abs(blad_lMA), '-');
     semilogy(iteracjeAA, abs(bladAA(:)), '-');
     semilogy(iteracje_lAA, abs(blad_lAA(:)), '-');
     hold off;
     axis('square')
     title('B³¹d dla i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid minor
          legend( 'Additive ART \lambda = const',...
         'Additive ART \lambda zmniejszana w ka¿dej iteracji',...
         'Multiplicative ART \lambda = const',...
         'Multiplicative ART \lambda zmniejszana w ka¿dej iteracji',...
         'Location' , 'southwest');
     text(-0.2,1.2, 'Dwa równania, trzy niewiadome - Porównie metod', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
end

