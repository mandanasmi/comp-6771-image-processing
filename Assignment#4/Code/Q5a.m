%%----------Question 5-a --------------
%%--------- Mandana Samiei-------------
%%--------- Student Id: 40059116 ------
%% Applying Wavelet transform using Haar Wavelet

I = imread('lena.bmp');

if ndims(I) == 3
    J = rgb2gray(I);
end
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters('haar'); 
[c1A,c1H,c1V,c1D] = dwt2(J, 'haar');
%%cA: approximation coefficients matrix
%%cH: Horizontal edges details coefficients matrices
%%cV: Vertical edges details coefficients matrices
%%cD: Diagonal edges details coefficients matrices
[c2A,c2H,c2V,c2D] = dwt2(c1A,Lo_D,Hi_D); % Level 2 
[c3A,c3H,c3V,c3D] = dwt2(c2A,Lo_D,Hi_D); % Level 3

TH = 50;
figure;
subplot(2,2,1);
imagesc(c3A);
colormap pink(255);
title('Haar: Approximation Coef. of Level 3');

subplot(2,2,2)
imagesc(c3H);
title('Haar: Horizontal detail Coef. of Level 3');

subplot(2,2,3)
imagesc(c3V);
title('Haar: Vertical detail Coef. of Level 3');

subplot(2,2,4)
imagesc(c3D);
title('Haar: Diagonal detail Coef. of Level 3');
