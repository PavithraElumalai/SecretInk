filename = '1.jpg'
orig = imread(filename);

orig = rgb2gray(orig);
figure,imshow(orig);
title('cover image');
orig = double(orig);
blocksize = 8;

%calculating dct transform matrix

i = 0;
for j = 0: blocksize - 1
    dct_trans(i+1,j+1) = sqrt(1 / blocksize)*cos((2*j+1)*i*pi/(2*blocksize));
end

for i = 1: blocksize - 1
    for j = 0: blocksize - 1
        dct_trans(i+1,j+1) = sqrt(2 / blocksize)*cos((2*j+1)*i*pi/(2*blocksize));
    end
end

[m,n] = size(orig);

orig = orig - 128;

dct_quant = [16 11 10 16 24 40 51 61;
             12 12 14 19 26 58 60 55;
             14 13 16 24 40 57 69 56;
             14 17 22 29 51 87 80 62;
             18 22 37 56 68 109 103 77;
             24 35 55 64 81 104 113 92;
             49 64 78 87 103 121 120 101;
             72 92 95 98 112 100 103 99];

quant_multiple = 0.05;

fprintf(1,'\nfinding dct and quantizing\n');

compressed = zeros(m,n);

for row = 1: blocksize: m
    for col = 1: blocksize : n
        dct_matrix = orig(row : row+ blocksize-1 , col : col + blocksize-1);
        dct_matrix = dct_trans * dct_matrix * dct_trans';
        dct_matrix = floor(dct_matrix./(dct_quant(1:blocksize,1:blocksize) * quant_multiple)+0.5);
        %size(dct_matrix)
        compressed(row : row + blocksize-1, col : col + blocksize-1) = dct_matrix;
    end 
end
