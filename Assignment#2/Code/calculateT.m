%%----------Question 2--------------
%%--------- Mandana Samiei----------
%%--------- Student Id: 40059116 ---

function [ T ] = calculateT( img_in )
I = rgb2gray(img_in);

r = size(I,1);
c = size(I,2);
N = r*c;
img = I(:); 

MAX = 0;
T = 0;
L = 256;
p = zeros(256,1); % Probability
cum = zeros(256,1); % Cumulative Probability (Similar to P_t in the Shannon Formula)
hb = zeros(256,1);% Black pixels entropy 
hw = zeros(256,1);% White pixels entropy 
frequency = zeros(256,1);

% Calculating Probability
for i1= 1:size(img)
    frequency(img(i1)+1)= frequency(img(i1)+1) + 1;
    p(img(i1)+1) = frequency(img(i1)+1)/N;
end

%Calculating CDF
for j=1:size(p)
    cum(j) = cum(j) + p(j);
end

%Temp Values
t1_value = 0;
t2_value = 0;
% Total Entropy
h=0;  

for t=1:L
    for i2 = 1:t % Calculating the first series of pixels that are assumed black
        t1_value = -(p(i2)*log(p(i2)/cum(t)))/cum(t);
        if(~isnan(t1_value) && ~isinf(t1_value))
            hb(t)= hb(t) + t1_value;
        end
    end
    for i3 = t+1:L % Calculating the second series of pixels that are assumed white
        t2_value=-(p(i3)*log(p(i3)/1-cum(t)))/(1-cum(t));
        if(~isnan(t2_value) && ~isinf(t2_value))
            hw(t) = hw(t) + t2_value;
        end
    end
    
    h = hb(t) + hw(t);
    
    if h > MAX
        MAX = h;
        T=t;
    end  
end
end

