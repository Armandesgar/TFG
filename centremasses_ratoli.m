function ratoli=centremasses_ratoli(video)
%Llegim el vídeo
video=VideoReader(video); 
n=video.NumberOfFrames;
k=1;
%S'agafen 50 imatges equiespaiades, per a no ocupar tota la memòria.
for q=[1:n]
    img=read(video,q);
    gray(:,:,k) = rgb2gray(img);
    k = k+1;
end
%Busquem la regió que identifica el ratolí
ratoli = zeros(2,n);
for i = 1:n
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
    % figure(1)
    % clf
    % imagesc(I)
    % hold on
    % plot(ratoli(1,i),ratoli(2,i),'or')
    % title(num2str(i))
    % pause
end
ratoli=[ratoli;ones(1,length(ratoli))];
