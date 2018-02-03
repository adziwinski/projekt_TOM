function [ ] = pseudoodwrotnosc22(A,G,x)
    
    F = A\G;
    FP = pinv(A)*G; 
    
    tempBlad = G - (A * F);
    bladF = sqrt((tempBlad(1)).^2 + (tempBlad(2)).^2);
    tempBlad = G - (A * FP);
    bladFP = sqrt((tempBlad(1)).^2 + (tempBlad(2)).^2);
    
    
    figure('Name','Pseudoodwrotnoœæ'); % pseudoodwrotnoœæ
    y = calc2(A,G,x);
    plot(x, y(1,:), x, y(2,:), FP(1,1), FP(2,1), 'ko')
    axis('square')
    axis([1.2 1.9 1.4 2.1 ])
    grid on
    grid minor
    title('Pseudoodwrotnoœæ');
    set(0, 'defaultTextFontSize',10);
    xlabel('x');
    ylabel('y');
    legend('równanie 1', 'równanie 2', 'wynik', 'Location' , 'southwest')

                    
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Porównanie pseudoodwrotnoœci z lewym dzieleniem','pos',windowSize); % porównanie pseudoodwrotnoœci z lewym dzieleniem
    
    subplot(1,2,1)
     plot(x, y(1,:), x, y(2,:), FP(1,1), FP(2,1), 'ko')
     axis('square')
     axis([1.2 1.9 1.4 2.1 ])
     grid on
     grid minor                   
     title('Pseudoodwrotnoœæ');
     set(0, 'defaultTextFontSize',10);
     xlabel('x');
     ylabel('y');
     legend('równanie 1', 'równanie 2', 'wynik pseudoodwrotnoœci', 'Location' , 'southwest')
     text(2,2, 'B³¹d pseudoodwrotnoœci = ', 'HorizontalAlignment', 'right');
     
    subplot(1,2,2)
     plot(x, y(1,:), x, y(2,:), F(1,1), F(2,1), 'ko')
     axis('square')
     axis([1.2 1.9 1.4 2.1 ])
     grid on
     grid minor
     title('Lewe dzielenie');set(0, 'defaultTextFontSize',10);
     xlabel('x');
     ylabel('y');
     legend('równanie 1', 'równanie 2', 'wynik lewego dzielenia', 'Location' , 'southwest')
     text(2,2, 'B³¹d lewego dzielenia =  \bladF', 'HorizontalAlignment', 'right');

end