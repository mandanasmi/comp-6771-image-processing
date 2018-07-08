%%----------Question 3-test1 --------------
%%--------- Mandana Samiei-------------
%%--------- Student Id: 40059116 ------

I = imread('house.tif');
J = I(:,:,1);%% Extracting Channel 1
figure;
subplot(1,3,1);
imshow(J);title('1- Original Image');
%% First Histogram Equalizing 
equalized_img = histeq(J); 
subplot(1,3,2);
imshow(equalized_img);title('2- Equalized Image');
%% Then Sharpening
BW=edge(equalized_img, 'sobel');%sharpening
subplot(1,3,3);
imshow(BW); title('3- Sharpened Image using Sobel');

