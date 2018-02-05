function [ ] = pseudoodwrotnosc23(A,G,x,z)
    
    F = A\G;
    FP = pinv(A)*G; 
    
    tempBlad = G - (A * F);
    bladF = sum(abs(tempBlad).^2)^(1/2);
    tempBlad = G - (A * FP);
    bladFP = sum(abs(tempBlad).^2)^(1/2);
    
    
    figure('Name','Pseudoodwrotnoœæ'); % pseudoodwrotnoœæ
    y = calc3d(A,G,x,z);
    [X ,~] = meshgrid(x,z);
    [Y ,Z] = meshgrid(y(1,:),z);
    C = zeros(size(X));
    surf(X,Y,Z, C);
    axis('square')
    axis([0.5 1.5 0.5 1.5 0.5 1.5])
    title('Pseudoodwrotnoœæ');
    shading flat;
    alpha(0.5);
    hold on;
    [Y2 ,Z] = meshgrid(y(2,:),z);
    C = ones(size(X));
    surf(X,Y2,Z, C);
    shading flat;
    alpha(0.5);
    plot3(FP(1),FP(2),FP(3), 'ko');
    hold off;
    grid on
    grid minor
    xlabel('x');
    ylabel('y');
    zlabel('z');
    legend(sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(1,1)/A(1,2), A(1,3)/A(1,2), G(1)/A(1,2)),...
           sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(2,1)/A(2,2), A(2,3)/A(2,2), G(2)/A(2,2)), 'wynik', 'Location' , 'southwest');
   
       %%       
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Porównanie pseudoodwrotnoœci z lewym dzieleniem','pos',windowSize); % porównanie pseudoodwrotnoœci z lewym dzieleniem

    subplot(1,2,1)
     C = zeros(size(X));
     surf(X,Y,Z, C);
     axis('square')
     axis([0 2 0 2 0 2])
     title('Pseudoodwrotnoœæ');
     shading flat;
     alpha(0.5);
     hold on;
     C = ones(size(X));
     surf(X,Y2,Z, C);
     shading flat;
     alpha(0.5);
     plot3(FP(1),FP(2),FP(3), 'ko');
     hold off;
     grid on
     grid minor
     xlabel('x');
     ylabel('y');
     zlabel('z');
     legend(sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(1,1)/A(1,2), A(1,3)/A(1,2), G(1)/A(1,2)),...
           sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(2,1)/A(2,2), A(2,3)/A(2,2), G(2)/A(2,2)), 'wynik', 'Location' , 'southwest');
     text(2,1.5,1.8, sprintf('B³¹d = %.2e   ', bladFP), 'HorizontalAlignment', 'right');

    subplot(1,2,2)
     C = zeros(size(X));
     surf(X,Y,Z, C);
     axis('square')
     axis([0 2 0 2 0 2])
     title('Lewe dzielenie');
     shading flat;
     alpha(0.5);
     hold on;
     C = ones(size(X));
     surf(X,Y2,Z, C);
     shading flat;
     alpha(0.5);
     plot3(F(1),F(2),F(3), 'ko');
     hold off;
     grid on
     grid minor
     xlabel('x');
     ylabel('y');
     zlabel('z');
     legend(sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(1,1)/A(1,2), A(1,3)/A(1,2), G(1)/A(1,2)),...
           sprintf('równanie y = %.1f*x + %.1f*z + %.1f', A(2,1)/A(2,2), A(2,3)/A(2,2), G(2)/A(2,2)), 'wynik', 'Location' , 'southwest');
     text(2,1.5,1.8, sprintf('B³¹d = %.2e   ', bladF), 'HorizontalAlignment', 'right');

    text(-0.2, 1.1, 'Porównanie dwóch metod', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
     
    
end