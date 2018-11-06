%function to process the audio as per the question with various sigmas
% g= convolvution signal of s(x) and h(x)
% Fs = sampling constant of signal
% h =  convolution array given in question
% var  =  variance
% index = number corresponding to different sigma. each time file is saved
% as per the instructions
% ft_spect is a function to plot the phase and amplitude plot of the audio
% signal to analyse and compare for various sigmas and convolutions
function [y,i_Y_by_H, z]=audioprocess(g,Fs,h,var,index)
m=0; y=imnoise(g,'Gaussian',m,var); audiowrite(strcat('y',index,'.wav'), y,Fs); % addition of noise
Y=fft(y,length(y));
H=fft(h,length(h));
i_Y_by_H=ifft(Y/H,length(Y/H));
i_Y_by_H=i_Y_by_H(:,1);
audiowrite(strcat('idft_y',index,'h.wav'),i_Y_by_H,Fs);
G=mvnrnd(0,var,length(Y)); Gw=fft(G,length(G));
Y_by_H=Y/H;
z=ifft(Y_by_H(:,1).*Gw, length(Y_by_H));
audiowrite(strcat('z',index,'.wav'),z,Fs);
ft_spect(z,Fs) % for plotting amplitude and phase spectrum of fft of signal 
% for plotting 'i_Y_by_H' other than y just replace y with 'i_Y_by_H' as the argument to the ft_spect function. 
end

