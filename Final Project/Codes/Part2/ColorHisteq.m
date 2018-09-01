function RGB  = ColorHisteq( I )
%COLOR HISTOGRAM EQUALIZATION

% Read the input image
HSV = rgb2hsv(I);
% Convert the RGB image to HSV image format
Heq = histeq(HSV(:,:,3));

% Perform histogram equalization on intensity component
HSV_mod = HSV;
HSV_mod(:,:,3) = Heq;

%Convert the resulting image back into the RGB color space
RGB = hsv2rgb(HSV_mod);

end

