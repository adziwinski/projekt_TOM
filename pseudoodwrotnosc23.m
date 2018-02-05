function [ ] = pseudoodwrotnosc23(A,G,x,z)
    
    F = A\G;
    FP = pinv(A)*G; 
    
    tempBlad = G - (A * F);
    bladF = sqrt((tempBlad(1)).^2 + (tempBlad(2)).^2);
    tempBlad = G - (A * FP);
    bladFP = sqrt((tempBlad(1)).^2 + (tempBlad(2)).^2);
    
    
    figure('Name','Pseudoodwrotnoœæ'); % pseudoodwrotnoœæ
    y = calc3d(A,G,x,z);
    [X ,Z] = meshgrid(x,z);
    [Y ,Z] = meshgrid(y(1,:),z);
    colormap([0 0 1]);
    surf(X,Y,Z);
    shading flat;
    alpha(0.5);
    hold on;
    [Y2 ,Z] = meshgrid(y(2,:),z);
    %colormap([1 0 0]);
    surf(X,Y2,Z);
    shading flat;
    alpha(0.5);
    plot3(FP(1),FP(2),FP(3), 'ko');
    hold off;
    grid minor
    xlabel('x');
    ylabel('y');
    zlabel('z');
    legend(sprintf('równanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)),...
           sprintf('równanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)), 'wynik', 'Location' , 'southwest');
           
       
    %plot3(x, y(1,:), z, x, y(2,:), z, FP(1,1), FP(2,1), FP(3,1), 'ko')
    %axis('square')
    %axis([0.9 1.9 1 2])
    %grid on
    %grid minor
    %title('Pseudoodwrotnoœæ');
    %set(0, 'defaultTextFontSize',10);
    
    %legend(sprintf('równanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)),...
    %       sprintf('równanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)),...
    %       sprintf('równanie y = %.1f*x + %.1f', A(3,1)/A(3,2), G(3)/A(3,2)), 'wynik', 'Location' , 'southwest');

                    
%     screenSize = get(groot,'ScreenSize');
%     windowHigh = screenSize(4);
%     windowSize = screenSize;
%     windowSize(4) = windowHigh * 0.9;
%     figure('Name','Porównanie pseudoodwrotnoœci z lewym dzieleniem','pos',windowSize); % porównanie pseudoodwrotnoœci z lewym dzieleniem
%     
%     subplot(1,2,1)
%      plot(x, y(1,:), x, y(2,:), x, y(3,:), FP(1,1), FP(2,1), 'ko')
%      axis('square')
%      axis([0.9 1.9 1 2])
%      grid on
%      grid minor   
%      
%      title('Pseudoodwrotnoœæ');
%      set(0, 'defaultTextFontSize',10);
%      xlabel('x');
%      ylabel('y');
%      legend(sprintf('równanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)),...
%            sprintf('równanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)),...
%            sprintf('równanie y = %.1f*x + %.1f', A(3,1)/A(3,2), G(3)/A(3,2)), 'wynik', 'Location' , 'southwest');
%      format short
%      text(1.9,1.9, sprintf('B³¹d = %.2e   ', bladFP), 'HorizontalAlignment', 'right');
%      
%     subplot(1,2,2)
%      plot(x, y(1,:), x, y(2,:), x, y(3,:), F(1,1), F(2,1), 'ko')
%      axis('square')
%      axis([0.9 1.9 1 2])
%      grid on
%      grid minor
%      title('Lewe dzielenie');set(0, 'defaultTextFontSize',10);
%      xlabel('x');
%      ylabel('y');
%      legend(sprintf('równanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)),...
%            sprintf('równanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)),...
%            sprintf('równanie y = %.1f*x + %.1f', A(3,1)/A(3,2), G(3)/A(3,2)), 'wynik', 'Location' , 'southwest');
%      text(1.9,1.9, sprintf('B³¹d = %.2e   ', bladF), 'HorizontalAlignment', 'right');
%      
%      text(-0.2,1.2, 'Porównanie dwóch metod', 'HorizontalAlignment', 'center',...
%         'FontSize', 16 , 'Units', 'normalized');

end