clc
clear all
close all

while(1)
    choice1=menu({' Wybierz uk�ad r�wna�, kt�ry chcesz rozwi�za�'}, ...
    'Dwa r�wnania, dwie niewiadome','Trzy r�wnania, dwie niewiadome', ...
    'Dwa r�wnania, trzy niewiadome', 'Zako�cz');
    switch choice1
        case 1 % dwa r�wnania, dwie niewiadome
            clear all
            close all
            A = [ 5.05 0.5; 0.1 1];
            G = [8.5; 2];
            x = 1.1:0.01:2.1;
            choice2=menu({' Wybierz metod� rozwi�zania'}, 'Pseudoodwrotno��', 'Additive ART','Multiplicative ART', 'Por�wnanie metod', 'Zako�cz');            
            switch choice2
                case 1
                    pseudoodwrotnosc22(A,G,x);
                case 2 % additive ART
                    additiveART_2rown_2niew( A,G,x,10^(-6));
                case 3 % multiadditive ART
                    multiplicativeART_2rown_2niew(A,G,x,10^(-6)); 
                case 4 % por�wnanie metod
                    compare22(A,G,x,10^(-6)); 
                case 5
                    break;
            end


        case 2 % trzy r�wnania, dwie niewiadome
            clear all
            close all
            A = [5.05 0.5; 0.1 1; 2 1];
            G = [8.8421; 1.9721; 4.3452];
            x = 0.9:0.01:2;

            choice2=menu({' Wybierz metod� rozwi�zania'}, 'Pseudoodwrotno��', 'Additive ART','Multiplicative ART', 'Por�wnanie metod', 'Zako�cz');            
            switch choice2
                case 1                  
                    pseudoodwrotnosc32(A,G,x);
                case 2 % additive ART
                    additiveART_3rown_2niew( A,G,x,10^(-6));
                case 3 % multiadditive ART
                    multiplicativeART_3rown_2niew(A,G,x,10^(-6)); 
                case 4 % por�wnanie metod
                    compare32(A,G,x,10^(-6)); 
                case 5
                    break;
            end
            
        case 3 % dwa r�wnania, trzy niewiadome
            clear all
            close all
            A = [5.05 0.5 2; 0.1 1 1];
            G = [8.5; 2];
            x = 0:0.01:2;
            z = 0:0.01:2;

            choice2=menu({' Wybierz metod� rozwi�zania'}, 'Pseudoodwrotno��', 'Additive ART','Multiplicative ART', 'Por�wnanie metod', 'Zako�cz');            
            switch choice2
                case 1
                    pseudoodwrotnosc23(A,G,x,z);
                case 2 % additive ART
                    additiveART_2rown_3niew(A,G,x,z,10^(-6));
                case 3 % multiadditive ART
                    multiplicativeART_2rown_3niew(A,G,x,z,10^(-6)); 
                case 4 % por�wnanie metod
                    compare23(A,G,x,z,10^(-6)); 
                case 5
                    break;
            end

        case 4
            break;
    end
end