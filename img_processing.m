%% EE210 Project
%% 2D convolution of the image with given matrix
img=imread('s.JPG');
h=(1/49)*ones(7,7);
third=img(:,:,3); second=img(:,:,2); first=img(:,:,1);
con_3=conv2(third,h); con_2=conv2(second,h); con_1=conv2(first,h);
con_1=uint8(con_1); con_2=uint8(con_2); con_3=uint8(con_3);
figure(1) ; imshow(con_1);
figure(2); imshow(con_2); 
figure(3); imshow(con_3);
filt_img=cat(3,con_1,con_2,con_3); %image created after first filter i.e., convolution with h
figure(4); imshow(filt_img);
%% Addition of noise 
%noise generation
[r,c]=size(con_1);
randn('state',1);
m=0; var=0.2;
n_img = imnoise(filt_img,'gaussian',m,var);  % added noise 
n_img_1=uint8(conv2(n_img(:,:,1),h));
n_img_2=uint8(conv2(n_img(:,:,2),h));
n_img_3=uint8(conv2(n_img(:,:,3),h));
y=cat(3,n_img_1,n_img_2,n_img_3);
figure(5); imshow(y); title('for variance = 0.2')
Y_w=fft2(y); % Discrete fourier transform of y
F1=log(abs(fftshift(Y_w(:,:,1)))); subplot(221), surf(F1), shading flat; title('Fourier plot');
F2=log(abs(fftshift(Y_w(:,:,2)))); subplot(222),surf(F2), shading flat; title('Fourier plot'); 
F3=log(abs(fftshift(Y_w(:,:,3))));subplot(223), surf(F3), shading flat ; title('Fourier plot')
suptitle('Plot for all the three channels for variance = 0.2');
H_w=fft(h);  % Discrete fourier transform of h % not invertiable ????
k1=ifft(conv2(Y_w(:,:,1),1));k2=ifft(conv2(Y_w(:,:,2),1));k3=ifft(conv2(Y_w(:,:,3),1));
k=cat(3,k1,k2,k3);
figure
imshow(k)







