clear all
close all
tic
video=VideoReader('080915Tape24h 607DR1.mp4'); 
n=video.NumberOfFrames;
c=floor(n/50);
vector=floor(linspace(1,n,50));
k=1;

for q=vector
    img=read(video,q);
    %r(:,:,k)=img(:,:,1);
    %g(:,:,k)=img(:,:,2);
    %b(:,:,k)=img(:,:,3);
    gray(:,:,k) = rgb2gray(img);
    k = k+1;
end
toc
%%
ratoli = zeros(2,50);
for i = 1:50
I = (gray(:,:,i)<45);
rp = regionprops(I,{'Area','Centroid'});
Area = [rp.Area];
TH = 5000;
id = Area>TH;
cen=[rp(id).Centroid];
cen = reshape(cen,[2, sum(id)]);
dist = sum((cen-[960;540]).^2);
[m,ii] = min(dist);
ratoli(:,i) = cen(:,ii);
figure(1)
clf
imagesc(I)
hold on
plot(ratoli(1,i),ratoli(2,i),'or')
title(num2str(i))
pause
end
[m,esq]=min(ratoli(1,:));
[m,dret]=max(ratoli(1,:));
toc
%%
[m,top]=min(ratoli(2,:));
[m,bot]=max(ratoli(2,:));
updown=round((ratoli(2,bot)+ratoli(2,top))/2);
leftright=round((ratoli(1,dret)+ratoli(1,esq))/2);
if updown>=leftright
    print('Updown')
    topp=vector(top);
    bott=vector(bot);
    filtre=read(video,topp);
    framebaix=read(video,bott);
    filtre(1:updown,:,:)=framebaix(1:updown,:,:);
    
else
    print('Leftright')
    esqq=vector(esq);
    drett=vector(dret);
    filtre=read(video,esqq);
    framedret=read(video,drett);
    filtre(:,1:leftright,:)=framedret(:,1:leftright,:);
end

imshow(filtre)
toc