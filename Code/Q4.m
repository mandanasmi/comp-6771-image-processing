%%----------Question 4-----------------
%%--------- Mandana Samiei-------------
%%--------- Student Id: 40059116 ------
%%----------Histogram Equalization-----

img = imread('jetplaneCor.tiff');
figure;
subplot(1,4,1);
imshow(img);
title('Original Image');
    
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
        PDF(greylevelValue+1)= Frequency(greylevelValue+1) / N; %PDF is the devision of number of pixels in each level 
        %by total number of pixels
    end
end
subplot(1,4,2);
plot(PDF);
title('PDF');
    

out = zeros(256,1);
L = 255; sum = 0;
cum = zeros(256,1);
for i = 1: size(PDF)
   sum = sum + Frequency(i);
   cum(i) = sum; % in order to save the number of pixels cumulatively
   CDF(i) = cum(i)/N;
   out(i) = round(CDF(i)*L);
end
subplot(1,4,3);
plot(CDF); title('CDF');
    
for i=1:r
    for j= 1:c
        outimg(i,j)= out(img(i,j)+1);
    end
end
subplot(1,4,4);
imshow(outimg);
title('Equalized Image');
    

