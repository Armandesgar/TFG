% Eliminació de pics
function dada=neteja_dades(dada)
error=10;
%Ho repetim fins que no trobi diferencies amb l'iteració anterior
while error>0.1
    DADA=dada;
    O=[];
    %Diferenta tipus de pics
    for o=[2:length(dada)-1]
        if abs(dada(o-1)-dada(o))>1 & abs(dada(o)-dada(o+1))>1
            O=[O,o];
        end
    end

    if length(O)>1
        if O(2)-O(1)~=1 
            o=O(1);
            dada(o)=(dada(o-1)+dada(o+1))/2;
        end
        for r=[2:length(O)]
            o=O(r);
            if O(r)-O(r-1)==1
                dada(o-1)=dada(o-2)+1/3*(dada(o+1)-dada(o-2));
                dada(o)=dada(o-2)+2/3*(dada(o+1)-dada(o-2));
            else
                dada(o)=(dada(o-1)+dada(o+1))/2;
            end
        end
    elseif length(O)==1
        o=O(1);
        dada(o)=(dada(o-1)+dada(o+1))/2;
    end
    for o=[2:length(dada)-3]
        %pic de dos punts
        if abs(dada(o-1)-dada(o))>1 & abs(dada(o)-dada(o+1))<1 & abs(dada(o)-dada(o+2))>1
            dada(o)=dada(o-1)+1/3*(dada(o+2)-dada(o-1));
            dada(o+1)=dada(o-1)+2/3*(dada(o+2)-dada(o-1));
        end
        %pics de tres punts
        if abs(dada(o-1)-dada(o))>1.5 & abs(dada(o)-dada(o+1))<1 & abs(dada(o)-dada(o+2))<1 & abs(dada(o)-dada(o+3))>1.5
            dada(o)=dada(o-1)+1/4*(dada(o+2)-dada(o-1));
            dada(o+1)=dada(o-1)+2/4*(dada(o+2)-dada(o-1));
            dada(o+2)=dada(o-1)+3/4*(dada(o+2)-dada(o-1));
        end
    end
    error=sum(abs(DADA-dada));
end
