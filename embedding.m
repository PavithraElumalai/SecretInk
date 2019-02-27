stego = compressed;
for i = 1: val
    row = cell2mat(indices(i,1));
    col = cell2mat(indices(i,2));
    mat = S(row : row+ blocksize-1 , col : col + blocksize-1);
    stego(row : row + blocksize-1, col : col + blocksize -1) = mat;
end
stego = uint8(stego);
