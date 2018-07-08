%%----------Question 4-a --------------
%%--------- Mandana Samiei-------------
%%--------- Student Id: 40059116 ------
%% Applying Otsu method to a noisy image

I = im2double(imread('tools_noisy.png'));
[level, EM] = graythresh(I);
BW = imbinarize(I, level);
figure;
subplot(1,2,1);
imshow(I); title('Original Image');
subplot(1,2,2);
imshow(BW); title('Global Threshholding using Otsu Algorithm');