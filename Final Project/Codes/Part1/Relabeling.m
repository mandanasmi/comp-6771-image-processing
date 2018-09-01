function I = Relabeling( I,C,T1,T2 )
%Relabel the near-text pixels in the image I 

M = size(I,1);
N = size(I,2);

w = CalcStrokeWidth(I);
for i=1:M
    for j=1:N
        if C(i,j)>T2 || C(i,j)==T1
            [Num, I_mean, I_std] = Relabel_Region(I,C,i,j,T1);
            if I(i,j) < min(I_mean+I_std,T2) && Num>0  
                I(i,j) = 1;
            else 
                I(i,j) = 0;
            end
            i = i+w;
            j = j+w;
        end
    end
end


end

