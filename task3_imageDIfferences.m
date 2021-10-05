% reading original image and another image I got from task2

orgImg = imread('mosaic/crayons.jpg');
task2Image = imread('mosaic/task2Image.jpg');

% spliting original image and task2 image into three channels 
[oR, oG, oB] = imsplit(orgImg);
[R,G,B] = imsplit(task2Image);

% calculating the difference by subtracting each channels of task2 image from channels of original image
dR = oR.^2 - R.^2;
dG = oG.^2 - G.^2;
dB = oB.^2 - B.^2;

dRGB = cat(3, dR, dG, dB);  
subplot(2,2,1);
imshow(dRGB);
title('Original image - task2 image');
