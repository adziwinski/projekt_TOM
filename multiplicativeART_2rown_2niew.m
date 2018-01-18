function [ ] = multiplicativeART_2rown_2niew(A,G,F,x, errorSize)
%UNTITLED3 Summary of this function goes hereinput_args
%   Detailed explanation goes here
y = calc2(A,G,x);


        F1 = [1.5; 1.5];
        p = 0.8;
        blad = [0; 0];
        rozwiazanie(1,:) = F1;
        
        error = 1;
        i=1;
        while error>errorSize
            for j=1:1:size(F1,1)
                f2_1 = F1(j,1) * (G(j,1) / (A(j,:) * F1)) ^ p;
                blad(i,j) = G(j,1) - (A(j,:) * F1);
                F1(j,1) = f2_1;
            end
            error = blad(i,j);    
            rozwiazanie(i+1,:) = F1;
            i=i+1;
        end
        iteracje = 1:i-1;
       
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
         plot(rozwiazanie(:,1),rozwiazanie(:,2), 'ko--');
         hold off;
         axis('square')
         axis([0.9 2 0.9 2])
         set(0, 'defaultTextFontSize',10);
         text(1.5,1.5,'Punkt startowy (1,5, 1,5)  ','HorizontalAlignment', 'right')
         T = {'Interpretacja graficzna'};
         title(T)
         xlabel('x')
         ylabel('y')
         grid on
         grid minor
         
        subplot(1,2,2)
         semilogy(iteracje, abs(blad(:,1)), 'x-.');
         axis('square')
         title('B³¹d oszacowania i-tej iteracji');
         xlabel('i')
         ylabel('b³¹d')
         grid on
         grid minor
         
         hold on;
         semilogy(iteracje, abs(blad(:,2)), 'rx-.');
         hold off;
         legend('równanie nr 1','równanie nr 2');
         
         text(-0.2,1.2, 'Algorytm multiplicative ART', 'HorizontalAlignment', 'center',...
            'FontSize', 16 , 'Units', 'normalized');
end

