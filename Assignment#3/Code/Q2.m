%%----------Question 4-a --------------
%%--------- Mandana Samiei-------------
%%--------- Student Id: 40059116 ------

%%Edge Detecting Using Canny Filter 
I = imread('house.tif');
J = I(:,:,1);%% Extracting Channel 1
img_double = double(J); %% Converting uint8 image to double
BW = edge(img_double,'canny');
%% Plotting result
figure;
subplot(1,2,1);
imshow(J); 
title('Original Image');
subplot(1,2,2);
imshow(BW);
title('After Applying Canny Filter');