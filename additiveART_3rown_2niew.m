function [ ] = additiveART_3rown_2niew( A,G,x,errorSize)

    y = calc2(A,G,x);
    
    [rozwiazanie,blad,iteracje, lambda] = calcAA( A,G,errorSize, 50, 1, 1);    
        % Rysowanie wykresu
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Algorytm Additive ART','pos',windowSize);

    subplot(1,2,1)
     plot(x, y(1,:),'b');
     hold on;
     plot(x, y(2,:), 'r');
     plot(x, y(3,:), 'c');
     plot(rozwiazanie(:,1),rozwiazanie(:,2), 'ko--');
     hold off;
     axis('square')
     axis([0.9 2 0.9 2])
     T = {'Interpretacja graficzna'};
     title(T)
     xlabel('x')
     ylabel('y')
     set(0, 'defaultTextFontSize',10);
     text(0.55,1.7, sprintf('Wartoœæ lambdy:\nLambda = %d', lambda(1,1)))
     legend(sprintf('równanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)),...
           sprintf('równanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)),...
           sprintf('równanie y = %.1f*x + %.1f', A(3,1)/A(3,2), G(3)/A(3,2)), 'wynik w i-tej iteracji', 'Location' , 'southwest');
     grid minor
     
    subplot(1,2,2)
     semilogy(iteracje, abs(blad(:)), 'x-.');
     axis('square')
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid minor
          
    text(-0.2,1.2, 'Algorytm Additive ART (3 równania i 2 niewiadome)', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
    
    
    
    [rozwiazanie_1,blad_1,iteracje_1,lambda_1] = calcAA( A,G,errorSize, 50, 1.5, 1.1);
     % Rysowanie wykresu
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Algorytm Additive ART','pos',windowSize);

    subplot(1,2,1)
     plot(x, y(1,:),'b');
     hold on;
     plot(x, y(2,:), 'r');
     plot(x, y(3,:), 'c');
     plot(rozwiazanie_1(:,1),rozwiazanie_1(:,2), 'ko--');
     hold off;
     axis('square')
     axis([0.9 2 0.9 2])
     T = {'Interpretacja graficzna'};
     title(T)
     xlabel('x')
     ylabel('y')
     set(0, 'defaultTextFontSize',10, 'defaultTextRotation',90);
     text(0.52,1.33, sprintf('Wartoœæ lambdy w i-tej iteracji'))
     set(0, 'defaultTextFontSize',7, 'defaultTextRotation',0);
     text(0.55,1.45, sprintf('Lambda = %.3f\n', lambda_1(:,1)))
     legend(sprintf('równanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)),...
            sprintf('równanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)),...
            sprintf('równanie y = %.1f*x + %.1f', A(3,1)/A(3,2), G(3)/A(3,2)), 'wynik w i-tej iteracji', 'Location' , 'southwest');
     grid minor
     
    subplot(1,2,2)
     semilogy(iteracje_1, abs(blad_1), 'x-.');
     axis('square')
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid minor

     text(-0.2,1.2, 'Algorytm Additive ART (3 równania i 2 niewiadome)', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
   
    
    
    
    % Rysowanie wykresu
    figure('Name','Algorytm Additive ART');

     [X,Y] = meshgrid(x,x);
     for i=1:size(X,1)
         for j=1:size(Y,1)
             F1 = [x(i); x(j)];
             tempBlad = G - (A * F1);
             Z(i,j) = sum(abs(tempBlad).^2)^(1/2);
         end
     end
     surf(X,Y,Z');
     T = {'Trójwymiarowa interpretacja graficzna (3 równania i 2 niewiadome)'};
     title(T)
     shading flat;
     alpha(0.5);
     colorbar
     hold on
     zzet = zeros(size(x,2),1);
     plot3(x, y(1,:), zzet,'b');
     plot3(x, y(2,:), zzet, 'r');
     plot3(x, y(3,:), zzet, 'c');
     zet = zeros(size(rozwiazanie,1),1);
     plot3(rozwiazanie(:,1),rozwiazanie(:,2), zet, 'ko--');
     hold off;
     axis('square')
     axis([0.9 2 0.9 2 0 4.5])
     xlabel('x')
     ylabel('y')
     zlabel('z')
     grid minor
     legend('b³¹d', sprintf('równanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)),...
            sprintf('równanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)),...
            sprintf('równanie y = %.1f*x + %.1f', A(3,1)/A(3,2), G(3)/A(3,2)), 'wynik w i-tej iteracji', 'Location' , 'southwest');

end

