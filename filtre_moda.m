clear all
close all
video=VideoReader(nomvideo); 
n=video.NumberOfFrames;
c=floor(n/50);
vector=floor(linspace(1,n,50));
%r=zeros(1080,1920,c);
%g=zeros(1080,1920,c);
%b=zeros(1080,1920,c);
k=1;
%for q=[1:c:n]
for q=vector
    img=read(video,q);
    r(:,:,k)=img(:,:,1);
    g(:,:,k)=img(:,:,2);
    b(:,:,k)=img(:,:,3);
    k = k+1;
end
%%
A(:,:,1)=mode(r,3);
%r(r==A(:,:,1))=NaN;
R=double(r);
R(r==A(:,:,1))=NaN;
B(:,:,1)=mode(R,3);

A(:,:,2)=mode(g,3);
%g(g==A(:,:,2))=NaN;
G=double(g);
G(g==A(:,:,2))=NaN;
B(:,:,2)=mode(G,3);

A(:,:,3)=mode(b,3);
%b(b==A(:,:,3))=NaN;
B=double(b);
B(b==A(:,:,3))=NaN;
B(:,:,3)=mode(B,3);

B=uint8(B);
imshow(A)
figure(2)
imshow(B)