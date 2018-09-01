%%----------Part 2 - Question 1 --------------
%%--------- Mandana Samiei--------------------
%%--------- Student Id: 40059116 -------------

%Read the color image into the workspace. test with 3 images
I1 = imread('Forest1.jpg');
I2 = imread('Nature1.jpg');
I3 = imread('Room.jpg');

%then convert the RGB image into the HSV color space. 
RGB1 = ColorHisteq(I1);
RGB2 = ColorHisteq(I2);
RGB3 = ColorHisteq(I3);

figure
subplot(3,2,1),imshow(I1);title('Before Histogram Equalization');
subplot(3,2,2),imshow(RGB1);title('After Histogram Equalization');
subplot(3,2,3),imshow(I2);title('Before Histogram Equalization');
subplot(3,2,4),imshow(RGB2);title('After Histogram Equalization');
subplot(3,2,5),imshow(I3);title('Before Histogram Equalization');
subplot(3,2,6),imshow(RGB3);title('After Histogram Equalization');



