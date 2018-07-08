%%----------Question 4-b --------------
%%--------- Mandana Samiei-------------
%%--------- Student Id: 40059116 ------
%% Applying Otsu method to a noisy image after smoothing the image 

I = im2double(imread('tools_noisy.png'));

H = ones(5,5) / 25;
Filtered_Image = imfilter(I, H);

level = graythresh(Filtered_Image);
BW = imbinarize(Filtered_Image,level);

figure;
subplot(1,3,1);
imshow(I); title('Original Image');
subplot(1,3,2);
imshow(Filtered_Image); title({'Filtered Image', 'by Average Filter 5*5'});
subplot(1,3,3);
imshow(BW); title({'Global Threshholding', 'using Otsu Algorithm', 'after Smoothing'});