function [ y ] = calc2(A,G,x)

    aSize = size(A(:,1));

    for i=1:aSize(1)
        y(:,i) = (-A(i,1)*x+G(i))/A(i,2);
    end

end

