secretimage = imread('logo.tif');
imsave;
figure,imshow(secretimage);
title('secret image');
secretimage = double(secretimage);
secretimage = secretimage - 128;
ms = 104;
ns = 104;
secretimage = imcrop(secretimage,[0,0,104,104]);
S = zeros(ms,ns);
for row = 1: blocksize: 104
    for col = 1: blocksize : 104
        dct_matrix = secretimage(row : row+ blocksize-1 , col : col + blocksize-1);
        dct_matrix = dct_trans * dct_matrix * dct_trans';
        dct_matrix = floor(dct_matrix./(dct_quant(1:blocksize,1:blocksize) * quant_multiple)+0.5);
        %size(dct_matrix)
        S(row : row + blocksize-1, col : col + blocksize-1) = dct_matrix;
    end 
end
