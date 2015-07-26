% im1 = imread('extract1.png');
% im1 = rgb2gray(im1);
% figure, imshow(im1)
% attrs = imattributes
% im2 = imresize(im1, 0.11);
% figure, imshow(im2)
% attrs1 = imattributes

%To detect Eyes
 
EyeDetect = vision.CascadeObjectDetector('EyePairBig');
 
%Read the input Image
 
I = imread('red_eye_6.png');
 
BB=step(EyeDetect,I);
[row, col] = ind2sub(size(I), 6);
figure,imshow(I);
rectangle('Position',BB(1,:),'LineWidth',4,'LineStyle','-','EdgeColor','b');
title('Eyes Detection');
Eyes=imcrop(I,BB);
 
figure,imshow(Eyes);
 
% rgb = imread('Eyes.png');
% figure
% imshow(rgb)
% gray_image = rgb2gray(rgb);
% imshow(gray_image);
% imshow(rgb);
% [centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
%     'Sensitivity',0.9)
% imshow(rgb);
% 
% h = viscircles(centers,radii);