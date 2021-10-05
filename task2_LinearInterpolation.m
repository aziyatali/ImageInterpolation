clear
clc

A = im2double(imread('mosaic/crayons_mosaic.bmp'));
rA = [1,0,0,0];
gA = [0,1,1,0];
bA = [0,0,0,1];

redChannel = A.*repmat(double(rA), size(A)/2,1);
greenChannel = A.*repmat(double(gA), size(A)/2,1);
blueChannel = A.*repmat(double(bA), size(A)/2,1);

X = [1 1 1; 1 1 1; 1 1 1]./(3*3);

imshow(redChannel);