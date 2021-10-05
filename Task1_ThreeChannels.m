clc
clear all
close all

A = imread('mosaic/crayons.jpg');
R = A;
G = A;
B = A;

R(:,:,2) = 0;
R(:,:,3)= 0;
subplot(2,2,1);
imshow(R);
title('Red channel only');

G(:,:, 1) = 0;
G(:, :, 3) = 0;
subplot(2,2,2);
imshow(G);
title('Green channel only');

B(:, :, 1) = 0;
B(:,:,2) = 0;
subplot(2,2,3);
imshow(B);
title('Blue channel only');
