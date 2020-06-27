function excel_iniciador_propietats(nom_excel)
%Iniciem l'excel
NomComplert=[];

Superficie_1=[];    Rati_Volum_Infartat_1=[];
Superficie_2=[];    Rati_Volum_Infartat_2=[];
Superficie_3=[];    Rati_Volum_Infartat_3=[];
Superficie_4=[];    Rati_Volum_Infartat_4=[];
Superficie_5=[];    Rati_Volum_Infartat_5=[];
Superficie_6=[];    Rati_Volum_Infartat_6=[];
Superficie_7=[];    Rati_Volum_Infartat_7=[];
Superficie_8=[];    Rati_Volum_Infartat_8=[];

Superficiemm_1=[];
Superficiemm_2=[];
Superficiemm_3=[];
Superficiemm_4=[];
Superficiemm_5=[];
Superficiemm_6=[];
Superficiemm_7=[];
Superficiemm_8=[];

Superficie_1V=[];    Rati_Volum_Infartat_1V=[];
Superficie_2V=[];    Rati_Volum_Infartat_2V=[];
Superficie_3V=[];    Rati_Volum_Infartat_3V=[];
Superficie_4V=[];    Rati_Volum_Infartat_4V=[];
Superficie_5V=[];    Rati_Volum_Infartat_5V=[];
Superficie_6V=[];    Rati_Volum_Infartat_6V=[];
Superficie_7V=[];    Rati_Volum_Infartat_7V=[];
Superficie_8V=[];    Rati_Volum_Infartat_8V=[];

Superficiemm_1V=[];
Superficiemm_2V=[];
Superficiemm_3V=[];
Superficiemm_4V=[];
Superficiemm_5V=[];
Superficiemm_6V=[];
Superficiemm_7V=[];
Superficiemm_8V=[];

AreaIpsi1=[];       AreaContra1=[];
AreaIpsi2=[];       AreaContra2=[];
AreaIpsi3=[];       AreaContra3=[];
AreaIpsi4=[];       AreaContra4=[];
AreaIpsi5=[];       AreaContra5=[];
AreaIpsi6=[];       AreaContra6=[];
AreaIpsi7=[];       AreaContra7=[];
AreaIpsi8=[];       AreaContra8=[];

AreaIpsi1V=[];       AreaContra1V=[];
AreaIpsi2V=[];       AreaContra2V=[];
AreaIpsi3V=[];       AreaContra3V=[];
AreaIpsi4V=[];       AreaContra4V=[];
AreaIpsi5V=[];       AreaContra5V=[];
AreaIpsi6V=[];       AreaContra6V=[];
AreaIpsi7V=[];       AreaContra7V=[];
AreaIpsi8V=[];       AreaContra8V=[];

AreaIpsimm1=[];       AreaContramm1=[];
AreaIpsimm2=[];       AreaContramm2=[];
AreaIpsimm3=[];       AreaContramm3=[];
AreaIpsimm4=[];       AreaContramm4=[];
AreaIpsimm5=[];       AreaContramm5=[];
AreaIpsimm6=[];       AreaContramm6=[];
AreaIpsimm7=[];       AreaContramm7=[];
AreaIpsimm8=[];       AreaContramm8=[];

AreaIpsimm1V=[];       AreaContramm1V=[];
AreaIpsimm2V=[];       AreaContramm2V=[];
AreaIpsimm3V=[];       AreaContramm3V=[];
AreaIpsimm4V=[];       AreaContramm4V=[];
AreaIpsimm5V=[];       AreaContramm5V=[];
AreaIpsimm6V=[];       AreaContramm6V=[];
AreaIpsimm7V=[];       AreaContramm7V=[];
AreaIpsimm8V=[];       AreaContramm8V=[];

VolumInfartat=[];
VolumIpsilateral=[];
VolumContralateral=[];
VolumInfart_corregit_edema=[];
Edemacervell_sencer=[];

VolumInfartatV=[];
VolumIpsilateralV=[];
VolumContralateralV=[];
VolumInfart_corregit_edemaV=[];
Edemacervell_sencerV=[];

Detecta=[]; Treu=[];

%Les velocitat mitjana quan estiguin en moviment
Temps_quiet=[];     Velocitat_mitjana=[];
Velocitat_morro=[]; Velocitat_potaD=[];
Velocitat_potaE=[]; Velocitat_potad=[];
Velocitat_potae=[]; Velocitat_cul=[];

Distancia_potes_mig=[]; Distancia_adh_morro=[];

Angle_mig=[];       Temps_angle_0positiu=[];
Temps_angle_0negatiu=[];

TempsRotarot=[];

T=table(NomComplert,Superficie_1,Superficie_2,Superficie_3,Superficie_4,Superficie_5,Superficie_6,Superficie_7,Superficie_8,Superficiemm_1,Superficiemm_2,Superficiemm_3,Superficiemm_4,Superficiemm_5,Superficiemm_6,Superficiemm_7,Superficiemm_8,Rati_Volum_Infartat_1,Rati_Volum_Infartat_2,Rati_Volum_Infartat_3,Rati_Volum_Infartat_4,Rati_Volum_Infartat_5,Rati_Volum_Infartat_6,Rati_Volum_Infartat_7,Rati_Volum_Infartat_8,AreaIpsi1,AreaIpsi2,AreaIpsi3,AreaIpsi4,AreaIpsi5,AreaIpsi6,AreaIpsi7,AreaIpsi8,AreaIpsimm1,AreaIpsimm2,AreaIpsimm3,AreaIpsimm4,AreaIpsimm5,AreaIpsimm6,AreaIpsimm7,AreaIpsimm8,AreaContra1,AreaContra2,AreaContra3,AreaContra4,AreaContra5,AreaContra6,AreaContra7,AreaContra8,AreaContramm1,AreaContramm2,AreaContramm3,AreaContramm4,AreaContramm5,AreaContramm6,AreaContramm7,AreaContramm8,VolumInfartat,VolumIpsilateral,VolumContralateral,VolumInfart_corregit_edema,Edemacervell_sencer,Superficie_1V,Superficie_2V,Superficie_3V,Superficie_4V,Superficie_5V,Superficie_6V,Superficie_7V,Superficie_8V,Superficiemm_1V,Superficiemm_2V,Superficiemm_3V,Superficiemm_4V,Superficiemm_5V,Superficiemm_6V,Superficiemm_7V,Superficiemm_8V,Rati_Volum_Infartat_1V,Rati_Volum_Infartat_2V,Rati_Volum_Infartat_3V,Rati_Volum_Infartat_4V,Rati_Volum_Infartat_5V,Rati_Volum_Infartat_6V,Rati_Volum_Infartat_7V,Rati_Volum_Infartat_8V,AreaIpsi1V,AreaIpsi2V,AreaIpsi3V,AreaIpsi4V,AreaIpsi5V,AreaIpsi6V,AreaIpsi7V,AreaIpsi8V,AreaIpsimm1V,AreaIpsimm2V,AreaIpsimm3V,AreaIpsimm4V,AreaIpsimm5V,AreaIpsimm6V,AreaIpsimm7V,AreaIpsimm8V,AreaContra1V,AreaContra2V,AreaContra3V,AreaContra4V,AreaContra5V,AreaContra6V,AreaContra7V,AreaContra8V,AreaContramm1V,AreaContramm2V,AreaContramm3V,AreaContramm4V,AreaContramm5V,AreaContramm6V,AreaContramm7V,AreaContramm8V,VolumInfartatV,VolumIpsilateralV,VolumContralateralV,VolumInfart_corregit_edemaV,Edemacervell_sencerV,Detecta,Treu,Temps_quiet,Velocitat_mitjana,Velocitat_morro,Velocitat_potaD,Velocitat_potaE,Velocitat_potad,Velocitat_potae,Velocitat_cul,Distancia_potes_mig,Distancia_adh_morro,Angle_mig,Temps_angle_0positiu,Temps_angle_0negatiu,TempsRotarot);
writetable(T,nom_excel,'WriteRowNames',true)
