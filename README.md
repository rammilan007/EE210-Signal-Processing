# EE210-Signal-Processing
Audio and Image processing assignment for EE210(M) course

# Problem statement :
Here is the complete description of the lab problem - You can do it for an audio signal (1-D) or an image signal (2-D). And if you like you may do both (+1 credit for that, since the theory is the same). The choice of the signal is such that either you can hear or see what is happening to the signal when you process it. You may use MATLAB/C/Python/.... but you must write your own code.

Take an appropriate signal s(x) (a good quality picture of an outdoor scene or pronounce 'signals and system' before an audio recorder). Play it back and listen/view it. Pass it through an FIR filter kernel h(x) or h(x,y) to get g(x) or g(x,y) where h(x) = {1/7, 1/7...} (seven such terms) or h(x,y) is a 7x7 matrix with each element being 1/49. How is the output different from the original signal? Now add a random noise of variance \sigma^2 to the filtered output g(x), and call it y(x). Vary \sigma and listen to the signal. What happens? Take DFT of h(x) and y(x). Obtain Y(w)/H(w) and then the inverse DFT. Compare this to the original signal for different values of \sigma (including \sigma=0). Explain why there is a difference. Now, instead,  multiply Y(w)/H(w) with a Gaussian Gs(w) with mean w=0 and variance v^2. Take the inverse DFT of Gs(w)Y(w)/H(w), call it z(x), and listen to the signal z(x) for various values of v. 

Signal reconstruction error L is defined as \integrate (z(x) - s(x))^2 dx. 

If you have a perfect reconstruction of the original signal s(x) then L=0. Plot L as a function of noise \sigma and bandwidth v. 
