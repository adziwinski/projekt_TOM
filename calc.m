function [ y ] = calc(A,G,x)
%please use this function ony when x have same lenght as A,and G
    gSize=size(G(:,1));
    newG = ones(gSize(1));    
    i=1;
    while(i<=gSize(1))
        newG(:,i)=G;
        i=i+1;
    end
    
    aSize=size(A(:,2));
    newA = ones(aSize(1));    
    i=1;
    while(i<=aSize(1))
        newA(:,i)=A(:,2);
        i=i+1;
    end
    
    y1 = -(A(:,1)*x);
    y2 = y1+newG;
    y = newA.\y2;
end

