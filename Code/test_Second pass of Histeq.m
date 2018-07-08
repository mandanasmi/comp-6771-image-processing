
I = imread('jetplaneCor.tiff');

H1=histeq(I);
figure;
subplot(1,3,1);
imshow(H1);title({'After First Pass of','Histogram Equalization'});

H2=histeq(H1);
subplot(1,3,2);
imshow(H2);title('After Second Pass');

%Compare
subplot(1,3,3);
imshow(abs(H1-H2));title('Difference');
