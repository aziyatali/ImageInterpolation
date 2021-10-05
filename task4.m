clear all;
defaultImg = imread('data/00153v.jpg');
% given channel order is BGR
%then we take the dimensions of an image
[m,n] = size(defaultImg);
% then divide column into 3 channels so we can cat them back to make original image
col = m / 3;

B = imcrop(defaultImg,[1, 1, n, col-1]);
G=imcrop(defaultImg,[1, 1*col+1, n, col-2]);
R=imcrop(defaultImg,[1, 2*col+1, n, col]);

% concat image by putting them back 
%rgbImg = cat(3, R, G, B);
rgbImg(:,:,1) = R;
rgbImg(:,:,2) = G;
rgbImg(:,:,3) = B;
imshow(rgbImg);