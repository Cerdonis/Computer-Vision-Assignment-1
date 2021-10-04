clc 
clear
task2
close all

% reading the original color image
orig = imread('crayons.jpg');
orig = im2double(orig);

imshow(orig)

% reading the original into 3 channels
orig_R = orig(:, :, 1);
orig_G = orig(:, :, 2);
orig_B = orig(:, :, 3);

% squaring the difference between original & interpolation
sq_diff_R = (orig_R - interp_R).*(orig_R - interp_R);
sq_diff_G = (orig_G - interp_G).*(orig_G - interp_G);
sq_diff_B = (orig_B - interp_B).*(orig_B - interp_B);

sq_diff_map = sq_diff_R + sq_diff_G + sq_diff_B;

% the display range is adjustible
% figure(2); imshow(sq_diff_map, [0.2, 0.5])
figure(2); imagesc(sq_diff_map); colormap(jet); colorbar;

% calculating mean and maximum value in the difference map
max = max(max(sq_diff_map));
fprintf('Maximum square difference: %f\n', max)
mean = mean(sq_diff_map, 'all');
fprintf('Average square difference: %f\n', mean)
