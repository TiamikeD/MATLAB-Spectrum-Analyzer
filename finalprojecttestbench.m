% ECE 314 Final Project
% Real time audio spectrum analyzer

Fs = 44000; % Sampling Frequency
T = 1/Fs; % Sampling Period (Not used)
L = 22000; % Resolution of FFT 
pauseTime = 0.05; %time between each update of graph
numSamples = Fs * pauseTime; 
f = Fs * (0:L/2)/L; % For labeling the boxes of FFT by frequency in plot function

audioInput = audiorecorder(Fs, 16, 1);
disp('Start of recording.')
record(audioInput, 40); %How long recording lasts in seconds
pause(0.2)

while audioInput.isrecording()
    pause(pauseTime); %Let a get audio values
    a = getaudiodata(audioInput);
    b = fft(a(end-numSamples:length(a)),L); %Perform FFT
    P2 = abs(b);
    P1 = P2(1:end/2+1); %Remove unwanted data from fft()
    plot(f,P1)
    ylim([0 250])
    xlim([0 4000]) %Can be adjusted according to desired frequency range
end

disp('End of recording.')
