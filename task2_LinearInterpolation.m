I = imread('/home/azi/Desktop/Project_1/mosaic/crayons_mosaic.bmp');
J = demosaic(I, 'rggb' );
imshow(J);