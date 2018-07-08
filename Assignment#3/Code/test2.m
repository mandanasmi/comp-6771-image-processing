%%----------Question 3-test2 --------------
%%--------- Mandana Samiei-------------
%%--------- Student Id: 40059116 ------

I = imread('house.tif');
J = I(:,:,1);%% Extracting Channel 1
TH=0.8;
figure;
subplot(1,4,1);
imshow(J);title('1-Original Image');

%%First Sharpenng
gx=[-1,-2,-1 ; 0,0,0 ; 1,2,1];
gy =[-1,0,1 ; -2,0,2 ; -1,0,1];
Gx = conv2(im2double(J), gx,'same');
Gy = conv2(im2double(J), gy,'same');
G = Gx+Gy;
subplot(1,4,2);
imshow(G);title('2-Sharpened Image using Sobel');

%%Then Histogram equalizing and threshholding
equalized_img = histeq(G); 
subplot(1,4,3);
imshow(equalized_img); title('3- Equalization after sharpening');
subplot(1,4,4);
imshow(equalized_img>TH); title('4- Threshholding after Equalization');

