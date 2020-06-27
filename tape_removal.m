function [Deteccio,Treu]=tape_removal(nomcsv,nomcsv_linees)
%Llegim dades
[nas,adh,potaE,potaD,potae,potad,cua,ficua]=llegir_dades(nomcsv);
[x1,x2,x3,x4]=punts_linees(nomcsv_linees);
C=matriu_transformacio(x1,x2,x3,x4);
[nasX,nasY,adhX,adhY,potaEX,potaEY,potaDX,potaDY,potaeX,potaeY,potadX,potadY,~,~,~,~]=canvi_a_cm(C,nas,adh,potaE,potaD,potae,potad,cua,ficua);
time=(1:length(nasX))/25;
%filtre de pic
nasX=neteja_dades(nasX);        nasY=neteja_dades(nasY);
adhX=neteja_dades(adhX);        adhY=neteja_dades(adhY);
potaDX=neteja_dades(potaDX);    potaEY=neteja_dades(potaEY);
potaEX=neteja_dades(potaEX);    potaEY=neteja_dades(potaEY);
potadX=neteja_dades(potadX);    potadY=neteja_dades(potadY);
potaeX=neteja_dades(potaeX);    potaeY=neteja_dades(potaeY);
%filtre 5 punts
nasX=filtre_5_punts(nasX);      nasY=filtre_5_punts(nasY);
adhX=filtre_5_punts(adhX);      adhY=filtre_5_punts(adhY);
potaDX=filtre_5_punts(potaDX);  potaEY=filtre_5_punts(potaEY);
potaEX=filtre_5_punts(potaEX);  potaEY=filtre_5_punts(potaEY);
potadX=filtre_5_punts(potadX);  potadY=filtre_5_punts(potadY);
potaeX=filtre_5_punts(potaeX);  potaeY=filtre_5_punts(potaeY);
%Càlcul de velocitats
CENTREX=(potaEX+potaDX+potaeX+potadX)/4;
CENTREY=(potaEY+potaDY+potaeY+potadY)/4;
Modul_velocitat=sqrt(((CENTREX(2:end)-CENTREX(1:end-1))*25).^2+((CENTREY(2:end)-CENTREY(1:end-1))*25).^2);
Modul_velocitat=filtre_5_punts(Modul_velocitat);
posicioA_1=sqrt((adhX(1:end-1)).^2+(adhY(1:end-1)).^2);
posicioA_2=sqrt((adhX(2:end)).^2+(adhY(2:end)).^2);
velocitatA=(posicioA_2-posicioA_1)*25;
velocitat_nas=sqrt(((nasX(2:end)-nasX(1:end-1))*25).^2+((nasY(2:end)-nasY(1:end-1))*25).^2);
velocitatpotaE=sqrt(((potaEX(2:end)-potaEX(1:end-1))*25).^2+((potaEY(2:end)-potaEY(1:end-1))*25).^2);
velocitatpotaD=sqrt(((potaDX(2:end)-potaDX(1:end-1))*25).^2+((potaDY(2:end)-potaDY(1:end-1))*25).^2);
%Càlcul de velocitats
distanciamorro=sqrt((nasX-adhX).^2+(nasY-adhY).^2);
distanciapotes=sqrt((potaEX-potaDX).^2+(potaEY-potaDY).^2);
distanciaadhD=sqrt((potaDX-adhX).^2+(potaDY-adhY).^2);
distanciaadhE=sqrt((potaEX-adhX).^2+(potaEY-adhY).^2);
%Busquem deteccions i quan es treu l'adhesiu
p=round(time(end));
i=0;    j=0;    k=0;    
g=-1;   h=-1;   c=0;    
pii=NaN;    pj=NaN;     pk=NaN;
flag=0;
detec=[];
%Busquem quina pota porta l'adhesiu
if mean(distanciaadhE)<mean(distanciaadhD)
    disp('Adh-Esquerra')
    while p<(length(distanciaadhE)-5) && p<2000 && (mean(abs(Modul_velocitat))>1.4 || abs(mean(abs(Modul_velocitat))-mean(abs(velocitatpotaE)))<0.1 || mean(velocitatpotaE)>1.5)
        
        %Busquem detecció amb les potes
        if distanciapotes(p)<0.75 && distanciaadhE(p)<0.65
            j=j+1;
            %p
            %mean(abs(velocitatpotaE(p-10:p)))
            if j>=10 && mean(abs(velocitatpotaE(p-10:p)))>1.5
                pp=p;
                r=p+1000;
                %r=p+25*16;
                i=0;
                if mean(abs(velocitatpotaE(p-10:p)))>3
                    detec=[detec,(p-10)/30];
                end
                while pp<r && pp<length(distanciaadhE)
                   if (distanciaadhE(pp)>max(0.4,mean(distanciaadhE)+2/3*std(distanciaadhE)) && abs(velocitatA(pp))<1.5)
                        i=i+1;
                        if i==15
                        %Se l'ha tret
                            disp(strcat("S'ha adonat, fa servir les potes al segon ",num2str((p-15)/30)))
                            pj=(p-10)/30;
                            disp(strcat("S'ha tret l'adhesiu al segon ",num2str((pp-15)/30)))
                            pii=(pp-15)/30;
                            flag=1;
                            break
                        end
                    else
                        i=0;
                    end
                    pp=pp+1;
                end
            end
        else
            j=0;
        end
        %Amb el morro
        if distanciamorro(p)<0.75 && distanciaadhE(p)<0.65
            k=k+1;
            if k>=10 && mean(abs(velocitat_nas(p-10:p)))>0.5
                pm=p;
                %rm=p+25*15;
                rm=p+1000;
                i=0;
                if mean(abs(velocitat_nas(p-10:p)))>3
                    detec=[detec,(p-10)/30];
                end
                while pm<rm && pm<length(distanciaadhE)
                    if (distanciaadhE(pm)>max(0.4,mean(distanciaadhE)+2/3*std(distanciaadhE)) && abs(velocitatA(pm))<1.5)
                        i=i+1;
                        if i==15
                            disp(strcat("S'ha adonat, fa servir el morro al segon ",num2str((p-10)/30)))
                            pj=(p-10)/30;
                            disp(strcat("S'ha tret l'adhesiu al segon ",num2str((pm-15)/30)))
                            pii=(pm-15)/30;
                            flag=1;
                            break
                        end
                    else
                        i=0;
                    end
                    pm=pm+1;
                end
            end
        else
            k=0;
        end
        if flag==1
            break
        end
        p=p+1;
    end
%Repetició per l'altre pota
elseif mean(distanciaadhE)>mean(distanciaadhD)
    disp('Adh-Dreta')
    while p<(length(distanciaadhE)-5) && p<2000 && (mean(abs(Modul_velocitat))>1.4 || abs(mean(abs(Modul_velocitat))-mean(abs(velocitatpotaD)))<0.1 || mean(velocitatpotaD)>1.5)
        if distanciapotes(p)<0.75 && distanciaadhD(p)<0.65
            j=j+1;
            if j>=10 && mean(abs(velocitatpotaD(p-10:p)))>1.5
                pp=p;
                %r=p+25*16;
                r=p+1500;
                i=0;
                if mean(abs(velocitatpotaD(p-10:p)))>3
                    detec=[detec,(p-10)/30];
                end
                while pp<r && pp<length(distanciaadhE)
                   if (distanciaadhD(pp)>max(0.4,mean(distanciaadhD)+2/3*std(distanciaadhD)) && abs(velocitatA(pp))<1.5)
                        i=i+1;
                        if i==15
                            disp(strcat("S'ha adonat, fa servir les potes al segon ",num2str((p-10)/30)))
                            pj=(p-10)/30;
                            disp(strcat("S'ha tret l'adhesiu al segon ",num2str((pp-15)/30)))
                            pii=(pp-15)/30;
                            flag=1;
                            break
                        end
                    else
                        i=0;
                    end
                    pp=pp+1;
                end
            end
        else
            j=0;
        end

        if distanciamorro(p)<0.75 && distanciaadhD(p)<0.65
            k=k+1;
            if k>=10 && mean(abs(velocitat_nas(p-10:p)))>0.5
                pm=p;
                %rm=p+25*15;
                rm=p+1500;
                i=0;
                if mean(abs(velocitat_nas(p-10:p)))>3
                    detec=[detec,(p-10)/30];
                end
                while pm<rm && pm<length(distanciaadhE)
                    if (distanciaadhD(pm)>max(0.4,mean(distanciaadhD)+2/3*std(distanciaadhD)) && abs(velocitatA(pm)<1.5))
                        i=i+1;
                        if i==15
                            disp(strcat("S'ha adonat, fa servir el morro al segon ",num2str((p-10)/30)))
                            pj=(p-10)/30;
                            disp(strcat("S'ha tret l'adhesiu al segon ",num2str((pm-15)/30)))
                            pii=(pm-15)/30;
                            flag=1;
                            break
                        end
                    else
                        i=0;
                    end
                    pm=pm+1;
                end
            end
        else
            k=0;
        end
        if flag==1
            break
        end
        p=p+1;
    end 
end

if isnan(pk)
    pk=60;
end
if isnan(pj)
    pj=60;
end
if isnan(pii)
    pii=60;
end

Deteccio=min(pk,pj);
Treu=pii;
%Altres casos, quan no se l'ha tret o no l'ha detectat
if Deteccio==60 && Treu==60 && mean(distanciaadhE)<mean(distanciaadhD)
    for p=1:(length(velocitatA))
        if(distanciaadhE(p)>1.9 && abs(velocitatA(p))<1.5)
            c=c+1;
        else
            c=0;
        end

        if c==40
            disp(strcat("Se li ha caigut al segon ",num2str((p-40)/30)))
            Treu=(p-40)/30;
            break
        end
    end
end

if Deteccio==60 && Treu==60 && mean(distanciaadhD)<mean(distanciaadhE)
    for p=1:length(distanciaadhE)
        if(distanciaadhD(p)>2 && abs(velocitatA(p))<1.5)
            c=c+1;
        else
            c=0;
        end
%Se li ha caigut?
        if c==40
            disp(strcat("Se li ha caigut al segon ",num2str((p-40)/30)))
            Treu=(p-40)/30;
            break
        end
    end
end
    
if Deteccio==60 && Treu==60 && length(detec)>0
    Deteccio=min(detec);
end
