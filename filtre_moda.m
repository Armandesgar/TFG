clear all
close all
%Llegim el video
video=VideoReader(nomvideo); 
n=video.NumberOfFrames;
c=floor(n/50);
vector=floor(linspace(1,n,50));

k=1;
%Guardem les imatges en forma de matrius, i per colors RGB
for q=vector
    img=read(video,q);
    r(:,:,k)=img(:,:,1);
    g(:,:,k)=img(:,:,2);
    b(:,:,k)=img(:,:,3);
    k = k+1;
end
%
% Fem la moda de cada component

A(:,:,1)=mode(r,3);

R=double(r);
R(r==A(:,:,1))=NaN;
B(:,:,1)=mode(R,3);

A(:,:,2)=mode(g,3);

G=double(g);
G(g==A(:,:,2))=NaN;
B(:,:,2)=mode(G,3);

A(:,:,3)=mode(b,3);

B=double(b);
B(b==A(:,:,3))=NaN;
B(:,:,3)=mode(B,3);

B=uint8(B);
imshow(A)
figure(2)
imshow(B)
