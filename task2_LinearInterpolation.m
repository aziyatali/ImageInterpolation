clear
clc

A = im2double(imread('mosaic/crayons_mosaic.bmp'));
% according to Bayernsensor alignment, we have 'rggb' sensor
% so for red channel [1,0][0,0], and green [0,1][1,0], and blue channel
% [0,0][0,1]
rA = [1,0;0,0];
gA = [0,1;1,0];
bA = [0,0;0,1];
% since we have 480x600 size, and RGB sensors size of 2x2
% then we need row/2 & col/2 size
redChannel = A.*repmat(rA, 240, 300);
greenChannel = A.*repmat(gA, 240, 300);
blueChannel = A.*repmat(bA, 240, 300);

% for interpolation I am taking 3x3 matrix divided by 9
X = [1 1 1; 1 1 1; 1 1 1]./(3*3);
% using filter2 function, we multiply with X
R = filter2(X, redChannel);
G = filter2(X, greenChannel);
B = filter2(X, blueChannel);
% we align R, G, B into one image with cat function
rgbImage = cat(3, R, G, B);
imshow(rgbImage);
