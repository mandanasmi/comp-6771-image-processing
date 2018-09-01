function [ Num, I_mean, I_Std ] = Relabel_Region( I,C,i,j,T1)

Num=0;%Number of high contrast pixels (intensity > T1)
I_mean=0;%The mean of the detected high contrast pixels in the original image
I_std=0;%The standard deviation of the detected high contrast pixels in the original image

W = CalcStrokeWidth(I);
M = size(I,1);
N = size(I,2);

for i=W+1:M-W
    for j=W+1:N-W
        Cw = C(i-W:i+W,j-W:j+W); 
        Iw = I(i-W:i+W,j-W:j+W); 
        
        for x = 1:2*W+1
            for y = 1:2*W+1
               if Cw(x,y) > T1 || Cw(x,y) == T1
                   Cw(x,y) = 1;
                   Num = Num +1;
               else 
                   Cw(x,y) = 0;
               end    
            end 
        end

        if(Num > 0)
            I_mean = (Iw.*Cw)/Num;
            I_std = sqrt(double(Cw.*((Iw-I_mean).^2)/Num));
        end
    end
end

end

