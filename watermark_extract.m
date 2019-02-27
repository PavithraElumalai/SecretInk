image = rgb2;
[h_LL,h_LH,h_HL,h_HH] = dwt2(rgb2,'haar');
w = imread('texture14.jpg');
w = imcrop(w,[0,0,m,n]);
[w_LL,w_LH,w_HL,W_HH] = dwt2(w,'haar');

red21=h_HL(:,:,1);
green21=h_HL(:,:,2);
blue21=h_HL(:,:,3);
[U_imgr21,S_imgr21,V_imgr21]= svd(red21);
[U_imgg21,S_imgg21,V_imgg21]= svd(green21);
[U_imgb21,S_imgb21,V_imgb21]= svd(blue21);


new_LL = (w_LL - h_LL)/0.30;
size(new_LL);
 red2=new_LL(:,:,1);
 green2=new_LL(:,:,2);
 blue2=new_LL(:,:,3);
 [U_imgr2,S_imgr2,V_imgr2]= svd(red2);
 [U_imgg2,S_imgg2,V_imgg2]= svd(green2);
 [U_imgb2,S_imgb2,V_imgb2]= svd(blue2);
% st = cat(

%new_LL1 = (h_LL - w_LL)/0.30;
image2 = idwt2(new_LL,w_LH,w_HL,w_HH,'haar');
% %image3 = idwt2(new_LL1,h_LH,h_HL,h_HH,'haar');
figure,imshow(uint8(image2));title('extracted watermark');
imwrite(uint8(image2),'extracted_watermark.jpg');


 
