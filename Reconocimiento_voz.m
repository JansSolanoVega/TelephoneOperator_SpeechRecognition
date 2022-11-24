%PALABRAS GRABADAS
%Este codigo permite la lectura de un nuevo audio y el calculo del vector
%correlacion de la señal entrante con las señales almacenadas
%Se debe usar invocar las variables globales de este archivo desde el
%codigo principal
si=audioread('si.wav');
no=audioread('no.wav');
inicio=audioread('Audios/Inicio_grabacion.mp3');
a=[0.1 -0.95];
b=[1 -0.99];

%SI
si= filter(a,b,si);
maxsi=max(abs(si));
n=length(si);
    
for i=1:n
    normsi(i)=si(i)/maxsi;
end
fftsi=abs(fft(normsi)); %transformada de fourier
fftsi=fftsi.*conj(fftsi);

%NO
no= filter(a,b,no);
maxno=max(abs(no));
n=length(no);
    
for i=1:n
    normno(i)=no(i)/maxno;
end
fftno=abs(fft(normno)); %transformada de fourier
fftno=fftno.*conj(fftno);


%Grabacion de la voz a reconocer
t=4; %tiempo de grabacion
Fs=44100;
v=audiorecorder(Fs,24,1);
disp('INICIO GRABACION')
soundsc(inicio,20000);
recordblocking(v,t);
disp('FIN GRABACION')
audiograbado=getaudiodata(v,'single'); %vector de audio
%sound(audiograbado,Fs);

%Normalizacion de la palabra grabada
audiograbado= filter(a,b,audiograbado);
maxaudio=max(abs(audiograbado));
n=length(audiograbado);
    
for i=1:n
    x(i)=audiograbado(i)/maxaudio;
end
fftaudio=abs(fft(x)); %transformada de fourier
fftaudio=fftaudio.*conj(fftaudio);

%Se comenta para el codigo final, solo es referencia
% figure;
% subplot(3,4,1),plot(si),title('Señal cuarenta');
% subplot(3,4,2),plot(no),title('Señal ochenta');
% subplot(3,4,3),plot(no),title('Señal cien');
% subplot(3,4,4),plot(fftsi),title('FFT cuarenta');
% subplot(3,4,5),plot(fftno),title('FFT ochenta');
% subplot(3,4,6),plot(fftno),title('FFT cien');
% subplot(3,4,7),plot(audiograbado),title('Señal audio entrante');
% subplot(3,4,8),plot(fftaudio),title('FFT audio entrante');

%calculo de correlacion de la señal entrante con las palabras grabadas
global corrsi
global corrno
corrsi=corr2(fftaudio,fftsi);
corrno=corr2(fftaudio,fftno);



