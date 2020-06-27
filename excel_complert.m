function excel_complert(nomcsv,nomcsv_linees,nom_excel,nomimatgea,nomimatgep,nomcsvrota)
%Iniciem llegint i fent transformacions de coordenades
[nas,adh,potaE,potaD,potae,potad,cua,ficua]=llegir_dades(nomcsv);
[x1,x2,x3,x4]=punts_linees(nomcsv_linees);
C=matriu_transformacio(x1,x2,x3,x4);
[nasX,nasY,adhX,adhY,potaEX,potaEY,potaDX,potaDY,potaeX,potaeY,potadX,potadY,cuaX,cuaY,ficuaX,ficuaY]=canvi_a_cm(C,nas,adh,potaE,potaD,potae,potad,cua,ficua);
time=(1:length(nasX))/25;
%Eliminació de pics
nasX=neteja_dades(nasX);        nasY=neteja_dades(nasY);
adhX=neteja_dades(adhX);        adhY=neteja_dades(adhY);
potaDX=neteja_dades(potaDX);    potaEY=neteja_dades(potaEY);
potaEX=neteja_dades(potaEX);    potaEY=neteja_dades(potaEY);
potadX=neteja_dades(potadX);    potadY=neteja_dades(potadY);
potaeX=neteja_dades(potaeX);    potaeY=neteja_dades(potaeY);
cuaX=neteja_dades(cuaX);        cuaY=neteja_dades(cuaY);
ficuaX=neteja_dades(ficuaX);    ficuaY=neteja_dades(ficuaY);
%filtre 5 punts
nasX=filtre_5_punts(nasX);      nasY=filtre_5_punts(nasY);
adhX=filtre_5_punts(adhX);      adhY=filtre_5_punts(adhY);
potaDX=filtre_5_punts(potaDX);  potaEY=filtre_5_punts(potaEY);
potaEX=filtre_5_punts(potaEX);  potaEY=filtre_5_punts(potaEY);
potadX=filtre_5_punts(potadX);  potadY=filtre_5_punts(potadY);
potaeX=filtre_5_punts(potaeX);  potaeY=filtre_5_punts(potaeY);
cuaX=filtre_5_punts(cuaX);      cuaY=filtre_5_punts(cuaY);
ficuaX=filtre_5_punts(ficuaX);  ficuaY=filtre_5_punts(ficuaY);
%Cŕlcul de velocitats
CENTREX=(potaEX+potaDX+potaeX+potadX)/4;
CENTREY=(potaEY+potaDY+potaeY+potadY)/4;
Modul_velocitat=sqrt(((CENTREX(2:end)-CENTREX(1:end-1))*25).^2+((CENTREY(2:end)-CENTREY(1:end-1))*25).^2);
Modul_velocitat=filtre_5_punts(Modul_velocitat);
timeV=[1:length(Modul_velocitat)]/25;
vx=((CENTREX(2:end)-CENTREX(1:end-1)))*25;
vx=filtre_5_punts(vx);
vy=((CENTREY(2:end)-CENTREY(1:end-1)))*25;
vy=filtre_5_punts(vy);
posicioA_1=sqrt((adhX(1:end-1)).^2+(adhY(1:end-1)).^2);
posicioA_2=sqrt((adhX(2:end)).^2+(adhY(2:end)).^2);
velocitatA=(posicioA_2-posicioA_1)*25;
velocitat_nas=sqrt(((nasX(2:end)-nasX(1:end-1))*25).^2+((nasY(2:end)-nasY(1:end-1))*25).^2);
velocitatpotaE=sqrt(((potaEX(2:end)-potaEX(1:end-1))*25).^2+((potaEY(2:end)-potaEY(1:end-1))*25).^2);
velocitatpotaD=sqrt(((potaDX(2:end)-potaDX(1:end-1))*25).^2+((potaDY(2:end)-potaDY(1:end-1))*25).^2);
velocitatpotae=sqrt(((potaeX(2:end)-potaeX(1:end-1))*25).^2+((potaeY(2:end)-potaeY(1:end-1))*25).^2);
velocitatpotad=sqrt(((potadX(2:end)-potadX(1:end-1))*25).^2+((potadY(2:end)-potadY(1:end-1))*25).^2);
velocitatcua=sqrt(((cuaX(2:end)-cuaX(1:end-1))*25).^2+((cuaY(2:end)-cuaY(1:end-1))*25).^2);
%Cŕlcul de distancies
distanciamorro=sqrt((nasX-adhX).^2+(nasY-adhY).^2);
distanciapotes=sqrt((potaEX-potaDX).^2+(potaEY-potaDY).^2);
distanciaadhD=sqrt((potaDX-adhX).^2+(potaDY-adhY).^2);
distanciaadhE=sqrt((potaEX-adhX).^2+(potaEY-adhY).^2);

%Resultats Tape-Removal
[Deteccio,Treu]=tape_removal(nomcsv,nomcsv_linees);

%Altres Propietats
x=Modul_velocitat>1;
temps_quiet=sum(x)/length(Modul_velocitat);
Velocitat_mitjana=Modul_velocitat(x);   velocitat_mitjana=mean(Velocitat_mitjana);
Velocitat_morro=velocitat_nas(x);   velocitat_morro=mean(Velocitat_morro);
Velocitat_potaD=velocitatpotaD(x);  velocitat_potaD=mean(Velocitat_potaD);
Velocitat_potaE=velocitatpotaE(x);  velocitat_potaE=mean(Velocitat_potaE);
Velocitat_potad=velocitatpotad(x);  velocitat_potad=mean(Velocitat_potad);
Velocitat_potae=velocitatpotae(x);  velocitat_potae=mean(Velocitat_potae);  
Velocitat_cul=velocitatcua(x);      velocitat_cul=mean(Velocitat_cul);
distancia_potes_mig=mean(distanciapotes);
distancia_adh_morro=mean(distanciamorro);

a=zeros(1,length(nasX));
for p=1:length(nasX)
    x12=nasX(p)-cuaX(p); y12=nasY(p)-cuaY(p);
    x32=ficuaX(p)-cuaX(p); y32=ficuaY(p)-cuaY(p);
    ang = mod(atan2(x12*y32-x32*y12,x12*x32+y12*y32),2*pi);
    a(p)=ang;
end
a=a*180/pi;
a=a-180;

angle_mig=mean(a);
temps_angle_0positiu=sum(a>0)/length(a);
temps_angle_0negatiu=1-temps_angle_0positiu;

%Càlcul regioó infartada (Imatges)
if nomimatgea==0 | nomimatgep==0
    AreaInfartada1=0;   AreaInfartada1V=0;
    AreaInfartada2=0;   AreaInfartada2V=0;
    AreaInfartada3=0;   AreaInfartada3V=0;
    AreaInfartada4=0;   AreaInfartada4V=0;
    AreaInfartada5=0;   AreaInfartada5V=0;
    AreaInfartada6=0;   AreaInfartada6V=0;
    AreaInfartada7=0;   AreaInfartada7V=0;
    AreaInfartada8=0;   AreaInfartada8V=0;
    
    AreaIpsi1=0;        AreaIpsiV1=0;
    AreaIpsi2=0;        AreaIpsiV2=0;
    AreaIpsi3=0;        AreaIpsiV3=0;
    AreaIpsi4=0;        AreaIpsiV4=0;
    AreaIpsi5=0;        AreaIpsiV5=0;
    AreaIpsi6=0;        AreaIpsiV6=0;
    AreaIpsi7=0;        AreaIpsiV7=0;
    AreaIpsi8=0;        AreaIpsiV8=0;
    
    AreaContra1=0;      AreaContraV1=0;
    AreaContra2=0;      AreaContraV2=0;
    AreaContra3=0;      AreaContraV3=0;
    AreaContra4=0;      AreaContraV4=0;
    AreaContra5=0;      AreaContraV5=0;
    AreaContra6=0;      AreaContraV6=0;
    AreaContra7=0;      AreaContraV7=0;
    AreaContra8=0;      AreaContraV8=0;
    
    densitat_pixelsa=1;  densitat_pixelsp=1;
    
    Rati1=0;            Rati1V=0;
    Rati2=0;            Rati2V=0;
    Rati3=0;            Rati3V=0;
    Rati4=0;            Rati4V=0;
    Rati5=0;            Rati5V=0;
    Rati6=0;            Rati6V=0;
    Rati7=0;            Rati7V=0;
    Rati8=0;            Rati8V=0;
else
[AreaInfartada1,AreaInfartada3,AreaInfartada5,AreaInfartada7,AreaInfartada1V,AreaInfartada3V,AreaInfartada5V,AreaInfartada7V,densitat_pixelsa,AreaIpsi1,AreaIpsi3,AreaIpsi5,AreaIpsi7,AreaIpsiV1,AreaIpsiV3,AreaIpsiV5,AreaIpsiV7,AreaContra1,AreaContra3,AreaContra5,AreaContra7,AreaContraV1,AreaContraV3,AreaContraV5,AreaContraV7,Rati1,Rati3,Rati5,Rati7,Rati1V,Rati3V,Rati5V,Rati7V]=imatges(nomimatgea);
[AreaInfartada2,AreaInfartada4,AreaInfartada6,AreaInfartada8,AreaInfartada2V,AreaInfartada4V,AreaInfartada6V,AreaInfartada8V,densitat_pixelsp,AreaIpsi2,AreaIpsi4,AreaIpsi6,AreaIpsi8,AreaIpsiV2,AreaIpsiV4,AreaIpsiV6,AreaIpsiV8,AreaContra2,AreaContra4,AreaContra6,AreaContra8,AreaContraV2,AreaContraV4,AreaContraV6,AreaContraV8,Rati2,Rati4,Rati6,Rati8,Rati2V,Rati4V,Rati6V,Rati8V]=imatges(nomimatgep);
end
densitat_pixelsa=23.7;
densitat_pixelsp=24;
AreaInfartadamm1=AreaInfartada1/(densitat_pixelsa^2);   AreaInfartadamm1V=AreaInfartada1V/(densitat_pixelsa^2);   
AreaInfartadamm2=AreaInfartada2/(densitat_pixelsp^2);   AreaInfartadamm2V=AreaInfartada2V/(densitat_pixelsp^2);
AreaInfartadamm3=AreaInfartada3/(densitat_pixelsa^2);   AreaInfartadamm3V=AreaInfartada3V/(densitat_pixelsa^2);
AreaInfartadamm4=AreaInfartada4/(densitat_pixelsp^2);   AreaInfartadamm4V=AreaInfartada4V/(densitat_pixelsp^2);
AreaInfartadamm5=AreaInfartada5/(densitat_pixelsa^2);   AreaInfartadamm5V=AreaInfartada5V/(densitat_pixelsa^2);
AreaInfartadamm6=AreaInfartada6/(densitat_pixelsp^2);   AreaInfartadamm6V=AreaInfartada6V/(densitat_pixelsp^2);
AreaInfartadamm7=AreaInfartada7/(densitat_pixelsa^2);   AreaInfartadamm7V=AreaInfartada7V/(densitat_pixelsa^2);
AreaInfartadamm8=AreaInfartada8/(densitat_pixelsp^2);   AreaInfartadamm8V=AreaInfartada8V/(densitat_pixelsp^2);

AreaIpsimm1=AreaIpsi1/(densitat_pixelsa^2);             AreaIpsimmV1=AreaIpsiV1/(densitat_pixelsa^2);
AreaIpsimm2=AreaIpsi2/(densitat_pixelsp^2);             AreaIpsimmV2=AreaIpsiV2/(densitat_pixelsp^2);
AreaIpsimm3=AreaIpsi3/(densitat_pixelsa^2);             AreaIpsimmV3=AreaIpsiV3/(densitat_pixelsa^2);
AreaIpsimm4=AreaIpsi4/(densitat_pixelsp^2);             AreaIpsimmV4=AreaIpsiV4/(densitat_pixelsp^2);
AreaIpsimm5=AreaIpsi5/(densitat_pixelsa^2);             AreaIpsimmV5=AreaIpsiV5/(densitat_pixelsa^2);
AreaIpsimm6=AreaIpsi6/(densitat_pixelsp^2);             AreaIpsimmV6=AreaIpsiV6/(densitat_pixelsp^2);
AreaIpsimm7=AreaIpsi7/(densitat_pixelsa^2);             AreaIpsimmV7=AreaIpsiV7/(densitat_pixelsa^2);
AreaIpsimm8=AreaIpsi8/(densitat_pixelsp^2);             AreaIpsimmV8=AreaIpsiV8/(densitat_pixelsp^2);

AreaContramm1=AreaContra1/(densitat_pixelsa^2);         AreaContrammV1=AreaContraV1/(densitat_pixelsa^2);
AreaContramm2=AreaContra2/(densitat_pixelsp^2);         AreaContrammV2=AreaContraV2/(densitat_pixelsp^2);
AreaContramm3=AreaContra3/(densitat_pixelsa^2);         AreaContrammV3=AreaContraV3/(densitat_pixelsa^2);
AreaContramm4=AreaContra4/(densitat_pixelsp^2);         AreaContrammV4=AreaContraV4/(densitat_pixelsp^2);
AreaContramm5=AreaContra5/(densitat_pixelsa^2);         AreaContrammV5=AreaContraV5/(densitat_pixelsa^2);
AreaContramm6=AreaContra6/(densitat_pixelsp^2);         AreaContrammV6=AreaContraV6/(densitat_pixelsp^2);
AreaContramm7=AreaContra7/(densitat_pixelsa^2);         AreaContrammV7=AreaContraV7/(densitat_pixelsa^2);
AreaContramm8=AreaContra8/(densitat_pixelsp^2);         AreaContrammV8=AreaContraV8/(densitat_pixelsp^2);

VolumInfartat=(AreaInfartadamm1+AreaInfartadamm2)*0.15+0.1*(AreaInfartadamm3+AreaInfartadamm4+AreaInfartadamm5+AreaInfartadamm6+AreaInfartadamm7+AreaInfartadamm8);
VolumIpsilateral=((AreaIpsimm1+AreaIpsimm2)*0.15+0.1*(AreaIpsimm3+AreaIpsimm4+AreaIpsimm5+AreaIpsimm6+AreaIpsimm7+AreaIpsimm8));
VolumContralateral=((AreaContramm1+AreaContramm2)*0.15+0.1*(AreaContramm3+AreaContramm4+AreaContramm5+AreaContramm6+AreaContramm7+AreaContramm8));
VolumInfart_corregit_edema=VolumInfartat*VolumContralateral/VolumIpsilateral;
Edemacervell_sencer=((VolumIpsilateral-VolumContralateral)/(VolumIpsilateral+VolumContralateral))*100;

VolumInfartatV=((AreaInfartadamm1V+AreaInfartadamm2V)*0.15+0.1*(AreaInfartadamm3V+AreaInfartadamm4V+AreaInfartadamm5V+AreaInfartadamm6V+AreaInfartadamm7V+AreaInfartadamm8V));
VolumIpsilateralV=((AreaIpsimmV1+AreaIpsimmV2)*0.15+0.1*(AreaIpsimmV3+AreaIpsimmV4+AreaIpsimmV5+AreaIpsimmV6+AreaIpsimmV7+AreaIpsimmV8));
VolumContralateralV=((AreaContrammV1+AreaContrammV2)*0.15+0.1*(AreaContrammV3+AreaContrammV4+AreaContrammV5+AreaContrammV6+AreaContrammV7+AreaContrammV8));
VolumInfart_corregit_edemaV=VolumInfartatV*VolumContralateralV/VolumIpsilateralV;
Edemacervell_sencerV=((VolumIpsilateralV-VolumContralateralV)/(VolumIpsilateralV+VolumContralateralV))*100;

%Resultats Rotarot
numero=split(nomcsv,'-');   numero=numero(1);       numero=string(numero);
numero=str2num(numero);     numero=numero-601;      numero=mod(numero,4);   
if numero==0
    numero=4;
end
TEMPS1=rotarot(nomcsvrota);
Temps=TEMPS1(numero);

%Fiquem les dades a l'excel
excel_propietats(nom_excel,nomcsv,AreaInfartada1,AreaInfartada2,AreaInfartada3,AreaInfartada4,AreaInfartada5,AreaInfartada6,AreaInfartada7,AreaInfartada8,AreaInfartadamm1,AreaInfartadamm2,AreaInfartadamm3,AreaInfartadamm4,AreaInfartadamm5,AreaInfartadamm6,AreaInfartadamm7,AreaInfartadamm8,Rati1,Rati2,Rati3,Rati4,Rati5,Rati6,Rati7,Rati8,AreaIpsi1,AreaIpsi2,AreaIpsi3,AreaIpsi4,AreaIpsi5,AreaIpsi6,AreaIpsi7,AreaIpsi8,AreaIpsimm1,AreaIpsimm2,AreaIpsimm3,AreaIpsimm4,AreaIpsimm5,AreaIpsimm6,AreaIpsimm7,AreaIpsimm8,AreaContra1,AreaContra2,AreaContra3,AreaContra4,AreaContra5,AreaContra6,AreaContra7,AreaContra8,AreaContramm1,AreaContramm2,AreaContramm3,AreaContramm4,AreaContramm5,AreaContramm6,AreaContramm7,AreaContramm8,VolumInfartat,VolumIpsilateral,VolumContralateral,VolumInfart_corregit_edema,Edemacervell_sencer,AreaInfartada1V,AreaInfartada2V,AreaInfartada3V,AreaInfartada4V,AreaInfartada5V,AreaInfartada6V,AreaInfartada7V,AreaInfartada8V,AreaInfartadamm1V,AreaInfartadamm2V,AreaInfartadamm3V,AreaInfartadamm4V,AreaInfartadamm5V,AreaInfartadamm6V,AreaInfartadamm7V,AreaInfartadamm8V,Rati1V,Rati2V,Rati3V,Rati4V,Rati5V,Rati6V,Rati7V,Rati8V,AreaIpsiV1,AreaIpsiV2,AreaIpsiV3,AreaIpsiV4,AreaIpsiV5,AreaIpsiV6,AreaIpsiV7,AreaIpsiV8,AreaIpsimmV1,AreaIpsimmV2,AreaIpsimmV3,AreaIpsimmV4,AreaIpsimmV5,AreaIpsimmV6,AreaIpsimmV7,AreaIpsimmV8,AreaContraV1,AreaContraV2,AreaContraV3,AreaContraV4,AreaContraV5,AreaContraV6,AreaContraV7,AreaContraV8,AreaContrammV1,AreaContrammV2,AreaContrammV3,AreaContrammV4,AreaContrammV5,AreaContrammV6,AreaContrammV7,AreaContrammV8,VolumInfartatV,VolumIpsilateralV,VolumContralateralV,VolumInfart_corregit_edemaV,Edemacervell_sencerV,Deteccio,Treu,temps_quiet,velocitat_mitjana,velocitat_morro,velocitat_potaD,velocitat_potaE,velocitat_potad,velocitat_potae,velocitat_cul,distancia_potes_mig,distancia_adh_morro,angle_mig,temps_angle_0positiu,temps_angle_0negatiu,Temps)
