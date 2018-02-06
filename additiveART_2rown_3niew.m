function [ ] = additiveART_2rown_3niew(A,G,x,z,errorSize)
   
    y = calc3d(A,G,x,z);

    [rozwiazanie,blad,iteracje,lambda] = calcAA( A,G,errorSize, 50, 1, 1);
    % Rysowanie wykresu
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Algorytm Additive ART','pos',windowSize);
    
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
     text(0.5,4.2,0.2, sprintf('Wartoœæ lambdy:\nLambda = %d', lambda(1,1)))
     legend(sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(1,1)/A(1,2), A(1,3)/A(1,2), G(1)/A(1,2)),...
           sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(2,1)/A(2,2), A(2,3)/A(2,2), G(2)/A(2,2)), 'Location' , 'southwest');

    subplot(1,2,2)
     semilogy(iteracje, abs(blad(:)), 'x-.');
     axis('square')
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid minor
    
    text(-0.2, 1.2, 'Algorytm Additive ART (2 równania i 3 niewiadome)', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');

    
    [rozwiazanie_1,blad_1,iteracje_1,lambda_1] = calcAA( A,G,errorSize, 50, 1.5, 1.1);
    % Rysowanie wykresu
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Algorytm Additive ART','pos',windowSize);
    
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
     text(0.47,4.3,-0.4, sprintf('Wartoœæ lambdy w i-tej iteracji'))
     set(0, 'defaultTextFontSize',10, 'defaultTextRotation',0);
     text(0.5,4.2,0.2, sprintf('Lambda = %.2f\n', lambda_1(:,1)))
     legend(sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(1,1)/A(1,2), A(1,3)/A(1,2), G(1)/A(1,2)),...
           sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(2,1)/A(2,2), A(2,3)/A(2,2), G(2)/A(2,2)), 'Location' , 'southwest');

    subplot(1,2,2)
     semilogy(iteracje_1, abs(blad_1), 'x-.');
     axis('square')
     title('B³¹d oszacowania i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b³¹d')
     grid minor
    
    text(-0.2, 1.2, 'Algorytm Additive ART (2 równania i 3 niewiadome)', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
    
    
    
%     figure('Name','Algorytm Additive ART');
%      [X,Y] = meshgrid(x,x);
%      for i=1:size(X,1)
%          for j=1:size(Y,1)
%              F1 = [x(i); x(j); 0];
%              tempBlad = G - (A * F1);
%              Z(i,j) = sum(abs(tempBlad).^2)^(1/2);
%          end
%      end
%      surf(X,Y,Z');
%      T = {'Trójwymiarowa interpretacja graficzna (2 równania i 3 niewiadome)'};
%      title(T)
%      shading flat;
%      alpha(0.5);
%      colorbar
%      hold on
%      [X ,~] = meshgrid(x,z);
%      [Y ,Z] = meshgrid(y(1,:),z);
%      C = zeros(size(X));
%      surf(X,Y,Z, C);
%      shading flat;
%      alpha (0.5);
%      [Y2 ,Z] = meshgrid(y(2,:),z);
%      C = ones(size(X));
%      surf(X,Y2,Z, C);
%      shading flat;
%      alpha(0.5);
%      plot3(rozwiazanie(:,1),rozwiazanie(:,2),rozwiazanie(:,3),'ko--');
%      hold off;
%      axis('square')
%      axis([0 2 0 2 0 10])
%      xlabel('x')
%      ylabel('y')
%      zlabel('z')
%      grid on
%      grid minor
%      legend('b³¹d', sprintf('równanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)), sprintf('równanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)), 'wynik w i-tej iteracji', 'Location' , 'southwest')

end

