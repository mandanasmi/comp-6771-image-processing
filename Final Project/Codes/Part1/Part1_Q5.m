%%----------Part 1 - Question 5 --------------
%%--------- Mandana Samiei--------------------
%%--------- Student Id: 40059116 -------------

%Read an input image to workspace
I = imread('H02.bmp');
orgI = I;
if ndims(I) == 3
    I = rgb2gray(I);
end
I = bwmorph(I,'spur');%apply 'spur' morphological operator to remove the spurious pixels
I = bwmorph(I,'majority');% to set a pixel to 1 if five or more pixels in its 3-by-3 neighborhood are 1s
I = bwmorph(I,'bridge');% to bridge the unconnected pixels
I = bwmorph(I,'clean');%to remove the isolated pixels

%To correct the areas that are larger than 1 pixel and smaller than SW by
%using shrink and swell filters

I = padarray(I, 1,'symmetric','both');
SW = CalcStrokeWidth(orgI)-1;
rows = size(I,1);
cols = size(I,2);
Num1 = 0; Num2 = 0;
R1= SW; R2= R1;
J = zeros(rows,cols); %output image
region_length = floor(rows/R1);
region_width = floor(cols/R2);

for i=0:region_length-1 % the times that we need to cross the image row for each window move
    for j=0:region_width-1 %the times that we need to cross the image column for each window move 
        Num1 = 0; Num2 = 0;
        for k=1:R1 % inside the window
            for t=1:R2
                if I((i*R1)+k,(j*R2)+t) == 1
                    if k < R1 && t < R2 % inside R1*R2
                        Num2 = Num2+1;    
                    end
                    Num1 = Num1+1; % outside R1*R2   
                end     
            end
        end  
        if Num1 == Num2
            J(i*R1+1:(i*R1)+R1-1, j*R2+1:(j*R2)+R2-1) = 0;
        elseif Num1 == Num2+2*(R1+R2-2)
            J(i*R1+1:(i*R1)+R1-1, j*R2+1:(j*R2)+R2-1) = 1;
        end
    end 
end

figure
sublot(1,2,1);
imshow(orgI);title('Original Image');
subplot(1,2,2);
imshow(J);title('Noise Eliminated Image');

%% Graph Searching