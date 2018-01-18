clc
clear all
close all
choice1=menu({' Wybierz uk³ad równañ, który chcesz rozwi¹zaæ'}, 'Dwa równania, dwie niewiadome','Trzy równania, dwie niewiadome', 'Dwa równania, trzy niewiadome');


% 2 równania 2 niewiadome

switch choice1
    case 1 %Dwa równania, dwie niewiadome
        A = [ 5.05 0.5; 0.1 1];
        G = [8.5; 2];
        F = A\G;
        FP = pinv(A)*G; % pseudoodwrotnoœæ

        x = 0.9:0.1:2;
        choice2=menu({' Wybierz metodê rozwi¹zania'}, 'Additive ART','Multiplicative ART ART');
        switch choice2
            case 1 % additive ART
                additiveART_2rown_2niew( A,G,F,x,10^(-9));
            case 2 % multiadditiveART
                multiplicativeART_2rown_2niew(A,G,F,x,10^-9);    
        end
        
    case 2 %trzy równania, dwie niewiadome
        clear all;
        A = [5.05 0.5; 0.1 1; 2 1];
        G = [8.8421; 1.9721; 4.3452];
        F = A\G; % równanie jest sprzeczne. FF to rozwi¹zanie œredniokwadratowe
        
        % rysowanie wykresu
        x = 1:0.5:2;
        y = calc2(A,G,x);
        
        figure;
        plot(x, y(1,:), x, y(2,:), x, y(3,:), F(1,1), F(2,1), 'ko')
        grid on
        grid minor
    case 3 %dwa równania, trzy niewiadome
        %AAA = [5.05 0.5 1; 0.1 1 2]; %wychodzi Ÿle
        clear all;
        A = [5.05 0.5 2; 0.1 1 1]; %wychodzi dobrze
        G = [8.5; 2];
        F = A\G;

        
        % rysowanie wykresu
        x = 0.9:0.1:2;
        y = calc3d(A,G,x);
        z = [-1,1,-1,1];
        
        figure;
        plot(x,y(1,:),x,y(2,:));
        xlabel('x');
        ylabel('y');
        title('Wykres 2d (dla porówania)');
        grid minor
        
        [X1 ,Z1] = meshgrid(x,z);
        [Y1 ,Z2] = meshgrid(y(1,:),z);
        figure;
        surf(X1,Y1,Z2);
        shading flat;
        alpha(0.5);
        hold on;
        [Y2 ,Z2] = meshgrid(y(2,:),z);
        surf(X1,Y2,Z2);
        colormap([0 0 1]);
        shading flat;
        alpha(0.5);
        hold off;
        grid minor
        xlabel('x');
        ylabel('y');
        zlabel('z');
        

end
    
% Pytania:
% Czy ja te rozwi¹zania w dobrym miejscu wpisujê do puli rozwi¹zañ?
% Wydaje mi siê, ¿e dobrze, bo pierwsza AA ART wykonuje od razu zmianê 
% x i y, a MART wykonuje najpierw x a w nastêpnym kroku dopiero y

% Jak zrobiæ 2 równania i 3 niewiadome??
% Jaki jest z??h


% %% 2 równania 3 niewiadome
% 


