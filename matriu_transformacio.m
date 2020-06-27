function C=matriu_transformacio(x1,x2,x3,x4);
%x1=[450,132]; x2=[1392,117]; x3=[561,848]; x4=[1269,820];
xE=x1(1); xD=x2(1); xe=x3(1); xd=x4(1);
yE=x1(2); yD=x2(2); ye=x3(2); yd=x4(2);

M=[xE,xD,xe;yE,yD,ye;1,1,1];
N=[xd;yd;1];
Parametres=M\N;
A(:,1)=M(:,1)*Parametres(1);
A(:,2)=M(:,2)*Parametres(2);
A(:,3)=M(:,3)*Parametres(3);
M=[0,18,0;0,0,20;1,1,1];
N=[18;20;1];
Parametres=M\N;
B(:,1)=M(:,1)*Parametres(1);
B(:,2)=M(:,2)*Parametres(2);
B(:,3)=M(:,3)*Parametres(3);
C=B*inv(A);

% Punt=C*PIXEL;
% x=Punt(1)/Punt(3);
% y=Punt(2)/Punt(3);


