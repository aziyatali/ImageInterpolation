clear all;
clc;
close all;

defaultImg = imread('data/00153v.jpg');
% given channel order is BGR
%then we take the dimensions of an image
[m,n] = size(defaultImg);
% then divide column into 3 channels so we can cat them back to make original image
col = m / 3;

B = imcrop(defaultImg,[1, 1, n, col-1]);
G=imcrop(defaultImg,[1, 1*col+1, n, col-2]);
R=imcrop(defaultImg,[1, 2*col+1, n, col]);

%c = normxcorr2(G,R);
%[ypeak,xpeak] = find(c==max(c(:)));

%yoffSet = ypeak-size(G,1);
%xoffSet = xpeak-size(G,2);
% for 1st image x = -1, y = -9
R = imcrop(R, [-9,-1, 384,329]);
B = imcrop(B, [12,2, 404, 329]);
G = imcrop(G, [0,0, 393, 330]);
c = normxcorr2(G,B);
[ypeak,xpeak] = find(c==max(c(:)));

yoffSet = ypeak-size(G,1);
xoffSet = xpeak-size(G,2);
% for 2nd image x = 1, y = 11

rgbImg = cat(3, R, G, B);
imshow(rgbImg);