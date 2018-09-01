%%----------Part 1 - Question 3 --------------
%%--------- Mandana Samiei--------------------
%%--------- Student Id: 40059116 -------------

%Read an input image to workspace
I = imread('/Users/mandana/Documents/MATLAB/Final_Project/Part1/ICFHR2010/3_10.jpg');

%only one dimention
if ndims(I) == 3
  I= rgb2gray(I);
end
r = size(I,1);
c = size(I,2);
J = zeros (r,c);

%using my func to find the threshold
[T1,T2,Hb,Hbw,Hw] = myDoubleThresholdFinder(I);


for i = 1: r
    for j=1: c
        if I(i,j) < T1 
            J(i,j) = 0; 
        elseif I(i,j) > T1 && I(i,j) < T2
            J(i,j) = 127; 
        elseif I(i,j) > T2 
            J(i,j) = 255; 
        end 
    end
end

figure
subplot(1,2,1);
imshow(I);
title('Original Image');
subplot(1,2,2);
imshow(J);
title('Double-thresholded Image');
