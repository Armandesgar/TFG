function TEMPS=rotarot(nomcsvrota)
%Llegim dades
[Ratoli_1_Y,LRatoli_1,Ratoli_2_Y,LRatoli_2,Ratoli_3_Y,LRatoli_3,Ratoli_4_Y,LRatoli_4]=llegir_dades_rotarot(nomcsvrota);
%Filtre_5_punts
Ratoli_1_Y=filtre_5_punts(Ratoli_1_Y);
Ratoli_2_Y=filtre_5_punts(Ratoli_2_Y);
Ratoli_3_Y=filtre_5_punts(Ratoli_3_Y);
Ratoli_4_Y=filtre_5_punts(Ratoli_4_Y);

Likelyhood=[LRatoli_1,LRatoli_2,LRatoli_3,LRatoli_4];
Ratoli_Y=[Ratoli_1_Y;Ratoli_2_Y;Ratoli_3_Y;Ratoli_4_Y];
TEMPS=zeros(1,4);
for k=1:4
    L=Likelyhood(:,k);
    Y=Ratoli_Y(k,:);
    %Si la likelyhood és inferior no la tenim en compte
    if mean(L)>0.5
        for p=1:length(Y)
        %Si la posició Y és més gran que un cert threshold vol dir que ha caigut.
            if Y(p)>350 && mean(Y(p:p+50))>300
                TEMPS(k)=p/30;
                break
            end
        end
    end
end

