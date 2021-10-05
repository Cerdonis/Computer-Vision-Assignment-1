clc 
clear
task4_bonus
close all
% We use one channel as immobilized template, and move other two channels
% for the best fit. Therefore, there are three cases possible. 
% we can evaluate which one is the best.

% R channel is fixed
fprintf('When R is fixed ->\n');
[y, x, displaced_G, mx] = BEST_DISP(chan_G, chan_R);
fprintf('G is displaced by [%d, %d] (NCC: %f)\n', y, x, mx);

[yy, xx, displaced_B, mx] = BEST_DISP(chan_B, chan_R);
fprintf('B is displaced by [%d, %d] (NCC: %f)\n\n', yy, xx, mx);

up_crop = 0;
down_crop = 0;
if max(y, yy) > 0
    up_crop = max(y, yy);    
end
if min(y, yy) < 0
    down_crop = min(y, yy);    
end
RGB_aligned = cat(3, chan_R, displaced_G, displaced_B);
RGB_aligned_crop = RGB_aligned(1+up_crop : end+down_crop , : , :);
figure(1); imshow(RGB_aligned_crop); title('R fixed');


% G channel is fixed
fprintf('When G is fixed ->\n');
[y, x, displaced_R, mx] = BEST_DISP(chan_R, chan_G);
fprintf('R is displaced by [%d, %d] (NCC: %f)\n', y, x, mx);

[yy, xx, displaced_B, mx] = BEST_DISP(chan_B, chan_G);
fprintf('B is displaced by [%d, %d] (NCC: %f)\n\n', yy, xx, mx);

up_crop = 0;
down_crop = 0;
if max(y, yy) > 0
    up_crop = max(y, yy);    
end
if min(y, yy) < 0
    down_crop = min(y, yy);    
end
RGB_aligned = cat(3, displaced_R, chan_G, displaced_B);
RGB_aligned_crop = RGB_aligned(1+up_crop : end+down_crop , : , :);
figure(2); imshow(RGB_aligned_crop); title('G fixed');

% B channel is fixed
fprintf('When B is fixed ->\n');
[y, x, displaced_R, mx] = BEST_DISP(chan_R, chan_B);
fprintf('R is displaced by [%d, %d] (NCC: %f)\n', y, x, mx);

[yy, x, displaced_G, mx] = BEST_DISP(chan_G, chan_B);
fprintf('G is displaced by [%d, %d] (NCC: %f)\n', yy, x, mx);

up_crop = 0;
down_crop = 0;
if max(y, yy) > 0
    up_crop = max(y, yy);    
end
if min(y, yy) < 0
    down_crop = min(y, yy);    
end
RGB_aligned = cat(3, displaced_R, displaced_G, chan_B);
RGB_aligned_crop = RGB_aligned(1+up_crop : end+down_crop , : , :);
figure(3); imshow(RGB_aligned_crop); title('B fixed');