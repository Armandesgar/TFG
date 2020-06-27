function [x1,x2,x3,x4]=punts_linees(nomcsv_linees)
%Identificació dels 4 punts per fer la matriu de correcció de perspectiva
t=readtable(nomcsv_linees);
t.Properties.VariableNames={'scorer','AEX','AEY','LAE','ADX','ADY','LAD','aEX','aEY','LaE','aDX','aDY','LaD'};

AEX=cellfun(@str2num,t.AEX(3:end));
AEY=cellfun(@str2num,t.AEY(3:end));
x1=[mode(AEX),mode(AEY)];
%Adhesiu
ADX=cellfun(@str2num,t.ADX(3:end));
ADY=cellfun(@str2num,t.ADY(3:end));
x2=[mode(ADX),mode(ADY)];
%Potes de davant
aEX=cellfun(@str2num,t.aEX(3:end));
aEY=cellfun(@str2num,t.aEY(3:end));
x3=[mode(aEX),mode(aEY)];
aDX=cellfun(@str2num,t.aDX(3:end));
aDY=cellfun(@str2num,t.aDY(3:end));
x4=[mode(aDX),mode(aDY)];
