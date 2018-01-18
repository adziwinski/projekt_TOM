function [ y ] = calc3d(A,G,x)
        
        aSize = size(A(:,1));

        for i=1:aSize(1)
            y(:,i) = ((-(A(i,1))*x) + (-(A(i,3))*x) + G(i,1)) / A(i,2);
        end
        y=y';
end

