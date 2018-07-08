%%----------Question 5-----------------
%%--------- Mandana Samiei-------------
%%--------- Student Id: 40059116 ------

%%--------- Compare the two histogram-equalized images----
%%--------- Using Histeq----------------------------------
img = imread('jetplaneCor.tiff');
Hq = histeq(img);

figure;
subplot(1,4,1);
imshow(img);title('Original Image');

subplot(1,4,2);
imshow(Hq);title({'Equalized Image','using Histeq'});

%% Without using Histeq
subplot(1,4,3);
r = size(img,1);
c = size(img,2);
outimg = uint8(zeros(r,c));
N = r*c;
Frequency = zeros(256,1);
PDF = zeros(256,1);
CDF = zeros(256,1);

for i=1:r
    for j= 1:c
        greylevelValue = img(i,j);
        Frequency(greylevelValue+1) = Frequency(greylevelValue+1) + 1;
        PDF(greylevelValue+1)= Frequency(greylevelValue+1) / N;
    end
end
out = zeros(256,1);
L = 255; sum = 0;
cum = zeros(256,1);
for i = 1: size(PDF)
   sum = sum + Frequency(i);
   cum(i) = sum; 
   CDF(i) = cum(i)/N;
   out(i) = round(CDF(i)*L);
end
for i=1:r
    for j= 1:c
        outimg(i,j)= out(img(i,j)+1);
    end
end
imshow(outimg);
title({'Equalized Image','without using Histeq'});

subplot(1,4,4);
imshow(abs(Hq-outimg));
title({'Difference of equalized','images with Histeq','and without Histeq'});
