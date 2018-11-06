% this function is used for plotting phase and magntitude spectrum of the
% signal
function ft_spect(s,Fs)
NFFT=length(s);
f = Fs*linspace(0,1,NFFT);
S=fft(s,length(s));
subplot(211),subplot(211), plot(f/1000,mag2db(abs(S))),
        xlabel('Frequency (kHz)'),ylabel('Amplitude(in dB)'),title('Amplitude spectrum')
subplot(212), plot(f/1000,unwrap(angle(S))), xlabel('Frequency (kHz)'),ylabel('Angle (rad)'),
title('Phase spectrum')
end
