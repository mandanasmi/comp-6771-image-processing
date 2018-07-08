%%----------Question 7 & 8-----------------
%%--------- Mandana Samiei-----------------
%%--------- Student Id: 40059116 ----------
img = imread('jetplaneCor.tiff');
figure;
subplot(1,2,1);
imshow(img);
title('Original image');
subplot(1,2,2);
imhist(img);
title('Histogram of original image');

%% Function Call
outputimg = imhiststretch(img,50,190,20,220);
figure;
subplot(1,2,1);
imshow(uint8(outputimg));title('Contrast stretching image');
subplot(1,2,2);
imhist(outputimg);title('Histogram of stretched image');

%adjustedimg = imadjust(img,[0.3 0.7],[0.0 1.0]);
%subplot(1,6,5);
%imshow(adjustedimg);title('Using imadjust');
%subplot(1,6,6);
%imhist(adjustedimg);title('using imadjust(histogram)');
