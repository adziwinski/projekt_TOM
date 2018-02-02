clc
clear all
close all

while(1)
    choice1=menu({' Wybierz uk�ad r�wna�, kt�ry chcesz rozwi�za�'}, ...
    'Dwa r�wnania, dwie niewiadome','Trzy r�wnania, dwie niewiadome', ...
    'Dwa r�wnania, trzy niewiadome', 'Zako�cz');
    switch choice1
        case 1 %Dwa r�wnania, dwie niewiadome
            A = [ 5.05 0.5; 0.1 1];
            G = [8.5; 2];
            F = A\G;
            FP = pinv(A)*G; 
            x = 0.9:0.1:2;
            choice2=menu({' Wybierz metod� rozwi�zania'}, 'Pseudoodwrotno��', 'Additive ART','Multiplicative ART', 'Por�wnanie metod', 'Zako�cz');            
            switch choice2
                case 1
                    figure; % pseudoodwrotno��
                    y = calc2(A,G,x);
                    plot(x, y(1,:), x, y(2,:), F(1,1), F(2,1), 'ko')
                    axis([0.9 2 0.9 2])
                    grid on
                    grid minor
                    title('Pseudoodwrotno��');
                    set(0, 'defaultTextFontSize',10);
                    text(FP(1), FP(2), 'wynik  ', 'HorizontalAlignment', 'right');
                    xlabel('x');
                    ylabel('y');
                case 2 % additive ART
                    additiveART_2rown_2niew( A,G,F,x,10^(-8));
                case 3 % multiadditiveART
                    multiplicativeART_2rown_2niew(A,G,F,x,10^-9); 
                case 4 % por�wnanie metod
                    compare22(A,G,F,x,10^-9); 
                case 5
                    break;
            end


        case 2 %trzy r�wnania, dwie niewiadome
            clear all;
            A = [5.05 0.5; 0.1 1; 2 1];
            G = [8.8421; 1.9721; 4.3452];
            F = A\G; % r�wnanie jest sprzeczne. FF to rozwi�zanie �redniokwadratowe
            x = 1:0.5:2;
            FP = pinv(A)*G; 
            y = calc2(A,G,x);

            choice2=menu({' Wybierz metod� rozwi�zania'}, 'Pseudoodwrotno��', 'Additive ART','Multiplicative ART', 'Por�wnanie metod', 'Zako�cz');            
            switch choice2
                case 1
                    figure; % pseudoodwrotno��
                    plot(x, y(1,:), x, y(2,:), x, y(3,:), F(1,1), F(2,1), 'ko')
                    axis([0.9 2 0.9 2])
                    grid on
                    grid minor
                    title('Pseudoodwrotno��');
                    set(0, 'defaultTextFontSize',10);
                    text(FP(1), FP(2), 'wynik  ', 'HorizontalAlignment', 'right');
                    xlabel('x');
                    ylabel('y');
                case 2 % additive ART
                    additiveART_3rown_2niew( A,G,F,x,10^-9);
                case 3 % multiadditiveART
                    multiplicativeART_3rown_2niew(A,G,F,x,10^-9); 
                case 4 % por�wnanie metod
                    compare22(A,G,F,x,10^-9); 
                case 5
                    break;
            end
        case 3 %dwa r�wnania, trzy niewiadome
            %AAA = [5.05 0.5 1; 0.1 1 2]; %wychodzi �le
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
            title('Wykres 2d (dla por�wania)');
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
        case 4
            break;
    end
end