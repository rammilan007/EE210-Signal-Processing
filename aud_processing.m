% Audio processing
[s,Fs]=audioread('s.wav');
h=(1/7)*ones(7,1);
%sound(y,Fs);
g=conv(s(:,1),h); % convolved s with h
audiowrite('g.wav',g,Fs); % saved g 
ft_spect(s(:,1),Fs); suptitle('original signal')
figure
ft_spect(g,Fs);suptitle('convolved signal')

var_arr=[0 0.0001 0.001 0.01 0.1 0.5];
% this loop generates signal y, inverse fft of Y/H and z for varying
% variances as mentioned in 'var_arr' variable
for i =1:length(var_arr)
    ind=num2str(i);figure;
    [y(:,i),i_Y_by_H(:,i), z(:,i)]=audioprocess(g,Fs,h,var_arr(i),ind);
    suptitle(strcat('z For variance= ',num2str(var_arr(i))))
    sound(z(:,i),Fs);%pause(4); % for listening to y,i_Y_by_H and z after adding noise of some variance
    % for listening others keep changing the argument of the sound as y,,i_Y_by_H or z
end
%for signal reconstruction error
err=0;  close all
for j=1:length(var_arr)
    for k =1:length(s(:,1))
        err=err + (z(k,j) - s(k,1))^2;
    end
    L(j)=err/length(s(:,1));
end
plot(var_arr,L); xlabel('variance'),ylabel('mean square error'),title('signal reconstruction error');
        


