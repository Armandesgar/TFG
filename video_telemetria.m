%Codi per generar un video amb diferents gràfiques mostrant en temps real el valor d'algunes variables
video=VideoReader('Esquelet_amb_filtre_de_dades_607DR2.avi'); %Usar el de los datos mejorados
esquelet=VideoReader('Fake-ratolí-cm.avi');
figure(1)

n=esquelet.NumberOfFrames
for p=[1:n]
    ax1=axes('Position',[0.02 0.40 0.5 0.55]);
    img=read(video,p);
    imshow(img)
    ax2=axes('Position',[0.6 0.7 0.35 0.25]);
    plot(time(1:p),distanciaadhE(1:p))
    axis([0,8,0,0.8])
    ylabel("Distancia (cm)")
    grid on
    ax3=axes('Position',[0.07,0.05,0.4,0.35]);
    rat=read(esquelet,p);
    imshow(rat)
    ax3=axes('Position',[0.6,0.4,0.35,0.25]);
    plot(time(1:p),a(1:p))
    axis([0,8,0,180])
    ylabel('Angle de la cua (º)')
    grid on
    ax4=axes('Position',[0.6,0.1,0.35,0.25]);
    plot(time(1:p),velocitatA(1:p))
    axis([0,8,0,35])
    xlabel('Temps (s)')
    ylabel("Velocitat adhesiu (cm/s)")
    grid on
%     I=getframe(gcf);
%     img=I.cdata;
%     writeVideo(L,img);
end
% close(L)
