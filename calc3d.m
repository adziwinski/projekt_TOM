function [ y ] = calc3d(A,G,x)
        yyy1 = ((-(A(1,1))*x) + (-(A(1,3))*x) + G(1,1)) / A(1,2);
        yyy2 = ((-(A(2,1))*x) + (-(A(2,3))*x) + G(2,1)) / A(2,2);
        
        aSize = size(A(:,1));

        for i=1:aSize(1)
            y(:,i) = ((-(A(i,1))*x) + (-(A(i,3))*x) + G(i,1)) / A(i,2);
        end
        y=y';
end

