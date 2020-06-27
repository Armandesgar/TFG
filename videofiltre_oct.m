% Obrim video
function videofiltre_oct(nomvideo,nounomvideo)
tic
video=VideoReader(nomvideo); 
n=video.NumberOfFrames;
c=floor(n/50);
vector=floor(linspace(1,n,50));
k=1;
%Guardem 50 imatges equiespaiades
for q=vector
    img=read(video,q);
    gray(:,:,k) = rgb2gray(img);
    k = k+1;
end
toc
% Busquem la posició del ratolí
ratoli = zeros(2,50);
cen=[190;190];
for i = 1:50
    I = (gray(:,:,i)<45);
    rp = regionprops(I,{'Area','Centroid'});
    Area = [rp.Area];
    TH = 1500;
    id = Area>TH;
    cen=[rp(id).Centroid];
    cen = reshape(cen,[2, sum(id)]);
    dist = sum((cen-[192;188]).^2);
    [m,ii] = min(dist);
    ratoli(:,i) = cen(:,ii);
%     figure(1)
%     clf
%     imagesc(I)
%     hold on
%     plot(ratoli(1,i),ratoli(2,i),'or')
%     title(num2str(i))
%     pause
end
[m,esq]=min(ratoli(1,:));
[m,dret]=max(ratoli(1,:));
%toc
% Busquem les dues posicions més separades per fer el filtre
[m,top]=min(ratoli(2,:));
[m,bot]=max(ratoli(2,:));
updown=round((ratoli(2,bot)+ratoli(2,top))/2);
leftright=round((ratoli(1,dret)+ratoli(1,esq))/2);
if updown>=leftright
    topp=vector(top);
    bott=vector(bot);
    filtre=read(video,topp);
    framebaix=read(video,bott);
    filtre(1:updown,:,:)=framebaix(1:updown,:,:);
    
else
    esqq=vector(esq);
    drett=vector(dret);
    filtre=read(video,esqq);
    framedret=read(video,drett);
    filtre(:,1:leftright,:)=framedret(:,1:leftright,:);
end
%Obtenim el filtre
imshow(filtre)
toc

% Apliquem el filtre
p=VideoWriter(nounomvideo);
open(p)
for u=[1:n]
    frame=read(video,u);
    test=imsubtract(filtre,frame);
    test=uint8(test);
    test=imcomplement(test);
    %imshow(test)
    writeVideo(p,test)
    %pause(0.005)
end
close(p)
toc
