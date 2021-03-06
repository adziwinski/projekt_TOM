function [ ] = pseudoodwrotnosc32(A,G,x)
    
    F = A\G;
    FP = pinv(A)*G; 
    
    tempBlad = G - (A * F);
    bladF = sqrt((tempBlad(1)).^2 + (tempBlad(2)).^2);
    tempBlad = G - (A * FP);
    bladFP = sqrt((tempBlad(1)).^2 + (tempBlad(2)).^2);
    
    
    figure('Name','Pseudoodwrotno��'); % pseudoodwrotno��
    y = calc2(A,G,x);
    plot(x, y(1,:), x, y(2,:), x, y(3,:), FP(1,1), FP(2,1), 'ko')
    axis('square')
    axis([0.9 1.9 1 2])
    grid on
    grid minor
    title('Pseudoodwrotno��');
    set(0, 'defaultTextFontSize',10);
    xlabel('x');
    ylabel('y');
    legend(sprintf('r�wnanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)),...
           sprintf('r�wnanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)),...
           sprintf('r�wnanie y = %.1f*x + %.1f', A(3,1)/A(3,2), G(3)/A(3,2)), 'wynik', 'Location' , 'southwest');

                    
       
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Por�wnanie pseudoodwrotno�ci z lewym dzieleniem','pos',windowSize); % por�wnanie pseudoodwrotno�ci z lewym dzieleniem
    
    subplot(1,2,1)
     plot(x, y(1,:), x, y(2,:), x, y(3,:), FP(1,1), FP(2,1), 'ko')
     axis('square')
     axis([0.9 1.9 1 2])
     grid on
     grid minor   
     
     title('Pseudoodwrotno��');
     set(0, 'defaultTextFontSize',10);
     xlabel('x');
     ylabel('y');
     legend(sprintf('r�wnanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)),...
           sprintf('r�wnanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)),...
           sprintf('r�wnanie y = %.1f*x + %.1f', A(3,1)/A(3,2), G(3)/A(3,2)), 'wynik', 'Location' , 'southwest');
     format short
     text(1.9,1.95, sprintf('Rozwi�zanie = (%.2f, %.2f) \nB��d = %.2e ', FP(1,1), FP(2,1), bladFP), 'HorizontalAlignment', 'right');
     
    subplot(1,2,2)
     plot(x, y(1,:), x, y(2,:), x, y(3,:), F(1,1), F(2,1), 'ko')
     axis('square')
     axis([0.9 1.9 1 2])
     grid on
     grid minor
     title('Lewe dzielenie');set(0, 'defaultTextFontSize',10);
     xlabel('x');
     ylabel('y');
     legend(sprintf('r�wnanie y = %.1f*x + %.1f', A(1,1)/A(1,2), G(1)/A(1,2)),...
           sprintf('r�wnanie y = %.1f*x + %.1f', A(2,1)/A(2,2), G(2)/A(2,2)),...
           sprintf('r�wnanie y = %.1f*x + %.1f', A(3,1)/A(3,2), G(3)/A(3,2)), 'wynik', 'Location' , 'southwest');
     text(1.9,1.95, sprintf('Rozwi�zanie = (%.2f, %.2f) \nB��d = %.2e ', F(1,1), F(2,1), bladF), 'HorizontalAlignment', 'right');
     
     text(-0.2,1.2, 'Por�wnanie dw�ch metod', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');

end