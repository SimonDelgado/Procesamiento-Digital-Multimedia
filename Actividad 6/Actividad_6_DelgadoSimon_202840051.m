clc, clear;

% Se generará el algoritmo para agregar reverberación a la señal de audio
% Primero se sube el archivo 'guitar'

[guitar, fs] = audioread('acoustic-guitar-loop-f-91bpm-132687.mp3');

% Se crea el system object 'reverberator'

reverb = reverberator( ...
    'PreDelay', 0.1, ...         % Retardo inicial en segundos
    'WetDryMix', 0.3, ...        % Mezcla entre señal original y reverberada
    'HighCutFrequency', 2000, ...% Filtro de corte alto en Hz
    'SampleRate', fs);           % Frecuencia de muestreo

% Se aplica la reverberación al audio original

guitar_reverb = reverb(guitar);


% Se reproducirán ambos audios, el original y el de reverb agregado, además
% de graficarlos para una mejor comparación

disp('Reproduciendo Audio Original');
sound(guitar, fs);
pause(length(guitar)/fs + 2);

disp('Reproduciendo Audio con Reverberación');
sound(guitar_reverb, fs);

t = (0:length(guitar)-1) / fs;

figure;
subplot(2, 1, 1);
plot(t, guitar);
title('Audio Original');
xlabel('tiempo [s]');
ylabel('Amplitud');

subplot(2, 1, 2);
plot(t, guitar_reverb);
title('Audio con Reverberación');
xlabel('tiempo [s]');
ylabel('Amplitud');