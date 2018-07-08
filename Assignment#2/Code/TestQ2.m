%%----------Question 2--------------
%%--------- Mandana Samiei----------
%%--------- Student Id: 40059116 ---
%% Test Function

I1 = imread('H03.bmp');
I2 = imread('H04.bmp');
threshhold1 = calculateT(I1);
threshhold2 = calculateT(I2);
normalized_th1 = double(threshhold1/256);
normalized_th2 = double(threshhold2/256);

BW1 = im2bw(I1,normalized_th1);
BW2 = im2bw(I2,normalized_th2);

figure;
subplot(2,2,1);
imshow(I1); title('Original Image');
subplot(2,2,2);
imshow(BW1); title(['Binary Image After Thresholding with T=' num2str(threshhold1)]);
subplot(2,2,3);
imshow(I2); title('Original Image');
subplot(2,2,4);
imshow(BW2); title(['Binary Image After Thresholding with T=' num2str(threshhold2)]);
