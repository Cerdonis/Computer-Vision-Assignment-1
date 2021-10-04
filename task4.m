clc 
clear
close all

prompt = 'Enter image name (W/O extension): ';
filename = input(prompt,'s');
filename = strcat(filename, '.jpg');
fprintf('\n');

img = imread(filename);

[r,c] = size(img);
h = floor(r/3);
chan_B = img(1:h,:);
chan_G = img(h+1:2*h,:);
chan_R = img(2*h+1:floor(3*h),:);


