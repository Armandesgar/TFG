function [AreaInfartada1,AreaInfartada2,AreaInfartada3,AreaInfartada4,AreaInfartada1V,AreaInfartada2V,AreaInfartada3V,AreaInfartada4V,densitat_pixels,AreaIpsi1,AreaIpsi2,AreaIpsi3,AreaIpsi4,AreaIpsiV1,AreaIpsiV2,AreaIpsiV3,AreaIpsiV4,AreaContra1,AreaContra2,AreaContra3,AreaContra4,AreaContraV1,AreaContraV2,AreaContraV3,AreaContraV4,Rati1,Rati2,Rati3,Rati4,Rati1V,Rati2V,Rati3V,Rati4V]=imatges(nomimatge)
%Llegim imatges i convertim a YCBCR
img=imread(nomimatge);
I=rgb2ycbcr(img);
I=double(I);
tamany=size(img);
rang=1:255;
Y=I(:,:,1); Cr=I(:,:,3);
Y=Y(:);     Cr=Cr(:);
[countsY]=hist(Y,rang);
countsCr=hist(Cr,rang);

% Busquem màxim i mínims de la distribució de components, per a generar les diferents màscares.
[~,maximY]=max(countsY);
%
[~,segonpic]=findpeaks(countsY,'MinPeakDistance',30);
[maximYY,posiciomaxim]=max(countsY(segonpic));
minim_segon_pic=-countsY(segonpic(posiciomaxim+1)-30:segonpic(posiciomaxim+1)+30);
[~,minim_pic]=findpeaks(minim_segon_pic,'MinPeakDistance',30);
pepe=1;

if pepe==1 && countsY(segonpic(posiciomaxim+1))-countsY(segonpic(posiciomaxim+1)-15)>750 && countsY(segonpic(posiciomaxim+1))-countsY(segonpic(posiciomaxim+1)+15)>1000 && segonpic(posiciomaxim+1)<210 && segonpic(posiciomaxim+1)>190
    %disp('Hola')
    Yvectormin=countsY(115:maximY);
    [~,posicio]=min(Yvectormin);
    thresholdminY=114+posicio;

    Crvectormaxim=countsCr(110:140);
    [~,maxim]=max(Crvectormaxim);
    maxim=maxim+109;

    %Crvectormin=countsCr(90:115);
    Crvectormin=countsCr(maxim-25:maxim);
    [~,posicio]=min(Crvectormin);
    thresholdminCr=maxim-26+posicio;

    %Crvectormax=countsCr(120:150);
    Crvectormax=countsCr(140:end);
    [valor,posicio]=max(Crvectormax);
    thresholdmaxCr1=139+posicio;
    
    Crvectormax=countsCr(maxim:maxim+25);
    [valor,posicio]=min(Crvectormax);
    thresholdmaxCr=maxim-1+posicio;
    
    %thresholdmaxCr=round((2*thresholdmaxCr2+3*thresholdmaxCr1)/5);
    if countsY(segonpic(posiciomaxim+2))>2000
        % Mascara
        disp('Hey')
        %thresholdmaxCr=round((1*thresholdmaxCr2+1*thresholdmaxCr1)/2);
        [Infartat,maskedRGBImage] = createMask_YCbCr(img,thresholdminY,thresholdminCr-2,thresholdmaxCr1);
        [Linees,maskedRGBImage] = create_linees(img,thresholdminY,thresholdmaxCr1);
    else
        thresholdmaxCr_mig=round((1*thresholdmaxCr+2*thresholdmaxCr1)/3);
        [Infartat,maskedRGBImage] = createMask_YCbCr(img,thresholdminY,thresholdminCr+2,thresholdmaxCr_mig);
        [Linees,maskedRGBImage] = create_linees(img,thresholdminY,thresholdmaxCr1);
    end
    
    
    % Volem trobar la imatge sense el fons
    thresholdCervell=max(128,maxim);
    [BWCervell,CervellRGBImage] = createCervell_YCbCr(img,thresholdCervell+2);
    Cervell=double(BWCervell)+double(Infartat);
    Cervell(Cervell==2)=1;
    
else
    %disp('JEJE')
    Yvectormin=countsY(70:maximY);
    [~,posicio]=min(Yvectormin);
    thresholdminY=70+posicio;

    Crvectormaxim=countsCr(110:140);
    [~,maxim]=max(Crvectormaxim);
    maxim=maxim+109;

    %Crvectormin=countsCr(90:115);
    Crvectormin=countsCr(maxim-25:maxim);
    [~,posicio]=min(Crvectormin);
    thresholdminCr=maxim-26+posicio;

    %Crvectormax=countsCr(120:150);
    Crvectormax=countsCr(maxim:maxim+25);
    [valor,posicio]=min(Crvectormax);
    thresholdmaxCr=maxim-1+posicio;

    % Mascara
    [Infartat,maskedRGBImage] = createMask_YCbCr(img,thresholdminY,thresholdminCr-2,thresholdmaxCr+8);
    [Linees,maskedRGBImage] = create_linees(img,thresholdminY,thresholdmaxCr);
    % Volem trobar la imatge sense el fons
    thresholdCervell=max(128,maxim);
    [BWCervell,CervellRGBImage] = createCervell_YCbCr(img,thresholdCervell+2);
    Cervell=double(BWCervell)+double(Infartat);
    Cervell(Cervell==2)=1;
end
LB = 30; UB = 100000; Infartat = xor(bwareaopen(Infartat,LB),  bwareaopen(Infartat,UB));
%
% Identificar el cervell, la seva area, el centre de masses, dividir el
% cervell en dos, i tornar a trobar els centres de masses
[Cervell,~]=bwlabel(Cervell);
rp = regionprops(Cervell,{'Area','Centroid'});
Area = [rp.Area];
TH = 3000;
id = Area>TH;
cen=[rp(id).Centroid];
cen = reshape(cen,[2, sum(id)]);
imshow(Cervell)
% Centres trobats
% Ara volem separar en dos els cervells
se = strel('disk',1);
Infartat=imclose(Infartat,se);
LB = 3000; UB = 100000; Cervell = xor(bwareaopen(Cervell,LB),  bwareaopen(Cervell,UB));
intermig1=round((cen(1,2)+cen(1,3))/2);
intermig2=round((cen(1,4)+cen(1,3))/2);
intermig3=round((cen(1,4)+cen(1,5))/2);
Cervell(:,[intermig1-2,intermig1-1,intermig1,intermig1+1,intermig1+2])=0;
Cervell(:,[intermig2-2,intermig2-1,intermig2,intermig2+1,intermig2+2])=0;
Cervell(:,[intermig3-2,intermig3-1,intermig3,intermig3+1,intermig3+2])=0;
%[Cervell,~]=close_Cervell(Cervell);
imshow(Cervell)
CervellVertical=Cervell;
InfartatVertical=Infartat;
CervellVertical(:,round(cen(1,2)))=0;       CervellVertical(:,round(cen(1,3)))=0;
CervellVertical(:,round(cen(1,4)))=0;       CervellVertical(:,round(cen(1,5)))=0;
InfartatVertical(:,round(cen(1,2)))=0;      InfartatVertical(:,round(cen(1,3)))=0;
InfartatVertical(:,round(cen(1,4)))=0;      InfartatVertical(:,round(cen(1,5)))=0;

% Divisió, busquem secció per secció on es situen els elements simètrics.
if nomimatge(11)=='a'

img(:,round(cen(1,2)),:)=0;
Cervell(:,round(cen(1,2)))=0;
Infartat(:,round(cen(1,2)))=0;

Seccio_2=createMask_seccio_2(img,thresholdmaxCr);
Seccio_2=Seccio_2(round(cen(2,3))-18:round(cen(2,3))+18,round(cen(1,3))-18:round(cen(1,3))+18);
LB = 30; UB = 1000; Seccio_2 = xor(bwareaopen(Seccio_2,LB),  bwareaopen(Seccio_2,UB));
[hola,posicio]=max(flip(Seccio_2)); posicio(hola==0)=100; [Seccio_2_y,Seccio_2_x]=min(posicio);
Isconstant_2=[];
isconstant_2=Seccio_2_x;
isconstant_2_inicial=Seccio_2_x;

Seccio_2_abaix=Cervell(round(cen(2,3)):round(cen(2,3))+50,round(cen(1,3))-15:round(cen(1,3))+15);
[maxim_Seccio_2_abaix,posicio_Seccio_2_abaix]=max(flip(Seccio_2_abaix));
[Seccio_2_abaix_y,Seccio_2_abaix_x]=max(posicio_Seccio_2_abaix);
Isconstant_2_inferior=[];
isconstant_2_inferior=Seccio_2_abaix_x;
isconstant_2_inferior_inicial=Seccio_2_abaix_x;

Seccio_2_adalt=Cervell(round(cen(2,3))-65:round(cen(2,3)),round(cen(1,3))-15:round(cen(1,3))+15);
[maxim_Seccio_2_adalt,posicio_Seccio_2_adalt]=max(Seccio_2_adalt);
[Seccio_2_adalt_y,Seccio_2_adalt_x]=max(posicio_Seccio_2_adalt);
Isconstant_2_sup=[];
isconstant_2_sup=Seccio_2_adalt_x;
isconstant_2_sup_inicial=Seccio_2_adalt_x;

for u=1:15;
    if isconstant_2_inicial+8<length(posicio)
        if abs(posicio(max(u,isconstant_2_inicial-7+u))-Seccio_2_y)<=1
            Isconstant_2=[Isconstant_2,isconstant_2];
            isconstant_2=isconstant_2+1;
        end
    else 
        if abs(posicio(end-u+1)-Seccio_2_y)<=1
            Isconstant_2=[Isconstant_2,length(posicio)-u+1];
        end
    end

    if isconstant_2_inferior_inicial+8<length(posicio_Seccio_2_abaix)
        if abs(posicio_Seccio_2_abaix(max(u,isconstant_2_inferior_inicial-7+u))-Seccio_2_abaix_y)<=1
            Isconstant_2_inferior=[Isconstant_2_inferior,isconstant_2_inferior];
            isconstant_2_inferior=isconstant_2_inferior+1;
        end
    else
        if abs(posicio_Seccio_2_abaix(end-u+1)-Seccio_2_abaix_y)<=1
            Isconstant_2_inferior=[Isconstant_2_inferior,length(posicio_Seccio_2_abaix)-u+1];
        end
    end

    if isconstant_2_sup_inicial+8<length(posicio_Seccio_2_adalt)
        if abs(posicio_Seccio_2_adalt(max(u,isconstant_2_sup_inicial-7+u))-Seccio_2_adalt_y)<=1
            Isconstant_2_sup=[Isconstant_2_sup,isconstant_2_sup];
            isconstant_2_sup=isconstant_2_sup+1;
        end
    else
        if abs(posicio_Seccio_2_adalt(end-u+1)-Seccio_2_adalt_y)<=1
            Isconstant_2_sup=[Isconstant_2_sup,length(posicio_Seccio_2_abaix)-u+1];
        end
    end
end
Seccio_2_x=sum(Isconstant_2)/(length(Isconstant_2));
Seccio_2_abaix_x=sum(Isconstant_2_inferior)/(length(Isconstant_2_inferior));
Seccio_2_adalt_x=sum(Isconstant_2_sup)/(length(Isconstant_2_sup));
Seccio_2_y=length(Seccio_2)-Seccio_2_y+1;
Seccio_2_abaix_y=length(Seccio_2_abaix)-Seccio_2_abaix_y+1+round(cen(2,3));
Seccio_2_abaix_x=Seccio_2_abaix_x+round(cen(1,3))-15;
Seccio_2_x=Seccio_2_x+round(cen(1,3))-18;
Seccio_2_y=Seccio_2_y+round(cen(2,3))-18;
Seccio_2_adalt_y=Seccio_2_adalt_y+round(cen(2,3))-65;
Seccio_2_adalt_x=Seccio_2_adalt_x+round(cen(1,3))-15;
p=polyfit([Seccio_2_y,Seccio_2_abaix_y,Seccio_2_adalt_y],[Seccio_2_x,Seccio_2_abaix_x,Seccio_2_adalt_x],1);
vector_x=round(polyval(p,1:tamany(1)));
for  y=1:tamany(1)
    if vector_x(y)>0
        img(y,vector_x(y),:)=0;
        img(y,vector_x(y)+1,:)=0;
        Cervell(y,vector_x(y))=0;
        Infartat(y,vector_x(y))=0;
        Cervell(y,vector_x(y)+1)=0;
        Infartat(y,vector_x(y)+1)=0;
    end
end

Seccio_3=createMask_seccio_3(img,thresholdminY,thresholdmaxCr);
Seccio_3=Seccio_3(round(cen(2,4))-30:round(cen(2,4))+10,round(cen(1,4))-18:round(cen(1,4))+18);
LB = 30; UB = 1000; Seccio_3 = xor(bwareaopen(Seccio_3,LB),  bwareaopen(Seccio_3,UB)); %Neteja
[hola,posicio_3]=max(Seccio_3); posicio_3(hola==0)=100; [Seccio_3_y,Seccio_3_x]=max(posicio_3);
Isconstant_3=[];
isconstant_3=Seccio_3_x;
isconstant_3_inicial=Seccio_3_x;
Seccio_3_abaix=Cervell(round(cen(2,4)):round(cen(2,4))+50,round(cen(1,4))-29:round(cen(1,4))+20);
[maxim_Seccio_3_abaix,posicio_Seccio_3_abaix]=min(Seccio_3_abaix);
[Seccio_3_abaix_y,Seccio_3_abaix_x]=max(posicio_Seccio_3_abaix);
Isconstant_3_inferior=[];
isconstant_3_inferior=Seccio_3_abaix_x;
isconstant_3_inferior_inicial=Seccio_3_abaix_x;

for u=1:15;
    if isconstant_3_inicial+8<length(posicio_3)
        if abs(posicio_3(max(u,isconstant_3_inicial-7+u))-Seccio_3_y)<=1
            Isconstant_3=[Isconstant_3,isconstant_3];
            isconstant_3=isconstant_3+1;
        end
    else 
        if abs(posicio_3(end-u+1)-Seccio_3_y)<=1
            Isconstant_3=[Isconstant_3,length(posicio_3)-u+1];
            isconstant_3=isconstant_3+1;
        end
    end
    if isconstant_3_inferior_inicial+8<length(posicio_Seccio_3_abaix)
        if abs(posicio_Seccio_3_abaix(max(u,isconstant_3_inferior_inicial-7+u))-Seccio_3_abaix_y)<=1
            Isconstant_3_inferior=[Isconstant_3_inferior,isconstant_3_inferior];
            isconstant_3_inferior=isconstant_3_inferior+1;
        end
    else
        if abs(posicio_Seccio_3_abaix(end-u+1)-Seccio_3_abaix_y)<=1
            Isconstant_3_inferior=[Isconstant_3_inferior,length(posicio_Seccio_3_abaix)-u+1];
        end
    end
end
Seccio_3_x=sum(Isconstant_3)/(length(Isconstant_3));
Seccio_3_abaix_x=sum(Isconstant_3_inferior)/(length(Isconstant_3_inferior));
Seccio_3_x=Seccio_3_x+round(cen(1,4))-18;
Seccio_3_y=Seccio_3_y+round(cen(2,4))-30;
Seccio_3_abaix_y=Seccio_3_abaix_y+round(cen(2,4))+1;
Seccio_3_abaix_x=Seccio_3_abaix_x+round(cen(1,4))-29+1;

p=polyfit([Seccio_3_y,Seccio_3_abaix_y],[Seccio_3_x,Seccio_3_abaix_x],1);
vector_x=round(polyval(p,1:tamany(1)));
if mean(posicio_3)==100 || abs(p(1))>0.2
    img(:,round(cen(1,4)))=0;
    Cervell(:,round(cen(1,4)))=0;
    Infartat(:,round(cen(1,4)))=0;
else
    for  y=1:tamany(1)
        if vector_x(y)>0
            img(y,vector_x(y),:)=0;
            Cervell(y,vector_x(y))=0;
            Infartat(y,vector_x(y))=0;
            Cervell(y,vector_x(y)+1)=0;
            Infartat(y,vector_x(y)+1)=0;
        end
    end
end

Cervell(:,round(cen(1,5)))=0;

end

% Imatge P
if nomimatge(11)=='p'

Seccio_6=createMask_seccio_3(img,thresholdminY,thresholdmaxCr);
Seccio_6=Seccio_6(round(cen(2,3))-40:round(cen(2,3)),round(cen(1,3))-18:round(cen(1,3))+18);
LB = 50; UB = 1000; Seccio_6 = xor(bwareaopen(Seccio_6,LB),  bwareaopen(Seccio_6,UB)); %Neteja
[hola,posicio_6]=max(Seccio_6); 
[Seccio_6_y,Seccio_6_x]=max(posicio_6);
Isconstant_6=[];
isconstant_6=Seccio_6_x;
isconstant_6_inicial=Seccio_6_x;
Seccio_6_abaix=Cervell(round(cen(2,3)):round(cen(2,3))+70,round(cen(1,3))-29:round(cen(1,3))+20);
[maxim_Seccio_6_abaix,posicio_Seccio_6_abaix]=min(Seccio_6_abaix);
[Seccio_6_abaix_y,Seccio_6_abaix_x]=min(posicio_Seccio_6_abaix);
Isconstant_6_inferior=[];
isconstant_6_inferior=Seccio_6_abaix_x;
isconstant_6_inferior_inicial=Seccio_6_abaix_x;

for u=1:15;
    if isconstant_6_inicial+8<length(posicio_6)
        if abs(posicio_6(max(u,isconstant_6_inicial-7+u))-Seccio_6_y)<=1
            Isconstant_6=[Isconstant_6,isconstant_6];
            isconstant_6=isconstant_6+1;
        end
    else 
        if abs(posicio_6(end-u+1)-Seccio_6_y)<=1
            Isconstant_6=[Isconstant_6,length(psoicio_6)-u+1];
        end
    end
    if isconstant_6_inferior_inicial+8<length(posicio_Seccio_6_abaix)
        if abs(posicio_Seccio_6_abaix(max(u,isconstant_6_inferior_inicial-7+u))-Seccio_6_abaix_y)<=1
            Isconstant_6_inferior=[Isconstant_6_inferior,isconstant_6_inferior];
            isconstant_6_inferior=isconstant_6_inferior+1;
        end
    else
        if abs(posicio_Seccio_6_abaix(end-u+1)-Seccio_6_abaix_y)<=1
            Isconstant_6_inferior=[Isconstant_6_inferior,length(posicio_Seccio_6_abaix)-u+1];
        end
    end
end
Seccio_6_x=sum(Isconstant_6)/(length(Isconstant_6));
Seccio_6_abaix_x=sum(Isconstant_6_inferior)/(length(Isconstant_6_inferior));
Seccio_6_x=Seccio_6_x+round(cen(1,3))-18;
Seccio_6_y=Seccio_6_y+round(cen(2,3))-40;
Seccio_6_abaix_y=Seccio_6_abaix_y+round(cen(2,3));
Seccio_6_abaix_x=Seccio_6_abaix_x+round(cen(1,3))-29;
p=polyfit([Seccio_6_y,Seccio_6_abaix_y],[Seccio_6_x,Seccio_6_abaix_x],1);
vector_x=round(polyval(p,1:tamany(1)));
if mean(posicio_6)==1 || abs(p(1))>0.2
    img(:,round(cen(1,3)))=0;
    Cervell(:,round(cen(1,3)))=0;
    Infartat(:,round(cen(1,3)))=0;
else
    for  y=1:tamany(1)
        if vector_x(y)>0
            img(y,vector_x(y),:)=0;
            Cervell(y,vector_x(y))=0;
            Infartat(y,vector_x(y))=0;
            Cervell(y,vector_x(y)+1)=0;
            Infartat(y,vector_x(y)+1)=0;
        end
    end
end
% Seccio_7
Seccio_7_abaix=Cervell(round(cen(2,4)):round(cen(2,4))+70,round(cen(1,4))-15:round(cen(1,4))+9);
[maxim_Seccio_7_abaix,posicio_Seccio_7_abaix]=min(Seccio_7_abaix);
[Seccio_7_abaix_y,Seccio_7_abaix_x]=min(posicio_Seccio_7_abaix);
Isconstant_7_inferior=[];
isconstant_7_inferior=Seccio_7_abaix_x;
isconstant_7_inferior_inicial=Seccio_7_abaix_x;
Seccio_7_adalt=Cervell(round(cen(2,4))-75:round(cen(2,4)),round(cen(1,4))-15:round(cen(1,4))+15);
[maxim_Seccio_7_adalt,posicio_Seccio_7_adalt]=max(Seccio_7_adalt);
[Seccio_7_adalt_y,Seccio_7_adalt_x]=max(posicio_Seccio_7_adalt);
Isconstant_7_sup=[];
isconstant_7_sup=Seccio_7_adalt_x;
isconstant_7_sup_inicial=Seccio_7_adalt_x;

for u=1:15;
    if isconstant_7_inferior_inicial+8<length(posicio_Seccio_7_abaix)
        if abs(posicio_Seccio_7_abaix(max(u,isconstant_7_inferior_inicial-7+u))-Seccio_7_abaix_y)<=1
            Isconstant_7_inferior=[Isconstant_7_inferior,isconstant_7_inferior];
            isconstant_7_inferior=isconstant_7_inferior+1;
        end
    else
        if abs(posicio_Seccio_7_abaix(end-u+1)-Seccio_7_abaix_y)<=1
            Isconstant_7_inferior=[Isconstant_7_inferior,length(posicio_Seccio_7_abaix)-u+1];
        end
    end

    if isconstant_7_sup_inicial+8<length(posicio_Seccio_7_adalt)
        if abs(posicio_Seccio_7_adalt(max(u,isconstant_7_sup_inicial-7+u))-Seccio_7_adalt_y)<=1
            Isconstant_7_sup=[Isconstant_7_sup,isconstant_7_sup];
            isconstant_7_sup=isconstant_7_sup+1;
        end
    else
        if abs(posicio_Seccio_7_adalt(end-u+1)-Seccio_7_adalt_y)<=1
            Isconstant_7_sup=[Isconstant_7_sup,length(posicio_Seccio_7_abaix)-u+1];
        end
    end
end
Seccio_7_abaix_x=sum(Isconstant_7_inferior)/(length(Isconstant_7_inferior));
Seccio_7_abaix_y=Seccio_7_abaix_y+round(cen(2,4));
Seccio_7_abaix_x=Seccio_7_abaix_x+round(cen(1,4))-15;
Seccio_7_adalt_y=Seccio_7_adalt_y+round(cen(2,4))-75;
Seccio_7_adalt_x=Seccio_7_adalt_x+round(cen(1,4))-15;
p=polyfit([Seccio_7_adalt_y,Seccio_7_abaix_y,cen(2,4)],[Seccio_7_adalt_x,Seccio_7_abaix_x,cen(1,4)],1);
vector_x=round(polyval(p,1:tamany(1)));
if mean(posicio_6)==1 || abs(p(1))>0.2
    img(:,round(cen(1,4)))=0;
    Cervell(:,round(cen(1,4)))=0;
    Infartat(:,round(cen(1,4)))=0;
else
    for  y=1:tamany(1)
        if vector_x(y)>0
            img(y,vector_x(y),:)=0;
            Cervell(y,vector_x(y))=0;
            Infartat(y,vector_x(y))=0;
            Cervell(y,vector_x(y)+1)=0;
            Infartat(y,vector_x(y)+1)=0;
        end
    end
end

% Seccio 5
Seccio_5=createMask_seccio_3(img,thresholdminY,thresholdmaxCr);
Seccio_5=Seccio_5(round(cen(2,2))-20:round(cen(2,2))+10,round(cen(1,2))-18:round(cen(1,2))+18);
LB = 50; UB = 1000; Seccio_5 = xor(bwareaopen(Seccio_5,LB),  bwareaopen(Seccio_5,UB));
[hola,posicio_5]=max(Seccio_5); 
[Seccio_5_y,Seccio_5_x]=max(posicio_5);
Isconstant_5=[];
isconstant_5=Seccio_5_x;
isconstant_5_inicial=Seccio_5_x;
Seccio_5_abaix=Cervell(round(cen(2,2)):round(cen(2,2))+70,round(cen(1,2))-20:round(cen(1,2))+10);
[maxim_Seccio_5_abaix,posicio_Seccio_5_abaix]=min(Seccio_5_abaix);
[Seccio_5_abaix_y,Seccio_5_abaix_x]=min(posicio_Seccio_5_abaix);
Isconstant_5_inferior=[];
isconstant_5_inferior=Seccio_5_abaix_x;
isconstant_5_inferior_inicial=Seccio_5_abaix_x;

for u=1:15;
    if isconstant_5_inicial+8<length(posicio_5)
        if abs(posicio_5(max(u,isconstant_5_inicial-7+u))-Seccio_5_y)<=1
            Isconstant_5=[Isconstant_5,isconstant_5];
            isconstant_5=isconstant_5+1;
        end
    else 
        if abs(posicio_5(end-u+1)-Seccio_5_y)<=1
            Isconstant_5=[Isconstant_5,length(psoicio_5)-u+1];
        end
    end
    if isconstant_5_inferior_inicial+8<length(posicio_Seccio_5_abaix)
        if abs(posicio_Seccio_5_abaix(max(u,isconstant_5_inferior_inicial-7+u))-Seccio_5_abaix_y)<=1
            Isconstant_5_inferior=[Isconstant_5_inferior,isconstant_5_inferior];
            isconstant_5_inferior=isconstant_5_inferior+1;
        end
    else
        if abs(posicio_Seccio_5_abaix(end-u+1)-Seccio_5_abaix_y)<=1
            Isconstant_5_inferior=[Isconstant_5_inferior,length(posicio_Seccio_5_abaix)-u+1];
        end
    end
end
Seccio_5_x=sum(Isconstant_5)/(length(Isconstant_5));
Seccio_5_abaix_x=sum(Isconstant_5_inferior)/(length(Isconstant_5_inferior));
Seccio_5_x=Seccio_5_x+round(cen(1,2))-18;
Seccio_5_y=Seccio_5_y+round(cen(2,2))-20;
Seccio_5_abaix_y=Seccio_5_abaix_y+round(cen(2,2));
Seccio_5_abaix_x=Seccio_5_abaix_x+round(cen(1,2))-20;
p=polyfit([Seccio_5_y,Seccio_5_abaix_y],[Seccio_5_x,Seccio_5_abaix_x],1);
vector_x=round(polyval(p,1:tamany(1)));
if mean(posicio_5)==1 || abs(p(1))>0.2
    img(:,round(cen(1,2)))=0;
    Cervell(:,round(cen(1,2)))=0;
    Infartat(:,round(cen(1,2)))=0;
else
    for  y=1:tamany(1)
        if vector_x(y)>0
            img(y,vector_x(y),:)=0;
            Cervell(y,vector_x(y))=0;
            Infartat(y,vector_x(y))=0;
            Cervell(y,vector_x(y)+1)=0;
            Infartat(y,vector_x(y)+1)=0;
        end
    end
end


Cervell(:,round(cen(1,5)))=0;
end
[Cervell,n]=bwlabel(Cervell);

%Regions
rp = regionprops(Cervell,{'Area','Centroid'});
Area = [rp.Area];
TH = 1000;
id = Area>TH;
Area=Area(id);
cen=[rp(id).Centroid];
cen = reshape(cen,[2, sum(id)]);
Infartat_double=im2double(Infartat);
[Eliminacio_pics,~]=segmentImage(Infartat_double);
Eliminacio_pics=Eliminacio_pics+Infartat_double;
tamany=size(Eliminacio_pics);
identificador_1=zeros(tamany(1),tamany(2));

identificador_1(:,round(cen(1,2)):round(cen(1,3)))=Eliminacio_pics(:,round(cen(1,2)):round(cen(1,3)))==1;
identificador_1(:,round(cen(1,4)):round(cen(1,5)))=Eliminacio_pics(:,round(cen(1,4)):round(cen(1,5)))==1;
identificador_1(:,round(cen(1,6)):round(cen(1,7)))=Eliminacio_pics(:,round(cen(1,6)):round(cen(1,7)))==1;
identificador_1(:,round(cen(1,8)):round(cen(1,9)))=Eliminacio_pics(:,round(cen(1,8)):round(cen(1,9)))==1;

Infartat(logical(identificador_1))=0;

% Càlcul i identificació de la zona infartada
[Infartat,~]=bwlabel(Infartat);
rpinfartada = regionprops(Infartat,{'Area','Centroid'});
AreaInfartada = [rpinfartada.Area];
TH = 500;
id = AreaInfartada>TH;
AreaInfartada=AreaInfartada(id);
ceninfartada=[rpinfartada(id).Centroid];
ceninfartada = reshape(ceninfartada,[2, sum(id)]);
% Cas P
if nomimatge(11)=='p'
    dist1= sum((ceninfartada-cen(:,3)).^2);
    dist2= sum((ceninfartada-cen(:,5)).^2);
    dist3= sum((ceninfartada-cen(:,7)).^2);
    dist4= sum((ceninfartada-cen(:,9)).^2);
    [~,i1] = min(dist1);    AreaInfartada1=AreaInfartada(i1);
    [~,i2] = min(dist2);    AreaInfartada2=AreaInfartada(i2);
    [~,i3] = min(dist3);    AreaInfartada3=AreaInfartada(i3);
    [m,i4] = min(dist4);    AreaInfartada4=AreaInfartada(i4);

    % rati
    Rati1=AreaInfartada1/Area(3);   AreaIpsi1=Area(3);      AreaContra1=Area(2);
    Rati2=AreaInfartada2/Area(5);   AreaIpsi2=Area(5);      AreaContra2=Area(4);
    Rati3=AreaInfartada3/Area(7);   AreaIpsi3=Area(7);      AreaContra3=Area(6);
    Rati4=AreaInfartada4/Area(9);   AreaIpsi4=Area(9);      AreaContra4=Area(8);
    % Aquest no està bé perquè 
end

if nomimatge(11)=='a'
    dist1= sum((ceninfartada-cen(:,2)).^2);
    dist2= sum((ceninfartada-cen(:,4)).^2);
    dist3= sum((ceninfartada-cen(:,6)).^2);
    dist4= sum((ceninfartada-cen(:,8)).^2);
    [~,i1] = min(dist1);    AreaInfartada1=AreaInfartada(i1);
    [~,i2] = min(dist2);    AreaInfartada2=AreaInfartada(i2);
    [~,i3] = min(dist3);    AreaInfartada3=AreaInfartada(i3);
    [m,i4] = min(dist4);    AreaInfartada4=AreaInfartada(i4);

    % rati
    Rati1=AreaInfartada1/Area(2);   AreaIpsi1=Area(2);      AreaContra1=Area(3);
    Rati2=AreaInfartada2/Area(4);   AreaIpsi2=Area(4);      AreaContra2=Area(5);
    Rati3=AreaInfartada3/Area(6);   AreaIpsi3=Area(6);      AreaContra3=Area(7);
    Rati4=AreaInfartada4/Area(8);   AreaIpsi4=Area(8);      AreaContra4=Area(9);

end

% Visualitzar regió infartada
R=img(:,:,1); G=img(:,:,2); B=img(:,:,3);
R(Infartat>0)=255; G(Infartat>0)=230; B(Infartat>0)=0;
IMG(:,:,1)=R; IMG(:,:,2)=G; IMG(:,:,3)=B;
% Detecció densitat de pixels
mida=size(Linees); ample=mida(2); alcada=mida(1);
Linees(:,round(ample/16),:)=0;
%Linees(round(alcada/32),:,:)=0;
for i=1:8
    Linees(:,round(ample*i/8),:)=0;
end
for j=1:4
    Linees(round(alcada*j/4),:)=0;
end
[Linees,~]=bwlabel(Linees);
rplinees = regionprops(Linees,{'Area','Centroid','MinorAxisLength',});
AreaLinees = [rplinees.Area];
TH = 50;
id = AreaLinees>TH;
AreaLinees=AreaLinees(id);
cenlinees=[rplinees(id).Centroid];
cenlinees = reshape(cenlinees,[2, sum(id)]);
%De los de los 40 primeros pixeles, coger el primero respecto al 0,0 luego
%ver cual es el mas cercano a este
identificador_linees=cenlinees(2,:)<40;
Centres_1=cenlinees(1,:);   Centres_2=cenlinees(2,:);
Centres_1=Centres_1(identificador_linees);
densitat_pixels=(Centres_1(2)-Centres_1(1))/2.5;

%Vertical
[Cervell,n]=bwlabel(CervellVertical);

%Regions
rp = regionprops(Cervell,{'Area','Centroid'});
Area = [rp.Area];
TH = 1000;
id = Area>TH;
Area=Area(id);
cen=[rp(id).Centroid];
cen = reshape(cen,[2, sum(id)]);
Infartat_double=im2double(InfartatVertical);
[Eliminacio_pics,~]=segmentImage(Infartat_double);
Eliminacio_pics=Eliminacio_pics+Infartat_double;
tamany=size(Eliminacio_pics);
identificador_1=zeros(tamany(1),tamany(2));

identificador_1(:,round(cen(1,2)):round(cen(1,3)))=Eliminacio_pics(:,round(cen(1,2)):round(cen(1,3)))==1;
identificador_1(:,round(cen(1,4)):round(cen(1,5)))=Eliminacio_pics(:,round(cen(1,4)):round(cen(1,5)))==1;
identificador_1(:,round(cen(1,6)):round(cen(1,7)))=Eliminacio_pics(:,round(cen(1,6)):round(cen(1,7)))==1;
identificador_1(:,round(cen(1,8)):round(cen(1,9)))=Eliminacio_pics(:,round(cen(1,8)):round(cen(1,9)))==1;

Infartat(logical(identificador_1))=0;

% Zona infartada metode vertical
[Infartat,~]=bwlabel(InfartatVertical);
rpinfartada = regionprops(Infartat,{'Area','Centroid'});
AreaInfartada = [rpinfartada.Area];
TH = 500;
id = AreaInfartada>TH;
AreaInfartada=AreaInfartada(id);
ceninfartada=[rpinfartada(id).Centroid];
ceninfartada = reshape(ceninfartada,[2, sum(id)]);
% Cas P
if nomimatge(11)=='p'
    dist1= sum((ceninfartada-cen(:,3)).^2);
    dist2= sum((ceninfartada-cen(:,5)).^2);
    dist3= sum((ceninfartada-cen(:,7)).^2);
    dist4= sum((ceninfartada-cen(:,9)).^2);
    [~,i1] = min(dist1);    AreaInfartada1V=AreaInfartada(i1);
    [~,i2] = min(dist2);    AreaInfartada2V=AreaInfartada(i2);
    [~,i3] = min(dist3);    AreaInfartada3V=AreaInfartada(i3);
    [m,i4] = min(dist4);    AreaInfartada4V=AreaInfartada(i4);

    % rati
    Rati1V=AreaInfartada1V/Area(3);     AreaIpsiV1=Area(3);     AreaContraV1=Area(2);
    Rati2V=AreaInfartada2V/Area(5);     AreaIpsiV2=Area(5);     AreaContraV2=Area(4);
    Rati3V=AreaInfartada3V/Area(7);     AreaIpsiV3=Area(7);     AreaContraV3=Area(6);
    Rati4V=AreaInfartada4V/Area(9);     AreaIpsiV4=Area(9);     AreaContraV4=Area(8);
    % Aquest no està bé perquè 
end
if nomimatge(11)=='a'
    dist1= sum((ceninfartada-cen(:,2)).^2);
    dist2= sum((ceninfartada-cen(:,4)).^2);
    dist3= sum((ceninfartada-cen(:,6)).^2);
    dist4= sum((ceninfartada-cen(:,8)).^2);
    [~,i1] = min(dist1);    AreaInfartada1V=AreaInfartada(i1);
    [~,i2] = min(dist2);    AreaInfartada2V=AreaInfartada(i2);
    [~,i3] = min(dist3);    AreaInfartada3V=AreaInfartada(i3);
    [m,i4] = min(dist4);    AreaInfartada4V=AreaInfartada(i4);

    % rati
    Rati1V=AreaInfartada1V/Area(2);     AreaIpsiV1=Area(2);     AreaContraV1=Area(3);
    Rati2V=AreaInfartada2V/Area(4);     AreaIpsiV2=Area(4);     AreaContraV2=Area(5);
    Rati3V=AreaInfartada3V/Area(6);     AreaIpsiV3=Area(6);     AreaContraV3=Area(7);
    Rati4V=AreaInfartada4V/Area(8);     AreaIpsiV4=Area(8);     AreaContraV4=Area(9);
end

AreaInfartadamm1=AreaInfartada1/(densitat_pixels^2);
AreaInfartadamm2=AreaInfartada2/(densitat_pixels^2);
AreaInfartadamm3=AreaInfartada3/(densitat_pixels^2);
AreaInfartadamm4=AreaInfartada4/(densitat_pixels^2);
