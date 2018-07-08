%%----------Question 3--------------
%%--------- Mandana Samiei----------
%%--------- Student Id: 40059116 ---

%% Histogram Equalization Using imhist function 
img = imread('jetplaneCor.tiff');
H1 = imhist(img);
figure;
subplot(1,3,1);
plot(H1);title('Histogram using the imhist');

%%  Histogram Equalization using my program
H2 = zeros(256,1);
for i = 1: length(img)
    for j = 1: length(img)
        H2(img(i,j)+1,1) =  H2(img(i,j)+1,1)+1;
    end
end

subplot(1,3,2);
plot(H2); title('Histogram without using the imhist');


subplot(1,3,3);
plot(abs(H1-H2));title('the Difference of two histograms');

