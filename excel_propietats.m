function excel_propietats(nom_excel,nomcsv,Sup1,Sup2,Sup3,Sup4,Sup5,Sup6,Sup7,Sup8,Supmm1,Supmm2,Supmm3,Supmm4,Supmm5,Supmm6,Supmm7,Supmm8,Rati_V_1,Rati_V_2,Rati_V_3,Rati_V_4,Rati_V_5,Rati_V_6,Rati_V_7,Rati_V_8,areaIpsi1,areaIpsi2,areaIpsi3,areaIpsi4,areaIpsi5,areaIpsi6,areaIpsi7,areaIpsi8,areaIpsimm1,areaIpsimm2,areaIpsimm3,areaIpsimm4,areaIpsimm5,areaIpsimm6,areaIpsimm7,areaIpsimm8,areaContra1,areaContra2,areaContra3,areaContra4,areaContra5,areaContra6,areaContra7,areaContra8,areaContramm1,areaContramm2,areaContramm3,areaContramm4,areaContramm5,areaContramm6,areaContramm7,areaContramm8,volumInfartat,volumIpsilateral,volumContralateral,volumInfart_corregit_edema,edemacervell_sencer,Sup1V,Sup2V,Sup3V,Sup4V,Sup5V,Sup6V,Sup7V,Sup8V,Supmm1V,Supmm2V,Supmm3V,Supmm4V,Supmm5V,Supmm6V,Supmm7V,Supmm8V,Rati_V_1V,Rati_V_2V,Rati_V_3V,Rati_V_4V,Rati_V_5V,Rati_V_6V,Rati_V_7V,Rati_V_8V,areaIpsi1V,areaIpsi2V,areaIpsi3V,areaIpsi4V,areaIpsi5V,areaIpsi6V,areaIpsi7V,areaIpsi8V,areaIpsimm1V,areaIpsimm2V,areaIpsimm3V,areaIpsimm4V,areaIpsimm5V,areaIpsimm6V,areaIpsimm7V,areaIpsimm8V,areaContra1V,areaContra2V,areaContra3V,areaContra4V,areaContra5V,areaContra6V,areaContra7V,areaContra8V,areaContramm1V,areaContramm2V,areaContramm3V,areaContramm4V,areaContramm5V,areaContramm6V,areaContramm7V,areaContramm8V,volumInfartatV,volumIpsilateralV,volumContralateralV,volumInfart_corregit_edemaV,edemacervell_sencerV,Deteccio,treu,temps_quiet,velocitat_mitjana,velocitat_morro,velocitat_potaD,velocitat_potaE,velocitat_potad,velocitat_potae,velocitat_cul,distancia_potes_mig,distancia_adh_morro,angle_mig,temps_angle_0positiu,temps_angle_0negatiu,temps)
% Llegim dades

T = readtable(nom_excel);
NomComplert=T.NomComplert;

Superficie_1=T.Superficie_1;                Rati_Volum_Infartat_1=T.Rati_Volum_Infartat_1;
Superficie_2=T.Superficie_2;                Rati_Volum_Infartat_2=T.Rati_Volum_Infartat_2;
Superficie_3=T.Superficie_3;                Rati_Volum_Infartat_3=T.Rati_Volum_Infartat_3;
Superficie_4=T.Superficie_4;                Rati_Volum_Infartat_4=T.Rati_Volum_Infartat_4;
Superficie_5=T.Superficie_5;                Rati_Volum_Infartat_5=T.Rati_Volum_Infartat_5;
Superficie_6=T.Superficie_6;                Rati_Volum_Infartat_6=T.Rati_Volum_Infartat_6;
Superficie_7=T.Superficie_7;                Rati_Volum_Infartat_7=T.Rati_Volum_Infartat_7;
Superficie_8=T.Superficie_8;                Rati_Volum_Infartat_8=T.Rati_Volum_Infartat_8;

Superficiemm_1=T.Superficiemm_1;            
Superficiemm_2=T.Superficiemm_2;
Superficiemm_3=T.Superficiemm_3;
Superficiemm_4=T.Superficiemm_4;
Superficiemm_5=T.Superficiemm_5;
Superficiemm_6=T.Superficiemm_6;
Superficiemm_7=T.Superficiemm_7;
Superficiemm_8=T.Superficiemm_8;

Superficie_1V=T.Superficie_1V;                Rati_Volum_Infartat_1V=T.Rati_Volum_Infartat_1V;
Superficie_2V=T.Superficie_2V;                Rati_Volum_Infartat_2V=T.Rati_Volum_Infartat_2V;
Superficie_3V=T.Superficie_3V;                Rati_Volum_Infartat_3V=T.Rati_Volum_Infartat_3V;
Superficie_4V=T.Superficie_4V;                Rati_Volum_Infartat_4V=T.Rati_Volum_Infartat_4V;
Superficie_5V=T.Superficie_5V;                Rati_Volum_Infartat_5V=T.Rati_Volum_Infartat_5V;
Superficie_6V=T.Superficie_6V;                Rati_Volum_Infartat_6V=T.Rati_Volum_Infartat_6V;
Superficie_7V=T.Superficie_7V;                Rati_Volum_Infartat_7V=T.Rati_Volum_Infartat_7V;
Superficie_8V=T.Superficie_8V;                Rati_Volum_Infartat_8V=T.Rati_Volum_Infartat_8V;

Superficiemm_1V=T.Superficiemm_1V;            
Superficiemm_2V=T.Superficiemm_2V;
Superficiemm_3V=T.Superficiemm_3V;
Superficiemm_4V=T.Superficiemm_4V;
Superficiemm_5V=T.Superficiemm_5V;
Superficiemm_6V=T.Superficiemm_6V;
Superficiemm_7V=T.Superficiemm_7V;
Superficiemm_8V=T.Superficiemm_8V;

AreaIpsi1=T.AreaIpsi1;                        AreaContra1=T.AreaContra1;
AreaIpsi2=T.AreaIpsi2;                        AreaContra2=T.AreaContra2;
AreaIpsi3=T.AreaIpsi3;                        AreaContra3=T.AreaContra3;
AreaIpsi4=T.AreaIpsi4;                        AreaContra4=T.AreaContra4;
AreaIpsi5=T.AreaIpsi5;                        AreaContra5=T.AreaContra5;
AreaIpsi6=T.AreaIpsi6;                        AreaContra6=T.AreaContra6;
AreaIpsi7=T.AreaIpsi7;                        AreaContra7=T.AreaContra7;
AreaIpsi8=T.AreaIpsi8;                        AreaContra8=T.AreaContra8;

AreaIpsi1V=T.AreaIpsi1V;                      AreaContra1V=T.AreaContra1V;
AreaIpsi2V=T.AreaIpsi2V;                      AreaContra2V=T.AreaContra2V;
AreaIpsi3V=T.AreaIpsi3V;                      AreaContra3V=T.AreaContra3V;
AreaIpsi4V=T.AreaIpsi4V;                      AreaContra4V=T.AreaContra4V;
AreaIpsi5V=T.AreaIpsi5V;                      AreaContra5V=T.AreaContra5V;
AreaIpsi6V=T.AreaIpsi6V;                      AreaContra6V=T.AreaContra6V;
AreaIpsi7V=T.AreaIpsi7V;                      AreaContra7V=T.AreaContra7V;
AreaIpsi8V=T.AreaIpsi8V;                      AreaContra8V=T.AreaContra8V;

AreaIpsimm1=T.AreaIpsimm1;                    AreaContramm1=T.AreaContramm1;
AreaIpsimm2=T.AreaIpsimm2;                    AreaContramm2=T.AreaContramm2;
AreaIpsimm3=T.AreaIpsimm3;                    AreaContramm3=T.AreaContramm3;
AreaIpsimm4=T.AreaIpsimm4;                    AreaContramm4=T.AreaContramm4;
AreaIpsimm5=T.AreaIpsimm5;                    AreaContramm5=T.AreaContramm5;
AreaIpsimm6=T.AreaIpsimm6;                    AreaContramm6=T.AreaContramm6;
AreaIpsimm7=T.AreaIpsimm7;                    AreaContramm7=T.AreaContramm7;
AreaIpsimm8=T.AreaIpsimm8;                    AreaContramm8=T.AreaContramm8;

AreaIpsimm1V=T.AreaIpsimm1V;                  AreaContramm1V=T.AreaContramm1V;
AreaIpsimm2V=T.AreaIpsimm2V;                  AreaContramm2V=T.AreaContramm2V;
AreaIpsimm3V=T.AreaIpsimm3V;                  AreaContramm3V=T.AreaContramm3V;
AreaIpsimm4V=T.AreaIpsimm4V;                  AreaContramm4V=T.AreaContramm4V;
AreaIpsimm5V=T.AreaIpsimm5V;                  AreaContramm5V=T.AreaContramm5V;
AreaIpsimm6V=T.AreaIpsimm6V;                  AreaContramm6V=T.AreaContramm6V;
AreaIpsimm7V=T.AreaIpsimm7V;                  AreaContramm7V=T.AreaContramm7V;
AreaIpsimm8V=T.AreaIpsimm8V;                  AreaContramm8V=T.AreaContramm8V;

VolumInfartatV=T.VolumInfartatV;
VolumIpsilateralV=T.VolumIpsilateralV;
VolumContralateralV=T.VolumContralateralV;
VolumInfart_corregit_edemaV=T.VolumInfart_corregit_edemaV;
Edemacervell_sencerV=T.Edemacervell_sencerV;

VolumInfartat=T.VolumInfartat;
VolumIpsilateral=T.VolumIpsilateral;
VolumContralateral=T.VolumContralateral;
VolumInfart_corregit_edema=T.VolumInfart_corregit_edema;
Edemacervell_sencer=T.Edemacervell_sencer;

Detecta=T.Detecta;                          Treu=T.Treu;

Temps_quiet=T.Temps_quiet;                  Velocitat_mitjana=T.Velocitat_mitjana;
Velocitat_morro=T.Velocitat_morro;          Velocitat_potaD=T.Velocitat_potaD;
Velocitat_potaE=T.Velocitat_potaE;          Velocitat_potad=T.Velocitat_potad;
Velocitat_potae=T.Velocitat_potae;          Velocitat_cul=T.Velocitat_cul;

Distancia_potes_mig=T.Distancia_potes_mig;  Distancia_adh_morro=T.Distancia_adh_morro;
Angle_mig=T.Angle_mig;                      Temps_angle_0positiu=T.Temps_angle_0positiu;
Temps_angle_0negatiu=T.Temps_angle_0negatiu;

TempsRotarot=T.TempsRotarot;

noms=split(nomcsv,'-');
Identificador=str2num(string(noms(1))); CostatChar=char(noms(2));   IdentificadorChar=char(noms(1));
Nomcomplert_str=strcat(IdentificadorChar,'-',CostatChar(3),CostatChar(1));
Nomcomplert_string=convertCharsToStrings(Nomcomplert_str);

%Fiquem coses

if length(NomComplert)==0
    NomComplert=cellstr(Nomcomplert_string);
    
    Superficie_1=[Sup1];    Rati_Volum_Infartat_1=[Rati_V_1];
    Superficie_2=[Sup2];    Rati_Volum_Infartat_2=[Rati_V_2];
    Superficie_3=[Sup3];    Rati_Volum_Infartat_3=[Rati_V_3];
    Superficie_4=[Sup4];    Rati_Volum_Infartat_4=[Rati_V_4];
    Superficie_5=[Sup5];    Rati_Volum_Infartat_5=[Rati_V_5];
    Superficie_6=[Sup6];    Rati_Volum_Infartat_6=[Rati_V_6];
    Superficie_7=[Sup7];    Rati_Volum_Infartat_7=[Rati_V_7];
    Superficie_8=[Sup8];    Rati_Volum_Infartat_8=[Rati_V_8];
    
    disp(Supmm1)
    
    Superficiemm_1=[Supmm1];
    Superficiemm_2=[Supmm2];
    Superficiemm_3=[Supmm3];
    Superficiemm_4=[Supmm4];
    Superficiemm_5=[Supmm5];
    Superficiemm_6=[Supmm6];
    Superficiemm_7=[Supmm7];
    Superficiemm_8=[Supmm8];

    Superficiemm_1V=[Supmm1V];
    Superficiemm_2V=[Supmm2V];
    Superficiemm_3V=[Supmm3V];
    Superficiemm_4V=[Supmm4V];
    Superficiemm_5V=[Supmm5V];
    Superficiemm_6V=[Supmm6V];
    Superficiemm_7V=[Supmm7V];
    Superficiemm_8V=[Supmm8V];
    
    Superficie_1V=[Sup1V];    Rati_Volum_Infartat_1V=[Rati_V_1V];
    Superficie_2V=[Sup2V];    Rati_Volum_Infartat_2V=[Rati_V_2V];
    Superficie_3V=[Sup3V];    Rati_Volum_Infartat_3V=[Rati_V_3V];
    Superficie_4V=[Sup4V];    Rati_Volum_Infartat_4V=[Rati_V_4V];
    Superficie_5V=[Sup5V];    Rati_Volum_Infartat_5V=[Rati_V_5V];
    Superficie_6V=[Sup6V];    Rati_Volum_Infartat_6V=[Rati_V_6V];
    Superficie_7V=[Sup7V];    Rati_Volum_Infartat_7V=[Rati_V_7V];
    Superficie_8V=[Sup8V];    Rati_Volum_Infartat_8V=[Rati_V_8V];
    
    AreaIpsi1=[areaIpsi1];    AreaContra1=[areaContra1];
    AreaIpsi2=[areaIpsi2];    AreaContra2=[areaContra2];
    AreaIpsi3=[areaIpsi3];    AreaContra3=[areaContra3];
    AreaIpsi4=[areaIpsi4];    AreaContra4=[areaContra4];
    AreaIpsi5=[areaIpsi5];    AreaContra5=[areaContra5];
    AreaIpsi6=[areaIpsi6];    AreaContra6=[areaContra6];
    AreaIpsi7=[areaIpsi7];    AreaContra7=[areaContra7];
    AreaIpsi8=[areaIpsi8];    AreaContra8=[areaContra8];
    
    AreaIpsimm1=[areaIpsimm1];    AreaContramm1=[areaContramm1];
    AreaIpsimm2=[areaIpsimm2];    AreaContramm2=[areaContramm2];
    AreaIpsimm3=[areaIpsimm3];    AreaContramm3=[areaContramm3];
    AreaIpsimm4=[areaIpsimm4];    AreaContramm4=[areaContramm4];
    AreaIpsimm5=[areaIpsimm5];    AreaContramm5=[areaContramm5];
    AreaIpsimm6=[areaIpsimm6];    AreaContramm6=[areaContramm6];
    AreaIpsimm7=[areaIpsimm7];    AreaContramm7=[areaContramm7];
    AreaIpsimm8=[areaIpsimm8];    AreaContramm8=[areaContramm8];
    
    AreaIpsi1V=[areaIpsi1V];    AreaContra1V=[areaContra1V];
    AreaIpsi2V=[areaIpsi2V];    AreaContra2V=[areaContra2V];
    AreaIpsi3V=[areaIpsi3V];    AreaContra3V=[areaContra3V];
    AreaIpsi4V=[areaIpsi4V];    AreaContra4V=[areaContra4V];
    AreaIpsi5V=[areaIpsi5V];    AreaContra5V=[areaContra5V];
    AreaIpsi6V=[areaIpsi6V];    AreaContra6V=[areaContra6V];
    AreaIpsi7V=[areaIpsi7V];    AreaContra7V=[areaContra7V];
    AreaIpsi8V=[areaIpsi8V];    AreaContra8V=[areaContra8V];
    
    AreaIpsimm1V=[areaIpsimm1V];    AreaContramm1V=[areaContramm1V];
    AreaIpsimm2V=[areaIpsimm2V];    AreaContramm2V=[areaContramm2V];
    AreaIpsimm3V=[areaIpsimm3V];    AreaContramm3V=[areaContramm3V];
    AreaIpsimm4V=[areaIpsimm4V];    AreaContramm4V=[areaContramm4V];
    AreaIpsimm5V=[areaIpsimm5V];    AreaContramm5V=[areaContramm5V];
    AreaIpsimm6V=[areaIpsimm6V];    AreaContramm6V=[areaContramm6V];
    AreaIpsimm7V=[areaIpsimm7V];    AreaContramm7V=[areaContramm7V];
    AreaIpsimm8V=[areaIpsimm8V];    AreaContramm8V=[areaContramm8V];
    
    VolumInfartatV=[volumInfartatV];
    VolumIpsilateralV=[volumIpsilateralV];
    VolumContralateralV=[volumContralateralV];
    VolumInfart_corregit_edemaV=[volumInfart_corregit_edemaV];
    Edemacervell_sencerV=[edemacervell_sencerV];

    VolumInfartat=[volumInfartat];
    VolumIpsilateral=[volumIpsilateral];
    VolumContralateral=[volumContralateral];
    VolumInfart_corregit_edema=[volumInfart_corregit_edema];
    Edemacervell_sencer=[edemacervell_sencer];
    
    Detecta=[Deteccio]; Treu=[treu];

    %Les velocitat mitjana quan estiguin en moviment
    Temps_quiet=[temps_quiet];     Velocitat_mitjana=[velocitat_mitjana];
    Velocitat_morro=[velocitat_morro]; Velocitat_potaD=[velocitat_potaD];
    Velocitat_potaE=[velocitat_potaE]; Velocitat_potad=[velocitat_potad];
    Velocitat_potae=[velocitat_potae]; Velocitat_cul=[velocitat_cul];

    Distancia_potes_mig=[distancia_potes_mig]; Distancia_adh_morro=[distancia_adh_morro];

    Angle_mig=[angle_mig];       Temps_angle_0positiu=[temps_angle_0positiu];
    Temps_angle_0negatiu=[temps_angle_0negatiu];
    TempsRotarot=[temps];
else
    index=length(NomComplert)+1;
    
    NomComplert(index)=cellstr(Nomcomplert_string);
    Superficie_1(index)=Sup1;    Rati_Volum_Infartat_1(index)=Rati_V_1;
    Superficie_2(index)=Sup2;    Rati_Volum_Infartat_2(index)=Rati_V_2;
    Superficie_3(index)=Sup3;    Rati_Volum_Infartat_3(index)=Rati_V_3;
    Superficie_4(index)=Sup4;    Rati_Volum_Infartat_4(index)=Rati_V_4;
    Superficie_5(index)=Sup5;    Rati_Volum_Infartat_5(index)=Rati_V_5;
    Superficie_6(index)=Sup6;    Rati_Volum_Infartat_6(index)=Rati_V_6;
    Superficie_7(index)=Sup7;    Rati_Volum_Infartat_7(index)=Rati_V_7;
    Superficie_8(index)=Sup8;    Rati_Volum_Infartat_8(index)=Rati_V_8;
    
    disp(Supmm1)
    disp('Hola??')
    
    Superficiemm_1(index)=Supmm1;
    Superficiemm_2(index)=Supmm2;
    Superficiemm_3(index)=Supmm3;
    Superficiemm_4(index)=Supmm4;
    Superficiemm_5(index)=Supmm5;
    Superficiemm_6(index)=Supmm6;
    Superficiemm_7(index)=Supmm7;
    Superficiemm_8(index)=Supmm8;
    
    
    Superficie_1V(index)=Sup1V;    Rati_Volum_Infartat_1V(index)=Rati_V_1V;
    Superficie_2V(index)=Sup2V;    Rati_Volum_Infartat_2V(index)=Rati_V_2V;
    Superficie_3V(index)=Sup3V;    Rati_Volum_Infartat_3V(index)=Rati_V_3V;
    Superficie_4V(index)=Sup4V;    Rati_Volum_Infartat_4V(index)=Rati_V_4V;
    Superficie_5V(index)=Sup5V;    Rati_Volum_Infartat_5V(index)=Rati_V_5V;
    Superficie_6V(index)=Sup6V;    Rati_Volum_Infartat_6V(index)=Rati_V_6V;
    Superficie_7V(index)=Sup7V;    Rati_Volum_Infartat_7V(index)=Rati_V_7V;
    Superficie_8V(index)=Sup8V;    Rati_Volum_Infartat_8V(index)=Rati_V_8V;
    
    Superficiemm_1V(index)=Supmm1V;
    Superficiemm_2V(index)=Supmm2V;
    Superficiemm_3V(index)=Supmm3V;
    Superficiemm_4V(index)=Supmm4V;
    Superficiemm_5V(index)=Supmm5V;
    Superficiemm_6V(index)=Supmm6V;
    Superficiemm_7V(index)=Supmm7V;
    Superficiemm_8V(index)=Supmm8V;
    
    AreaIpsi1(index)=areaIpsi1;    AreaContra1(index)=areaContra1;
    AreaIpsi2(index)=areaIpsi2;    AreaContra2(index)=areaContra2;
    AreaIpsi3(index)=areaIpsi3;    AreaContra3(index)=areaContra3;
    AreaIpsi4(index)=areaIpsi4;    AreaContra4(index)=areaContra4;
    AreaIpsi5(index)=areaIpsi5;    AreaContra5(index)=areaContra5;
    AreaIpsi6(index)=areaIpsi6;    AreaContra6(index)=areaContra6;
    AreaIpsi7(index)=areaIpsi7;    AreaContra7(index)=areaContra7;
    AreaIpsi8(index)=areaIpsi8;    AreaContra8(index)=areaContra8;
    
    AreaIpsimm1(index)=areaIpsimm1;    AreaContramm1(index)=areaContramm1;
    AreaIpsimm2(index)=areaIpsimm2;    AreaContramm2(index)=areaContramm2;
    AreaIpsimm3(index)=areaIpsimm3;    AreaContramm3(index)=areaContramm3;
    AreaIpsimm4(index)=areaIpsimm4;    AreaContramm4(index)=areaContramm4;
    AreaIpsimm5(index)=areaIpsimm5;    AreaContramm5(index)=areaContramm5;
    AreaIpsimm6(index)=areaIpsimm6;    AreaContramm6(index)=areaContramm6;
    AreaIpsimm7(index)=areaIpsimm7;    AreaContramm7(index)=areaContramm7;
    AreaIpsimm8(index)=areaIpsimm8;    AreaContramm8(index)=areaContramm8;
    
    AreaIpsi1V(index)=areaIpsi1V;    AreaContra1V(index)=areaContra1V;
    AreaIpsi2V(index)=areaIpsi2V;    AreaContra2V(index)=areaContra2V;
    AreaIpsi3V(index)=areaIpsi3V;    AreaContra3V(index)=areaContra3V;
    AreaIpsi4V(index)=areaIpsi4V;    AreaContra4V(index)=areaContra4V;
    AreaIpsi5V(index)=areaIpsi5V;    AreaContra5V(index)=areaContra5V;
    AreaIpsi6V(index)=areaIpsi6V;    AreaContra6V(index)=areaContra6V;
    AreaIpsi7V(index)=areaIpsi7V;    AreaContra7V(index)=areaContra7V;
    AreaIpsi8V(index)=areaIpsi8V;    AreaContra8V(index)=areaContra8V;
    
    AreaIpsimm1V(index)=areaIpsimm1V;    AreaContramm1V(index)=areaContramm1V;
    AreaIpsimm2V(index)=areaIpsimm2V;    AreaContramm2V(index)=areaContramm2V;
    AreaIpsimm3V(index)=areaIpsimm3V;    AreaContramm3V(index)=areaContramm3V;
    AreaIpsimm4V(index)=areaIpsimm4V;    AreaContramm4V(index)=areaContramm4V;
    AreaIpsimm5V(index)=areaIpsimm5V;    AreaContramm5V(index)=areaContramm5V;
    AreaIpsimm6V(index)=areaIpsimm6V;    AreaContramm6V(index)=areaContramm6V;
    AreaIpsimm7V(index)=areaIpsimm7V;    AreaContramm7V(index)=areaContramm7V;
    AreaIpsimm8V(index)=areaIpsimm8V;    AreaContramm8V(index)=areaContramm8V;
    
    VolumInfartat(index)=volumInfartat;
    VolumIpsilateral(index)=volumIpsilateral;
    VolumContralateral(index)=volumContralateral;
    VolumInfart_corregit_edema(index)=volumInfart_corregit_edema;
    Edemacervell_sencer(index)=edemacervell_sencer;
    
    VolumInfartatV(index)=volumInfartatV;
    VolumIpsilateralV(index)=volumIpsilateralV;
    VolumContralateralV(index)=volumContralateralV;
    VolumInfart_corregit_edemaV(index)=volumInfart_corregit_edemaV;
    Edemacervell_sencerV(index)=edemacervell_sencerV;
    
    Detecta(index)=Deteccio; Treu(index)=treu;

    %Les velocitat mitjana quan estiguin en moviment
    Temps_quiet(index)=temps_quiet;         Velocitat_mitjana(index)=velocitat_mitjana;
    Velocitat_morro(index)=velocitat_morro; Velocitat_potaD(index)=velocitat_potaD;
    Velocitat_potaE(index)=velocitat_potaE; Velocitat_potad(index)=velocitat_potad;
    Velocitat_potae(index)=velocitat_potae; Velocitat_cul(index)=velocitat_cul;

    Distancia_potes_mig(index)=distancia_potes_mig; Distancia_adh_morro(index)=distancia_adh_morro;

    Angle_mig(index)=angle_mig;       Temps_angle_0positiu(index)=temps_angle_0positiu;
    Temps_angle_0negatiu(index)=temps_angle_0negatiu;
    TempsRotarot(index)=temps;
end
%Falta passar-ho a columnes i després ficar-ho dins la taula
NomComplert=NomComplert(:);

Superficie_1=Superficie_1(:);    Rati_Volum_Infartat_1=Rati_Volum_Infartat_1(:);
Superficie_2=Superficie_2(:);    Rati_Volum_Infartat_2=Rati_Volum_Infartat_2(:);
Superficie_3=Superficie_3(:);    Rati_Volum_Infartat_3=Rati_Volum_Infartat_3(:);
Superficie_4=Superficie_4(:);    Rati_Volum_Infartat_4=Rati_Volum_Infartat_4(:);
Superficie_5=Superficie_5(:);    Rati_Volum_Infartat_5=Rati_Volum_Infartat_5(:);
Superficie_6=Superficie_6(:);    Rati_Volum_Infartat_6=Rati_Volum_Infartat_6(:);
Superficie_7=Superficie_7(:);    Rati_Volum_Infartat_7=Rati_Volum_Infartat_7(:);
Superficie_8=Superficie_8(:);    Rati_Volum_Infartat_8=Rati_Volum_Infartat_8(:);

Superficiemm_1=Superficiemm_1(:);
Superficiemm_2=Superficiemm_2(:);
Superficiemm_3=Superficiemm_3(:);
Superficiemm_4=Superficiemm_4(:);
Superficiemm_5=Superficiemm_5(:);
Superficiemm_6=Superficiemm_6(:);
Superficiemm_7=Superficiemm_7(:);
Superficiemm_8=Superficiemm_8(:);


Superficie_1V=Superficie_1V(:);    Rati_Volum_Infartat_1V=Rati_Volum_Infartat_1V(:);
Superficie_2V=Superficie_2V(:);    Rati_Volum_Infartat_2V=Rati_Volum_Infartat_2V(:);
Superficie_3V=Superficie_3V(:);    Rati_Volum_Infartat_3V=Rati_Volum_Infartat_3V(:);
Superficie_4V=Superficie_4V(:);    Rati_Volum_Infartat_4V=Rati_Volum_Infartat_4V(:);
Superficie_5V=Superficie_5V(:);    Rati_Volum_Infartat_5V=Rati_Volum_Infartat_5V(:);
Superficie_6V=Superficie_6V(:);    Rati_Volum_Infartat_6V=Rati_Volum_Infartat_6V(:);
Superficie_7V=Superficie_7V(:);    Rati_Volum_Infartat_7V=Rati_Volum_Infartat_7V(:);
Superficie_8V=Superficie_8V(:);    Rati_Volum_Infartat_8V=Rati_Volum_Infartat_8V(:);

Superficiemm_1V=Superficiemm_1V(:);
Superficiemm_2V=Superficiemm_2V(:);
Superficiemm_3V=Superficiemm_3V(:);
Superficiemm_4V=Superficiemm_4V(:);
Superficiemm_5V=Superficiemm_5V(:);
Superficiemm_6V=Superficiemm_6V(:);
Superficiemm_7V=Superficiemm_7V(:);
Superficiemm_8V=Superficiemm_8V(:);

AreaIpsi1=AreaIpsi1(:);            AreaContra1=AreaContra1(:);
AreaIpsi2=AreaIpsi2(:);            AreaContra2=AreaContra2(:);
AreaIpsi3=AreaIpsi3(:);            AreaContra3=AreaContra3(:);
AreaIpsi4=AreaIpsi4(:);            AreaContra4=AreaContra4(:);
AreaIpsi5=AreaIpsi5(:);            AreaContra5=AreaContra5(:);
AreaIpsi6=AreaIpsi6(:);            AreaContra6=AreaContra6(:);
AreaIpsi7=AreaIpsi7(:);            AreaContra7=AreaContra7(:);
AreaIpsi8=AreaIpsi8(:);            AreaContra8=AreaContra8(:);

AreaIpsimm1=AreaIpsimm1(:);            AreaContramm1=AreaContramm1(:);
AreaIpsimm2=AreaIpsimm2(:);            AreaContramm2=AreaContramm2(:);
AreaIpsimm3=AreaIpsimm3(:);            AreaContramm3=AreaContramm3(:);
AreaIpsimm4=AreaIpsimm4(:);            AreaContramm4=AreaContramm4(:);
AreaIpsimm5=AreaIpsimm5(:);            AreaContramm5=AreaContramm5(:);
AreaIpsimm6=AreaIpsimm6(:);            AreaContramm6=AreaContramm6(:);
AreaIpsimm7=AreaIpsimm7(:);            AreaContramm7=AreaContramm7(:);
AreaIpsimm8=AreaIpsimm8(:);            AreaContramm8=AreaContramm8(:);

AreaIpsi1V=AreaIpsi1V(:);            AreaContra1V=AreaContra1V(:);
AreaIpsi2V=AreaIpsi2V(:);            AreaContra2V=AreaContra2V(:);
AreaIpsi3V=AreaIpsi3V(:);            AreaContra3V=AreaContra3V(:);
AreaIpsi4V=AreaIpsi4V(:);            AreaContra4V=AreaContra4V(:);
AreaIpsi5V=AreaIpsi5V(:);            AreaContra5V=AreaContra5V(:);
AreaIpsi6V=AreaIpsi6V(:);            AreaContra6V=AreaContra6V(:);
AreaIpsi7V=AreaIpsi7V(:);            AreaContra7V=AreaContra7V(:);
AreaIpsi8V=AreaIpsi8V(:);            AreaContra8V=AreaContra8V(:);

AreaIpsimm1V=AreaIpsimm1V(:);            AreaContramm1V=AreaContramm1V(:);
AreaIpsimm2V=AreaIpsimm2V(:);            AreaContramm2V=AreaContramm2V(:);
AreaIpsimm3V=AreaIpsimm3V(:);            AreaContramm3V=AreaContramm3V(:);
AreaIpsimm4V=AreaIpsimm4V(:);            AreaContramm4V=AreaContramm4V(:);
AreaIpsimm5V=AreaIpsimm5V(:);            AreaContramm5V=AreaContramm5V(:);
AreaIpsimm6V=AreaIpsimm6V(:);            AreaContramm6V=AreaContramm6V(:);
AreaIpsimm7V=AreaIpsimm7V(:);            AreaContramm7V=AreaContramm7V(:);
AreaIpsimm8V=AreaIpsimm8V(:);            AreaContramm8V=AreaContramm8V(:);

VolumInfartat=VolumInfartat(:);
VolumIpsilateral=VolumIpsilateral(:);
VolumContralateral=VolumContralateral(:);
VolumInfart_corregit_edema=VolumInfart_corregit_edema(:);
Edemacervell_sencer=Edemacervell_sencer(:);

VolumInfartatV=VolumInfartatV(:);
VolumIpsilateralV=VolumIpsilateralV(:);
VolumContralateralV=VolumContralateralV(:);
VolumInfart_corregit_edemaV=VolumInfart_corregit_edemaV(:);
Edemacervell_sencerV=Edemacervell_sencerV(:);

Detecta=Detecta(:); Treu=Treu(:);

%Les velocitat mitjana quan estiguin en moviment
Temps_quiet=Temps_quiet(:);     Velocitat_mitjana=Velocitat_mitjana(:);
Velocitat_morro=Velocitat_morro(:); Velocitat_potaD=Velocitat_potaD(:);
Velocitat_potaE=Velocitat_potaE(:); Velocitat_potad=Velocitat_potad(:);
Velocitat_potae=Velocitat_potae(:); Velocitat_cul=Velocitat_cul(:);

Distancia_potes_mig=Distancia_potes_mig(:); Distancia_adh_morro=Distancia_adh_morro(:);

Angle_mig=Angle_mig(:);       Temps_angle_0positiu=Temps_angle_0positiu(:);
Temps_angle_0negatiu=Temps_angle_0negatiu(:);
TempsRotarot=TempsRotarot(:);

T=table(NomComplert,Superficie_1,Superficie_2,Superficie_3,Superficie_4,Superficie_5,Superficie_6,Superficie_7,Superficie_8,Superficiemm_1,Superficiemm_2,Superficiemm_3,Superficiemm_4,Superficiemm_5,Superficiemm_6,Superficiemm_7,Superficiemm_8,Rati_Volum_Infartat_1,Rati_Volum_Infartat_2,Rati_Volum_Infartat_3,Rati_Volum_Infartat_4,Rati_Volum_Infartat_5,Rati_Volum_Infartat_6,Rati_Volum_Infartat_7,Rati_Volum_Infartat_8,AreaIpsi1,AreaIpsi2,AreaIpsi3,AreaIpsi4,AreaIpsi5,AreaIpsi6,AreaIpsi7,AreaIpsi8,AreaIpsimm1,AreaIpsimm2,AreaIpsimm3,AreaIpsimm4,AreaIpsimm5,AreaIpsimm6,AreaIpsimm7,AreaIpsimm8,AreaContra1,AreaContra2,AreaContra3,AreaContra4,AreaContra5,AreaContra6,AreaContra7,AreaContra8,AreaContramm1,AreaContramm2,AreaContramm3,AreaContramm4,AreaContramm5,AreaContramm6,AreaContramm7,AreaContramm8,VolumInfartat,VolumIpsilateral,VolumContralateral,VolumInfart_corregit_edema,Edemacervell_sencer,Superficie_1V,Superficie_2V,Superficie_3V,Superficie_4V,Superficie_5V,Superficie_6V,Superficie_7V,Superficie_8V,Superficiemm_1V,Superficiemm_2V,Superficiemm_3V,Superficiemm_4V,Superficiemm_5V,Superficiemm_6V,Superficiemm_7V,Superficiemm_8V,Rati_Volum_Infartat_1V,Rati_Volum_Infartat_2V,Rati_Volum_Infartat_3V,Rati_Volum_Infartat_4V,Rati_Volum_Infartat_5V,Rati_Volum_Infartat_6V,Rati_Volum_Infartat_7V,Rati_Volum_Infartat_8V,AreaIpsi1V,AreaIpsi2V,AreaIpsi3V,AreaIpsi4V,AreaIpsi5V,AreaIpsi6V,AreaIpsi7V,AreaIpsi8V,AreaIpsimm1V,AreaIpsimm2V,AreaIpsimm3V,AreaIpsimm4V,AreaIpsimm5V,AreaIpsimm6V,AreaIpsimm7V,AreaIpsimm8V,AreaContra1V,AreaContra2V,AreaContra3V,AreaContra4V,AreaContra5V,AreaContra6V,AreaContra7V,AreaContra8V,AreaContramm1V,AreaContramm2V,AreaContramm3V,AreaContramm4V,AreaContramm5V,AreaContramm6V,AreaContramm7V,AreaContramm8V,VolumInfartatV,VolumIpsilateralV,VolumContralateralV,VolumInfart_corregit_edemaV,Edemacervell_sencerV,Detecta,Treu,Temps_quiet,Velocitat_mitjana,Velocitat_morro,Velocitat_potaD,Velocitat_potaE,Velocitat_potad,Velocitat_potae,Velocitat_cul,Distancia_potes_mig,Distancia_adh_morro,Angle_mig,Temps_angle_0positiu,Temps_angle_0negatiu,TempsRotarot);

writetable(T,nom_excel,'WriteRowNames',true)
