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

% for interpolation I am taking 3x3 matrix divided by 4
% when we align RGGB sensor according to image size it becomes like repmat(rA, 240, 300);
% 1 0 1 0 10 till the row size of an image
% 0 0 0 0 
% 1 0 1 0
% till the size of column image
% if we take initial 3X3 then it becomes filter for R
% it applies same for R and B and for G I will take opposite values of R+B
rR = [1 0 1; 0 0 0; 1 0 1]./(4);
rG = [0,1,0; 1,0,1; 0,1,0]./(4);
rB = [0,0,0; 0,1,0; 0,0,0]./(4);

% using filter2 function, we multiply with X
R = redChannel + filter2(rR, redChannel);
G = greenChannel + filter2(rG, greenChannel);
B = blueChannel + filter2(rB, blueChannel);
% we align R, G, B into one image with cat function
rgbImage = cat(3, R, G, B);

% saving the task2 image for task3 case
imwrite(rgbImage, 'task2Image.jpg');
%output the image
imshow(rgbImage);