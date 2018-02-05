function [ ] = additiveART_2rown_3niew( A,G,x,errorSize)
   
    z = 1:0.5:2;
    y = calc3d(A,G,x,z);

    % Rysowanie wykresu
    screenSize = get(groot,'ScreenSize');
    windowHigh = screenSize(4);
    windowSize = screenSize;
    windowSize(4) = windowHigh * 0.9;
    figure('Name','Algorytm Additive ART','pos',windowSize);
    [X1 ,~] = meshgrid(x,z);
    [Y1 ,Z2] = meshgrid(y(1,:),z);
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
    
    [rozwiazanie,blad,iteracje,lambda] = calcAA( A,G,errorSize, 30, 1, 1);
    
end

