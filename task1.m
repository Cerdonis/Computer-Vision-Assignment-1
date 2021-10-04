clc 
clear
close all

im1 = imread('crayons_mosaic.bmp');
im1 = im2double(im1);
subplot(2, 2, 1); imshow(im1); title('crayons-mosaic.bmp')

% The Bayer pattern was tiled for each channel
Rbayer = [1 0; 0 0];
Gbayer = [0 1; 1 0];
Bbayer = [0 0; 0 1];
Rfilt = repmat(Rbayer,size(im1,1)/2, size(im1,2)/2);
Gfilt = repmat(Gbayer,size(im1,1)/2, size(im1,2)/2);
Bfilt = repmat(Bbayer,size(im1,1)/2, size(im1,2)/2);

% Each colors were extracted by pointwise-multiplication 
% on the mosaic-image.
Rchan = im1.*Rfilt;
Gchan = im1.*Gfilt;
Bchan = im1.*Bfilt;

subplot(2, 2, 2); imshow(Rchan), title('Demosaiced R')
subplot(2, 2, 3); imshow(Gchan), title('Demosaiced G')
subplot(2, 2, 4); imshow(Bchan), title('Demosaiced B')

imwrite(Rchan,'chan_R.bmp')
imwrite(Gchan,'chan_G.bmp')
imwrite(Bchan,'chan_B.bmp')


