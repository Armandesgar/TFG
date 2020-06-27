function [nasX,nasY,adhX,adhY,potaEX,potaEY,potaDX,potaDY,potaeX,potaeY,potadX,potadY,cuaX,cuaY,ficuaX,ficuaY]=canvi_a_cm(C,nas,adh,potaE,potaD,potae,potad,cua,ficua)

nas=C*nas; nasX=nas(1,:)./nas(3,:); nasY=nas(2,:)./nas(3,:);
adh=C*adh; adhX=adh(1,:)./adh(3,:); adhY=adh(2,:)./adh(3,:);
potaE=C*potaE; potaEX=potaE(1,:)./potaE(3,:); potaEY=potaE(2,:)./potaE(3,:);
potaD=C*potaD; potaDX=potaD(1,:)./potaD(3,:); potaDY=potaD(2,:)./potaD(3,:);
potae=C*potae; potaeX=potae(1,:)./potae(3,:); potaeY=potae(2,:)./potae(3,:);
potad=C*potad; potadX=potad(1,:)./potad(3,:); potadY=potad(2,:)./potad(3,:);
cua=C*cua; cuaX=cua(1,:)./cua(3,:); cuaY=cua(2,:)./cua(3,:);
ficua=C*ficua; ficuaX=ficua(1,:)./ficua(3,:); ficuaY=ficua(2,:)./ficua(3,:);