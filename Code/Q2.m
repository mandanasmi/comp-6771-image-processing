%%----------Question 2-------------
%%--------- Mandana Samiei---------
%%--------- Student Id:40059116 ---
img = imread('jetplaneCor.tiff');
H = zeros(256,1);

for i = 1: length(img)
    for j = 1: length(img)
        H(img(i,j)+1,1) =  H(img(i,j)+1,1)+1;% we need to add a 1 to each index because 
        % the i of for loop start from 1 while greyscales start from 0
    end
end
figure;
plot(H);