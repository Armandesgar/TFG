function [nas,adh,potaE,potaD,potae,potad,cua,ficua]=llegir_dades(nomcsv);
t=readtable(nomcsv);
t.Properties.VariableNames={'scorer','nasX','nasY','Lnas','adhX','adhY','Ladh','potaEX','potaEY','LpotaE','potaDX','potaDY','LpotaD','potaeX','potaeY','Lpotae','potadX','potadY','Lpotad','cuaX','cuaY','Lcua','ficuaX','ficuaY','Lficua'};
nasX=cellfun(@str2num,t.nasX(4:end));
nasY=cellfun(@str2num,t.nasY(4:end));
nas=[nasX';nasY';ones(1,length(nasX))];
%Adhesiu
adhX=cellfun(@str2num,t.adhX(4:end));
adhY=cellfun(@str2num,t.adhY(4:end));
adh=[adhX';adhY';ones(1,length(adhX))];
%Potes de davant
potaEX=cellfun(@str2num,t.potaEX(4:end));
potaEY=cellfun(@str2num,t.potaEY(4:end));
potaE=[potaEX';potaEY';ones(1,length(adhX))];
potaDX=cellfun(@str2num,t.potaDX(4:end));
potaDY=cellfun(@str2num,t.potaDY(4:end));
potaD=[potaDX';potaDY';ones(1,length(adhX))];
%potes de darrere
potaeX=cellfun(@str2num,t.potaeX(4:end));
potaeY=cellfun(@str2num,t.potaeY(4:end));
potae=[potaeX';potaeY';ones(1,length(adhX))];
potadX=cellfun(@str2num,t.potadX(4:end));
potadY=cellfun(@str2num,t.potadY(4:end));
potad=[potadX';potadY';ones(1,length(adhX))];
%cua
cuaX=cellfun(@str2num,t.cuaX(4:end));
cuaY=cellfun(@str2num,t.cuaY(4:end));
cua=[cuaX';cuaY';ones(1,length(adhX))];
%finalcua
ficuaX=cellfun(@str2num,t.ficuaX(4:end));
ficuaY=cellfun(@str2num,t.ficuaY(4:end));
ficua=[ficuaX';ficuaY';ones(1,length(adhX))];
