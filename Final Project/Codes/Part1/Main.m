%%----------Part 1----------------------------
%%--------- Mandana Samiei--------------------
%%--------- Student Id: 40059116 -------------
%% Main Program
I = imread('/Users/mandana/Documents/MATLAB/Final_Project/Part1/ICFHR2010/3_10.jpg');

C = ContrastEstimatation(I);
% apply double threshold binarization to obtain binary image
[T1,T2,Hb,Hbw,Hw] = myDoubleThresholdFinder(I);
%Relabel the near-text pixels in the image 
I2 = Relabeling(I,C,T1,T2);
% apply post prcessing steps to remove noise in image
% strategy1: removing salt and pepper noise
I3 = SaltPepperNoiseEliminitaion(I2);

figure;
subplot(1,4,1);
imshow(I);title('Original Image');
subplot(1,4,2);
imshow(C);title('Contrast Image');
subplot(1,4,3);
imshow(I2);title('Double tresholded Image');
subplot(1,4,4);
imshow(I3);title('Noise Eliminated Image');

