%Reconocimiento de voz por correlacion
%Este archivo permite grabar audios .wav para ser usados en el analisis de
%correlacion
clear all;
close all;

palabra_grabada=input('Para grabar una palabra modifique el nombre del archivo .wav y pulse 1: ');

t=4; %tiempo de grabacion
Fs=44100;
v=audiorecorder(Fs,24,1);
disp('INICIO GRABACION')
recordblocking(v,t);
disp('FIN GRABACION')

audiograbado=getaudiodata(v,'single'); %vector de audio
sound(audiograbado,Fs);
figure;
plot(audiograbado);
title('GRAFICA SEÑAL EN EL TIEMPO');
%voz=audiograbado;


if(palabra_grabada==1)
    audiowrite('si.wav',audiograbado,Fs);
    si=audioread('si.wav');
    
    %Normalizacion de la señal
    maximo=max(abs(si));
    n=length(si);
    
    for i=1:n
        normsi(i)=si(i)/maximo;
    end
    fftsi=abs(fft(si));
    figure;
    subplot(2,1,1),plot(normsi,'r');title('Si normalizado');
    subplot(2,1,2),plot(fftsi,'r');title('TF si');
end

