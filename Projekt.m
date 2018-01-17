clc
clear all
close all

choice=menu({'Welcome!';' Please select your solution'},'2 equation, 2 unknown', 'Additive ART','Multiadditive ART', ...
' 3 equation, 2 unknown', '2 equation, 3 unknown');

% 2 równania 2 niewiadome

A = [ 5.05 0.5; 0.1 1];
G = [8.5; 2];
F = A\G;
FP = pinv(A)*G; % pseudoodwrotnoœæ

x = 0.9:0.1:2;

y = calc2(A,G,x);
        
switch choice
    case 1
        % Rysowanie wykresu

        figure;
        plot(x, y(1,:), x, y(2,:), F(1,1), F(2,1), 'ko');       
        axis([0.9 2 0.9 2])
        grid on
        grid minor

    case 2
        %% Additive ART

        F1 = [1; 1];
        lambda = 1;
        k1 = 1;
        l1 = 1;
        ROZW1(k1,:) = F1;
        k1=k1+1;
        for i=1:1:5
            for j=1:1:size(F1,1)
                f1_1 = F1 + (lambda * ((G(j) - (A(j,:)) * F1) / (A(j,:) * A(j,:)')) * A(j,:)');
                blad1(l1,j) = G(j) - (A(j,:) * F1);
                F1 = f1_1;
                ROZW1(k1,:) = F1;
                k1=k1+1;
            end
            l1=l1+1;
        end

        iteracje = 1:(l1-1);

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
         plot(ROZW1(:,1),ROZW1(:,2), 'ko--');
         hold off;
         axis('square')
         axis([0.9 2 0.9 2])
         set(0, 'defaultTextFontSize',10);
         text(0.9,0.65,'Punkt startowy (1, 1)')
         T = {'Ortogonalne rzutowanie punktu na proste'; 
         'odpowiadaj¹ce dwóm równaniom';
         'uk³adu z dwiema niewiadomymi'};
         title(T)
         xlabel('x')
         ylabel('y')
         grid on
         grid minor
         
        subplot(1,2,2)
         semilogy(iteracje, abs(blad1(:,1)), 'x-.');
         axis('square')
         title('B³¹d oszacowania i-tej iteracji');
         xlabel('i')
         ylabel('b³¹d')
         grid on
         grid minor
         
         hold on;
         semilogy(iteracje, abs(blad1(:,2)), 'rx-.');
         hold off;
         legend('równanie nr 1','równanie nr 2');
         
         text(-0.2,1.2, 'Algorytm additive ART', 'HorizontalAlignment', 'center',...
            'FontSize', 16 , 'Units', 'normalized');
        
        % subplot(2,3,4)
        %  z = zeros(1,size(x,2));
        %  zet = zeros(size(ROZW1,1),1);
        %  plot3(x,y1,z, x,y2,z, ROZW1(:,1),ROZW1(:,2),zet, 'ko--')
        %  axis('square')
        %  axis([0.9 2 0.9 2])
        %  grid on
        %  grid minor


    case 3
%% Multiadditive ART
        F2 = [1.5; 1.5];
        p = 0.8;
        blad2 = [0; 0];
        k2 = 1;
        ROZW2(k2,:) = F2;
        blad2(k2,1) = G(1,1) - (A(1,:) * F2);
        blad2(k2,2) = G(2,1) - (A(2,:) * F2);
        k2=k2+1;
        for i=1:1:10
            for j=1:1:size(F2,1)
                f2_1 = F2(j,1) * (G(j,1) / (A(j,:) * F2)) ^ p;
                blad2(i,j) = G(j,1) - (A(j,:) * F2);
                F2(j,1) = f2_1;
            end
            ROZW2(k2,:) = F2;
            k2=k2+1;
        end
        iteracje2 = 1:i;
       
        % Rysowanie wykresu
        screenSize = get(groot,'ScreenSize');
        windowHigh = screenSize(4);
        windowSize = screenSize;
        windowSize(4) = windowHigh * 0.9;
        figure('Name','Algorytm Multiplicative ART','pos',windowSize);

        subplot(1,2,1)
         plot(x, y(1,:),'b');
         hold on;
         plot(x, y(2,:), 'r');
         plot(ROZW2(:,1),ROZW2(:,2), 'ko--');
         hold off;
         axis('square')
         axis([0.9 2 0.9 2])
         set(0, 'defaultTextFontSize',10);
         text(0.9,0.65,'Punkt startowy (1, 1)')
         T = {'Zabaczymy jaki tytul '};
         title(T)
         xlabel('x')
         ylabel('y')
         grid on
         grid minor
         
        subplot(1,2,2)
         semilogy(iteracje2, abs(blad2(:,1)), 'x-.');
         axis('square')
         title('B³¹d oszacowania i-tej iteracji');
         xlabel('i')
         ylabel('b³¹d')
         grid on
         grid minor
         
         hold on;
         semilogy(iteracje2, abs(blad2(:,2)), 'rx-.');
         hold off;
         legend('równanie nr 1','równanie nr 2');
         
         text(-0.2,1.2, 'Algorytm multiplicative ART', 'HorizontalAlignment', 'center',...
            'FontSize', 16 , 'Units', 'normalized');
        

%% Pytania:
% Czy ja te rozwi¹zania w dobrym miejscu wpisujê do puli rozwi¹zañ?
% Wydaje mi siê, ¿e dobrze, bo pierwsza AA ART wykonuje od razu zmianê 
% x i y, a MART wykonuje najpierw x a w nastêpnym kroku dopiero y

% Jak zrobiæ 2 równania i 3 niewiadome??
% Jaki jest z??h
%% 3 równania 2 niewiadome
    case 4
        AA = [5.05 0.5; 0.1 1; 2 1];
        GG = [8.8421; 1.9721; 4.3452];
        FF = AA\GG; % równanie jest sprzeczne. FF to rozwi¹zanie œredniokwadratowe
        
        % rysowanie wykresu
        xx = 1:0.5:2;
        yy = calc2(AA,GG,xx);
        
        figure;
        plot(xx, yy(1,:), xx, yy(2,:), xx, yy(3,:), FF(1,1), FF(2,1), 'ko')
        grid on
        grid minor

%% 2 równania 3 niewiadome
    case 5
        %AAA = [5.05 0.5 1; 0.1 1 2]; %wychodzi Ÿle
        AAA = [5.05 0.5 2; 0.1 1 1]; %wychodzi dobrze
        GGG = [8.5; 2];
        FFF = AAA\GGG;

        % rysowanie wykresu
        xxx = 1:0.01:2;
        zzz = 1:0.01:2;
        yyy1 = ((-(AAA(1,1))*xxx) + (-(AAA(1,3))*xxx) + GGG(1,1)) / AAA(1,2);
        yyy2 = ((-(AAA(2,1))*xxx) + (-(AAA(2,3))*xxx) + GGG(2,1)) / AAA(2,2);

        figure; 
%         mesh(xxx, yyy1, zzz)
%          mesh(xxx, yyy1, z??, xxx, yyy2, z??, FFF(1,1), FFF(2,1), FFF(3,1), 'ko')
%         grid on
%         grid minor

end 