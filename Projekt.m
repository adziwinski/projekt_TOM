clc
clear all
close all
choice1=menu({' Wybierz uk³ad równañ, który chcesz rozwi¹zaæ'}, 'Dwa równania, dwie niewiadome','trzy równania, dwie niewiadome', 'dwa równania, trzy niewiadome');
choice2=menu({' Wybierz metodê rozwi¹zania'}, 'Additive ART','Multiadditive ART');

% 2 równania 2 niewiadome

switch choice1
    case 1 %Dwa równania, dwie niewiadome
        A = [ 5.05 0.5; 0.1 1];
        G = [8.5; 2];
        F = A\G;
        FP = pinv(A)*G; % pseudoodwrotnoœæ

        x = 0.9:0.1:2;
        
        switch choice2
            case 1 % additive ART
                additiveART_2rown_2niew( A,G,F,x,10^(-9));
            case 2 % multiadditiveART
                multiplicativeART_2rown_2niew(A,G,F,x);    
        end
        
    case 2 %trzy równania, dwie niewiadome
        
    case 3 %dwa równania, trzy niewiadome
end
    
%% Pytania:
% Czy ja te rozwi¹zania w dobrym miejscu wpisujê do puli rozwi¹zañ?
% Wydaje mi siê, ¿e dobrze, bo pierwsza AA ART wykonuje od razu zmianê 
% x i y, a MART wykonuje najpierw x a w nastêpnym kroku dopiero y

% Jak zrobiæ 2 równania i 3 niewiadome??
% Jaki jest z??h
%% 3 równania 2 niewiadome

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
% 
% %% 2 równania 3 niewiadome
% 
%         %AAA = [5.05 0.5 1; 0.1 1 2]; %wychodzi Ÿle
%         AAA = [5.05 0.5 2; 0.1 1 1]; %wychodzi dobrze
%         GGG = [8.5; 2];
%         FFF = AAA\GGG;
% 
%         % rysowanie wykresu
%         xxx = 1:0.01:2;
%         zzz = 1:0.01:2;
%         yyy1 = ((-(AAA(1,1))*xxx) + (-(AAA(1,3))*xxx) + GGG(1,1)) / AAA(1,2);
%         yyy2 = ((-(AAA(2,1))*xxx) + (-(AAA(2,3))*xxx) + GGG(2,1)) / AAA(2,2);
% 
%         figure; 
% %         mesh(xxx, yyy1, zzz)
% %          mesh(xxx, yyy1, z??, xxx, yyy2, z??, FFF(1,1), FFF(2,1), FFF(3,1), 'ko')
% %         grid on
% %         grid minor

