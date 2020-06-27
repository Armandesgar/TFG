function ratoli=centremasses_ratoli(video)
video=VideoReader(video); 
n=video.NumberOfFrames;
% c=floor(n/50);
% vector=floor(linspace(1,n,50));
k=1;

for q=[1:n]
    img=read(video,q);
    gray(:,:,k) = rgb2gray(img);
    k = k+1;
end

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
