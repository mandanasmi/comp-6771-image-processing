%%----------Part 1 - Question 4 --------------
%%--------- Mandana Samiei--------------------
%%--------- Student Id: 40059116 -------------
%% Contrast Estimation 

%I = imread('/Users/mandana/Documents/MATLAB/Final_Project/Part1/DIBCO2009/H04.bmp');
I = imread('/Users/mandana/Documents/MATLAB/Final_Project/Part1/ICFHR2010/3_10.jpg');
if ndims(I) == 3
   I = rgb2gray(I); 
end
r = size(I,1);
c = size(I,2); 
minGrayLevel = double(min(min(I))); %Finding minimum intenisty in the image
maxGrayLevel = double(max(max(I))); %Finding maximum intenisty in the image
% Gray level mapping to a range from 0 to 255
Slope= 255/(maxGrayLevel - minGrayLevel);
currVal = 255 - Slope * maxGrayLevel;
ContrastStretchedImg = Slope*I + currVal;

% Extract Background Using Closing morphological Operator
se = strel('disk',10);
bgImg = imclose(ContrastStretchedImg,se);

% Subtract original image from background image
ContrastImg = bgImg - I;

figure; 
subplot(1,4,1);
imshow(I);title('Original Image');
subplot(1,4,2);
imshow(ContrastStretchedImg);title('Adjusted Image');
subplot(1,4,3);
imshow(bgImg);title('Background Image');
subplot(1,4,4);
imshow(ContrastImg);title('Contrast Image');

