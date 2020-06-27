function nouvector=filtre_5_punts(vector);
%prova 1,3,5,3,1 i dividit per 13
%prova 1,2,3,2,1 i dividit per 9
%prova 1,3,7,3,1 i dividit per 15
nouvector=zeros(1,length(vector));
nouvector(1)=vector(1); nouvector(2)=vector(2); nouvector(end-1)=vector(end-1); nouvector(end)=vector(end);
for l=[3:length(vector)-2]
    nouvector(l)=(vector(l-2)+3*vector(l-1)+5*vector(l)+3*vector(l+1)+vector(l+2))/13;
    %nouvector(l)=(vector(l-2)+2*vector(l-1)+3*vector(l)+2*vector(l+1)+vector(l+2))/9;
    %nouvector(l)=(vector(l-2)+3*vector(l-1)+7*vector(l)+3*vector(l+1)+vector(l+2))/15;
end
