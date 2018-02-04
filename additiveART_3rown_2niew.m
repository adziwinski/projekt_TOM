function [ ] = additiveART_3rown_2niew( A,G,F,x,errorSize)

    y = calc2(A,G,x);
    
    [rozwiazanie,blad,iteracje] = calcAA( A,G,errorSize, 30, 1, 1);
    [rozwiazanie_l,blad_l,iteracje_l] = calcAA( A,G,errorSize, 30, 1.5, 1.1);
    
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
     plot(rozwiazanie(:,1),rozwiazanie(:,2), 'k--');
     plot(rozwiazanie_l(:,1),rozwiazanie_l(:,2), 'm--');
     hold off;
     axis('square')
     axis([0.9 2 0.9 2]);
     set(0, 'defaultTextFontSize',10);
     text(0.9,0.65,'Punkt startowy (1, 1)')
     T = {'Ortogonalne rzutowanie punktu na proste'; 
     'odpowiadaj�ce trzema r�wnaniom';
     'uk�adu z dwiema niewiadomymi'};
     title(T)
     xlabel('x')
     ylabel('y')
     legend('r�wnanie 1', 'r�wnanie 2', 'r�wnanie 3', '\lambda = const', '\lambda zmniejszana w ka�dej iteracji','Location' , 'southwest')
     grid minor
     text(1.5,1.5,'Punkt startowy (1,5, 1,5)  ','HorizontalAlignment', 'right')
     
    subplot(1,2,2)
    semilogy(iteracje, abs(blad(:)), '-');
    hold on;
    semilogy(iteracje_l, abs(blad_l(:)), '-');
    hold off;
     axis('square')
     title('B��d oszacowania dla i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b��d')
     grid minor
     legend( '\lambda = const', '\lambda zmniejszana w ka�dej iteracji', 'Location' , 'southwest');
     text(-0.2,1.2, 'Algorytm additive ART', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');

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
     plot(rozwiazanie(:,1),rozwiazanie(:,2), 'k--');
     hold off;
     axis('square')
     axis([0.9 2 0.9 2]);
     set(0, 'defaultTextFontSize',10);
     text(0.9,0.65,'Punkt startowy (1, 1)')
     T = {'Ortogonalne rzutowanie punktu na proste'; 
     'odpowiadaj�ce trzema r�wnaniom';
     'uk�adu z dwiema niewiadomymi'};
     title(T)
     xlabel('x')
     ylabel('y')
     legend('r�wnanie 1', 'r�wnanie 2', 'r�wnanie 3', '\lambda = const', 'Location' , 'southwest')
     grid minor
     text(1.5,1.5,'Punkt startowy (1,5, 1,5)  ','HorizontalAlignment', 'right')
     
    subplot(1,2,2)
    semilogy(iteracje, abs(blad(:)), '-');
     axis('square')
     title('B��d oszacowania dla i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b��d')
     grid minor
     legend( '\lambda = const', 'Location' , 'southwest');
     text(-0.2,1.2, 'Algorytm additive ART', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
    
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
     plot(rozwiazanie_l(:,1),rozwiazanie_l(:,2), 'm--');
     hold off;
     axis('square')
     axis([0.9 2 0.9 2]);
     set(0, 'defaultTextFontSize',10);
     text(0.9,0.65,'Punkt startowy (1, 1)')
     T = {'Ortogonalne rzutowanie punktu na proste'; 
     'odpowiadaj�ce trzema r�wnaniom';
     'uk�adu z dwiema niewiadomymi'};
     title(T)
     xlabel('x')
     ylabel('y')
     legend('r�wnanie 1', 'r�wnanie 2', 'r�wnanie 3', '\lambda zmniejszana w ka�dej iteracji','Location' , 'southwest')
     grid minor
     text(1.5,1.5,'Punkt startowy (1,5, 1,5)  ','HorizontalAlignment', 'right')
     
    subplot(1,2,2)
     semilogy(iteracje_l, abs(blad_l(:)), '-');
     axis('square')
     title('B��d oszacowania dla i-tej iteracji');
     xlabel('i-ta iteracja')
     ylabel('b��d')
     grid minor
     legend( '\lambda zmniejszana w ka�dej iteracji', 'Location' , 'southwest');
     text(-0.2,1.2, 'Algorytm additive ART', 'HorizontalAlignment', 'center',...
        'FontSize', 16 , 'Units', 'normalized');
end

