%PALABRAS GRABADAS
%Este codigo permite la lectura de un nuevo audio y el calculo del vector
%de probabilidades de la señal entrante con las señales almacenadas
%Se debe usar invocar las variables globales de este archivo desde el
%codigo principal
inicio=audioread('Audios/Inicio_grabacion.mp3');
%Grabacion de la voz a reconocer
t=6; %tiempo de grabacion
Fs=44100;
v=audiorecorder(Fs,24,1);
disp('INICIO GRABACION')
soundsc(inicio,20000);
recordblocking(v,t);
disp('FIN GRABACION')
audiograbado=getaudiodata(v,'single'); %vector de audio
%sound(audiograbado,Fs);

trainedNet=load("trainedNetwork_2.mat")
prediccion=predecirv2(audiograbado, Fs, trainedNet,1);

clases=["no","si"];
global predicted
[maximo, ind]=max(prediccion);
if ind==1
    predicted="no";
end;
if ind==2
    predicted="si";
end;