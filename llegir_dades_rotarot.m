function [Ratoli_1_Y,LRatoli_1,Ratoli_2_Y,LRatoli_2,Ratoli_3_Y,LRatoli_3,Ratoli_4_Y,LRatoli_4]=llegir_dades_rotarot(nomcsv);
%Llegim dades
t=readtable(nomcsv);
t.Properties.VariableNames={'scorer','Ratoli_1_X','Ratoli_1_Y','LRatoli_1','Ratoli_2_X','Ratoli_2_Y','LRatoli_2','Ratoli_3_X','Ratoli_3_Y','LRatoli_3','Ratoli_4_X','Ratoli_4_Y','LRatoli_4'};
Ratoli_1_X=cellfun(@str2num,t.Ratoli_1_X(4:end));
Ratoli_1_Y=cellfun(@str2num,t.Ratoli_1_Y(4:end));
LRatoli_1=cellfun(@str2num,t.LRatoli_1(4:end));
Ratoli_2_X=cellfun(@str2num,t.Ratoli_2_X(4:end));
Ratoli_2_Y=cellfun(@str2num,t.Ratoli_2_Y(4:end));
LRatoli_2=cellfun(@str2num,t.LRatoli_2(4:end));
Ratoli_3_X=cellfun(@str2num,t.Ratoli_3_X(4:end));
Ratoli_3_Y=cellfun(@str2num,t.Ratoli_3_Y(4:end));
LRatoli_3=cellfun(@str2num,t.LRatoli_3(4:end));
Ratoli_4_X=cellfun(@str2num,t.Ratoli_4_X(4:end));
Ratoli_4_Y=cellfun(@str2num,t.Ratoli_4_Y(4:end));
LRatoli_4=cellfun(@str2num,t.LRatoli_4(4:end));
