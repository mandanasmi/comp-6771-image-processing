%%----------Question 4-a --------------
%%--------- Mandana Samiei-------------
%%--------- Student Id: 40059116 ------

%%Edge Detecting Using Canny Filter 
I = imread('house.tif');
J = I(:,:,1);%% Extracting Channel 1
TH=120; %% Threshholding
gx=[-1,-2,-1 ; 0,0,0 ; 1,2,1];
gy =[-1,0,1 ; -2,0,2 ; -1,0,1];
img_double = double(J); %% Converting uint8 image to double
Gx = conv2(img_double, gx,'same');
Gy = conv2(img_double, gy,'same');
G = Gx+Gy;
%Using Edge Function 
BW = edge(img_double, 'sobel');
%% Plotting result
figure;
subplot(1,3,1);
imshow(J); 
title('Original Image');
subplot(1,3,2);
imshow(G>TH);
title('Detecting Edges in X and Y direction using SOBEL using conv2');
subplot(1,3,3);
imshow(BW); 
title('Using Sobel by edge function');
