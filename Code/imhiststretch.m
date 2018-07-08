function  imgout  = imhiststretch( imggray,stin_min,stin_max,stout_min,stout_max )
%%----------Question 6-----------------
%%--------- Mandana Samiei-------------
%%--------- Student Id: 40059116 ------
r = size(imggray,1);
c = size(imggray,2);
M = 256;
in1 = 0:stin_min;
in2 = stin_min:stin_max;
in3 = stin_max:M;

% Slope of 3 lines
m1= (stout_min/stin_min);
m2= (stout_max-stout_min)/(stin_max-stin_min);
m3= (M-stout_max)/(M-stin_max);

% Y-intercept of lines
b1 = 0;
b2= stout_min - m2*stin_min;
b3= stout_max - m3*stin_max;

% Lines
l1=m1*(in1)+ b1;
l2=m2*(in2)+ b2;
l3=m3*(in3)+ b3;
figure;
plot(in1,l1,in2,l2,in3,l3);
imgout = zeros(r,c);

%% Calculating Output image
for i=1:r
    for j=1:c
        if imggray(i,j) <= stin_min
              imgout(i,j) = m1*(imggray(i,j)) + b1;
         elseif imggray(i,j) <= stin_max && imggray(i,j) > stin_min
              imgout(i,j) = m2*(imggray(i,j)) + b2;
         elseif imggray(i,j)> stin_max && imggray(i,j) <= 256
              imgout(i,j) = m3*(imggray(i,j)) + b3;
         end
    end
end
imgout = uint8(imgout);
end

