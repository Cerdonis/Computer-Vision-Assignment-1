clc 
clear
task4
close all
% We use one channel as immobilized template, and move other two channels
% for the best fit. Therefore, there are three cases possible. 
% we can evaluate which one is the best.

% R channel is fixed
fprintf('When R is fixed ->\n');
[y, x, displaced_G, max] = BEST_DISP(chan_G, chan_R);
fprintf('G is displaced by [%d, %d] (NCC: %f)\n', y, x, max);

[y, x, displaced_B, max] = BEST_DISP(chan_B, chan_R);
fprintf('B is displaced by [%d, %d] (NCC: %f)\n\n', y, x, max);

RGB_aligned = cat(3, chan_R, displaced_G, displaced_B);
figure(1); imshow(RGB_aligned); title('R fixed');


% G channel is fixed
fprintf('When G is fixed ->\n');
[y, x, displaced_R, max] = BEST_DISP(chan_R, chan_G);
fprintf('R is displaced by [%d, %d] (NCC: %f)\n', y, x, max);

[y, x, displaced_B, max] = BEST_DISP(chan_B, chan_G);
fprintf('B is displaced by [%d, %d] (NCC: %f)\n\n', y, x, max);

RGB_aligned = cat(3, displaced_R, chan_G, displaced_B);
figure(2); imshow(RGB_aligned); title('G fixed');

% B channel is fixed
fprintf('When B is fixed ->\n');
[y, x, displaced_R, max] = BEST_DISP(chan_R, chan_B);
fprintf('R is displaced by [%d, %d] (NCC: %f)\n', y, x, max);

[y, x, displaced_G, max] = BEST_DISP(chan_G, chan_B);
fprintf('G is displaced by [%d, %d] (NCC: %f)\n', y, x, max);

RGB_aligned = cat(3, displaced_R, displaced_G, chan_B);
figure(3); imshow(RGB_aligned); title('B fixed');