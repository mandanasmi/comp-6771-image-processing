function ContrastImg  = ContrastEstimatation( I )
%%----------Part 1 - Question 4 --------------
%%--------- Mandana Samiei--------------------
%%--------- Student Id: 40059116 -------------
%% Contrast Estimation 

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

end

