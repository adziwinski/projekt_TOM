clc
clear all
close all
choice1=menu({' Wybierz uk�ad r�wna�, kt�ry chcesz rozwi�za�'}, 'Dwa r�wnania, dwie niewiadome','trzy r�wnania, dwie niewiadome', 'dwa r�wnania, trzy niewiadome');
choice2=menu({' Wybierz metod� rozwi�zania'}, 'Additive ART','Multiadditive ART');

% 2 r�wnania 2 niewiadome

switch choice1
    case 1 %Dwa r�wnania, dwie niewiadome
        A = [ 5.05 0.5; 0.1 1];
        G = [8.5; 2];
        F = A\G;
        FP = pinv(A)*G; % pseudoodwrotno��

        x = 0.9:0.1:2;
        
        switch choice2
            case 1 % additive ART
                additiveART_2rown_2niew( A,G,F,x,10^(-9));
            case 2 % multiadditiveART
                multiplicativeART_2rown_2niew(A,G,F,x);    
        end
        
    case 2 %trzy r�wnania, dwie niewiadome
        
    case 3 %dwa r�wnania, trzy niewiadome
end
    
%% Pytania:
% Czy ja te rozwi�zania w dobrym miejscu wpisuj� do puli rozwi�za�?
% Wydaje mi si�, �e dobrze, bo pierwsza AA ART wykonuje od razu zmian� 
% x i y, a MART wykonuje najpierw x a w nast�pnym kroku dopiero y

% Jak zrobi� 2 r�wnania i 3 niewiadome??
% Jaki jest z??h
%% 3 r�wnania 2 niewiadome

        AA = [5.05 0.5; 0.1 1; 2 1];
        GG = [8.8421; 1.9721; 4.3452];
        FF = AA\GG; % r�wnanie jest sprzeczne. FF to rozwi�zanie �redniokwadratowe
        
        % rysowanie wykresu
        xx = 1:0.5:2;
        yy = calc2(AA,GG,xx);
        
        figure;
        plot(xx, yy(1,:), xx, yy(2,:), xx, yy(3,:), FF(1,1), FF(2,1), 'ko')
        grid on
        grid minor
% 
% %% 2 r�wnania 3 niewiadome
% 
%         %AAA = [5.05 0.5 1; 0.1 1 2]; %wychodzi �le
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

