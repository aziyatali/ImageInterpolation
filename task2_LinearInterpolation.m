clear
clc

I = imread('mosaic/crayons_mosaic.bmp');
X = [1 1 1; 1 1 1; 1 1 1]./(3*3);
J = filter2(I, X);
imshow(I);