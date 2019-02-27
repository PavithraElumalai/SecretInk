recon_image = zeros(m,n);
stego = double(stego);
for row = 1: blocksize: m
    for col = 1: blocksize: n
        idct_matrix = stego(row : row + blocksize-1, col : col + blocksize-1);
        idct_matrix = idct_matrix.*(dct_quant(1:blocksize,1:blocksize)* quant_multiple);
        idct_matrix = dct_trans' * idct_matrix * dct_trans;
        recon_image(row: row + blocksize-1,col : col + blocksize-1) = idct_matrix;
    end
end

orig = orig + 128;
recon_image = recon_image + 128;
recon_image = uint8(recon_image);
figure,imshow(uint8(recon_image));
title('stego image');
imsave;

