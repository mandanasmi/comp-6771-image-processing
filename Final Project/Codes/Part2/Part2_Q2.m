%%----------Part 2 - Question 2 --------------
%%--------- Mandana Samiei--------------------
%%--------- Student Id: 40059116 -------------

%Read the color image into the workspace.
I = imread('Nature1.jpg');
Ref = imread('RefImg.jpg');
if ndims(Ref) == 3
    J = rgb2gray(Ref);
end
B = imhistmatch(I,Ref);

figure

subplot(2,3,1);
imshow(I);
title('RGB Image with Color Cast');

subplot(2,3,2);
imshow(Ref);
title('Desired Image');

subplot(2,3,3);
imshow(B);
title('Histogram Matched RGB Image');

subplot(2,3,4);
imhist(I(:,:));
title('Histogram of RGB Image');

subplot(2,3,5);
imhist(J,1024);
title('Desired histogram');

subplot(2,3,6);
imhist(B(:,:));
title('Histogram of Matched RGB Image');



