function [T1,T2,Hb,Hbw,Hw,I] = myDoubleThresholdFinder(I)
if ndims(I) == 3
    I= rgb2gray(I);
end

MAX=0; 
T1=0; 
T2=0; 
L=256;

[x,y] = size(I); s=x*y;

% finding probablity of each bin
p = imhist(I)./s;

for t1=1:L
    for t2=1:L
        
        P_t1 = sum(p(1:t1));
        P_t1t2 = sum(p(t1:t2));
        P_t2 = sum(p(t2:L));
        Hb =0; Hbw=0; Hw=0; H=0;

        %Compute H_b
        for i=1:t1
            temp = p(i)*log(p(i)/P_t1)/P_t1;
            if isnan(temp) %sometimes that p or P_t is 0 and result is NaN
                temp=0;
            end
            Hb = Hb + temp;
        end
        %Compute H_bw
        for i=t1+1:t2
            temp = p(i)*log(p(i)/(P_t1t2))/(P_t1t2);
            if isnan(temp)  %sometimes that p or P_t is 0 and result is NaN
                temp=0;
            end
            Hbw = Hbw + temp;
        end
        %Compute H_w
        for i=t2+1:L
            temp = p(i)*log(p(i)/(P_t2))/(P_t2);
            if isnan(temp)  %sometimes that p or P_t is 0 and result is NaN
                temp=0;
            end
            Hw = Hw+temp;
        end
        H = -Hb -Hbw -Hw;
        if H>MAX
            MAX = H; T1=t1; T2=t2;
        end
    end
end

for i = 1: size(I,1)
    for j=1: size(I,2)
        if I(i,j) < T1 
            I(i,j) = 0; 
        elseif I(i,j) > T1 && I(i,j) < T2
            I(i,j) = 127; 
        elseif I(i,j) > T2 
            I(i,j) = 255; 
        end 
    end
end
disp('Threshold values are ');
disp([T1, T2]);
end