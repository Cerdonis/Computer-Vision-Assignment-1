clc 
clear

task1
close all

% Designed masks for interpolation
mask_R = [1/4, 1/2, 1/4; 
       1/2, 1, 1/2; 
       1/4, 1/2, 1/4];
   
mask_G = [0, 1/4, 0; 
       1/4, 1, 1/4; 
       0, 1/4, 0];
   
mask_B = mask_R;


interp_R = imfilter(Rchan,mask_R);
interp_G = imfilter(Gchan,mask_G);
interp_B = imfilter(Bchan,mask_B);

subplot(2, 3, 1); imshow(Rchan); title('Demosaiced R')
subplot(2, 3, 2); imshow(Gchan); title('Demosaiced G')
subplot(2, 3, 3); imshow(Bchan); title('Demosaiced B')
subplot(2, 3, 4); imshow(interp_R); title('Interpolated R')
subplot(2, 3, 5); imshow(interp_G); title('Interpolated G')
subplot(2, 3, 6); imshow(interp_B); title('Interpolated B')

imwrite(interp_R,'interp_R.bmp')
imwrite(interp_G,'interp_G.bmp')
imwrite(interp_B,'interp_B.bmp')

reconstruct = cat(3, interp_R, interp_G, interp_B);

figure(2); imshow(reconstruct);



