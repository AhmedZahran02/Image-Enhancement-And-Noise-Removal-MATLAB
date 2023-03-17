% This program summarize the work done by Ahmed Zahran - 7 Jan 2021
%==========================================================================
%                        Part 1: Read Image
%==========================================================================
% Clear memory and screen:
clc, close all,
% Read image:
[PathName,FileName] = uigetfile('*.jpg;*.png;*.bmp','Pick an Image');
img = imread([FileName,PathName]);
% open a figure in full screen size:
% figure('Units','normalized','Position',[0 0 1 1])
% plot original image:
% imshow(img), 
% title('Original Image'),
%==========================================================================
%                   Part 2: Image transformations
%==========================================================================
% Convert RGB to 3 color channels:
%----------------------------------
[red,green,blue] = imsplit(img);
% Create an all black channel
allBlack = zeros(size(img, 1), size(img, 2), class(img));
% Create color versions of the individual color channels:
justRed = cat(3, red, allBlack, allBlack);
justGreen = cat(3, allBlack, green, allBlack);
justBlue = cat(3, allBlack, allBlack, blue);
% Display all the channels and original image in one figure:
figure('Units','normalized','Position',[0 0 1 1],'Name','Image Proccessing Project')
subplot(2,2,1), imshow(img)
title('Original Image'),
subplot(2,2,2), imshow(justRed)
title('Red Channel'),
subplot(2,2,3), imshow(justGreen)
title('Green Channel'),
subplot(2,2,4), imshow(justBlue)
title('Blue Channel'),
xlabel('-----> Press any key to Continue','FontSize',24,'FontWeight','bold','Color','r')
pause,
clf,
%--------------------------------------------------------------------------
% Convert RGB to HSV:
%--------------------
HSVimage = rgb2hsv(img);
[H,S,V] = imsplit(HSVimage);
subplot(2,2,1), imshow(HSVimage)
title('HSV Image'),
subplot(2,2,2), imshow(H)
title('Hue Channel'),
subplot(2,2,3), imshow(S)
title('Saturation Channel'),
subplot(2,2,4), imshow(V)
title('Value Channel'),
xlabel('-----> Press any key to Continue','FontSize',24,'FontWeight','bold','Color','r')
pause,
clf,
%--------------------------------------------------------------------------
% Convert RGB to Grey image:
%---------------------------
grey_image = rgb2gray(img);
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(grey_image)
title('Grey Scale Image'),
xlabel('-----> Press any key to Continue','FontSize',24,'FontWeight','bold','Color','r')
pause,
clf,
%--------------------------------------------------------------------------
% Convert RGB to B&W image:
%--------------------------
grey_image = rgb2gray(img);
bw = imbinarize(grey_image); 
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(bw);
title('B&W Image'),
xlabel('-----> Press any key to Continue','FontSize',24,'FontWeight','bold','Color','r')
pause,
clf,
%==========================================================================
%                     Part 3: Image enhancement
%==========================================================================
% Brightness Improvement:
%------------------------
bright=img.*1.1;   
subplot(1,2,1), imshow(img)
title ('Original Image'),
subplot(1,2,2), imshow(bright);
title('Brightness Improved Image'),
xlabel('-----> Press any key to Continue','FontSize',24,'FontWeight','bold','Color','r')
pause,
clf,
%--------------------------------------------------------------------------
% Contrast Enhancement:
%----------------------
contrast_image = imadjust(img,[.2 .3 0; .6 .7 1],[]);
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(contrast_image);
title('Contrast Improved Image'),
xlabel('-----> Press any key to Continue','FontSize',24,'FontWeight','bold','Color','r')
pause,
clf,
%--------------------------------------------------------------------------
% Edge Sharpining:
%-----------------
sharp_image = imsharpen(img);
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(sharp_image);
title('Edge Improved Image'),
xlabel('-----> Press any key to Continue','FontSize',24,'FontWeight','bold','Color','r')
pause,
clf,
%--------------------------------------------------------------------------
% Smoothing:
%-----------
smooth_image = imgaussfilt(img,2.5);
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(smooth_image);
title('Smoothed Image'),
xlabel('-----> Press any key to Continue','FontSize',24,'FontWeight','bold','Color','r')
pause,
clf,
%==========================================================================
%                   Part 4: Adding noise to image
%==========================================================================
% Adding Gaussian noise:
%-----------------------
gaussian_noisy_image = imnoise(img,'gaussian');
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(gaussian_noisy_image);
title('Noisy Image (Gaussian Noise)'),
xlabel('-----> Press any key to Continue','FontSize',24,'FontWeight','bold','Color','r')
pause,
clf,
%--------------------------------------------------------------------------
% Adding Poisson noise:
%----------------------
poission_noisy_image = imnoise(img,'poisson') ;
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(poission_noisy_image);
title('Noisy Image (Poission Noise)'),
xlabel('-----> Press any key to Continue','FontSize',24,'FontWeight','bold','Color','r')
pause,
clf,
%--------------------------------------------------------------------------
% Adding Salt & Pepper Gaussian noise:
%-------------------------------------
salt_pepper_noisy_image = imnoise(img,'salt & pepper');
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(salt_pepper_noisy_image);
title('Noisy Image (Salt & Pepper  Noise)'),
xlabel('-----> Press any key to Continue','FontSize',24,'FontWeight','bold','Color','r')
pause,
clf,
%--------------------------------------------------------------------------
% Adding Speckle noise:
%----------------------
speckle_noisy_image = imnoise(img,'speckle');
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(speckle_noisy_image);
title('Noisy Image (Speckle Noise)'),
xlabel('-----> Press any key to Continue','FontSize',24,'FontWeight','bold','Color','r')
pause,
clf,
%==========================================================================
%                  Part 5: Removing noise from image
%==========================================================================
% Removing Gaussian noise:
%-------------------------
gaussian_noisy_image = imnoise(img,'gaussian');
gausian_filterd_image = imgaussfilt(gaussian_noisy_image,2) ;
subplot(1,2,1), imshow(gaussian_noisy_image)
title('Noisy Image (Gaussian Noise)'),
subplot(1,2,2), imshow(gausian_filterd_image);
title('Image after removing Gaussian Noise using Gauissian Filter'),
xlabel('-----> Press any key to Continue','FontSize',24,'FontWeight','bold','Color','r')
pause,
clf,
% --------------------------------------------------------------------------
% Removing Poisson noise:
% ------------------------
poisson_noisy_image =imnoise(img,'poisson') ;
noisy_image = double(poisson_noisy_image);
poisson_filtered_image = noisy_image;
window_size = 3;
means = imfilter(noisy_image, fspecial('average',window_size),'replicate');
sigmas = sqrt((noisy_image-means).^2/window_size^2);
sigmas = imfilter(sigmas, fspecial('average', window_size), 'replicate');
ENLs = (means./sigmas).^2;
sx2s = ((ENLs.*(sigmas).^2) - means.^2)./(ENLs + 1);
fbar = means + (sx2s.*(noisy_image-means)./(sx2s + (means.^2 ./ENLs)));
poisson_filtered_image(means~=0) = fbar(means~=0);
poisson_filtered_image=uint8(poisson_filtered_image);
subplot(1,2,1), imshow(poisson_noisy_image)
title('Noisy Image (Poisson Noise)'),
subplot(1,2,2), imshow(poisson_filtered_image);
title('Image after removing Poisson Noise using Lee Filter'),
xlabel('-----> Press any key to Continue','FontSize',24,'FontWeight','bold','Color','r')
pause,
clf,
%--------------------------------------------------------------------------
% Removing Salt & Pepper Gaussian noise:
%---------------------------------------
salt_pepper_noisy_image = imnoise(img,'salt & pepper');
salt_pepper_filtered_image = medfilt3(salt_pepper_noisy_image);
subplot(1,2,1), imshow(salt_pepper_noisy_image)
title('Noisy Image (Salt & Pepper  Noise)'),
subplot(1,2,2), imshow(salt_pepper_filtered_image);
title('Image after removing Salt & Pepper  Noise using Median Filter'),
xlabel('-----> Press any key to Continue','FontSize',24,'FontWeight','bold','Color','r')
pause,
clf,
%--------------------------------------------------------------------------
% Removing Speckle noise:
%-----------------------
speckle_noisy_image = imnoise(img ,'speckle');
I = double(speckle_noisy_image);
speckle_filtered_image = I;
window_size = 3;
means = imfilter(I, fspecial('average', window_size), 'replicate');
sigmas = sqrt((I-means).^2/window_size^2);
sigmas = imfilter(sigmas, fspecial('average', window_size), 'replicate');
ENLs = (means./sigmas).^2;
sx2s = ((ENLs.*(sigmas).^2) - means.^2)./(ENLs + 1);
fbar = means + (sx2s.*(I-means)./(sx2s + (means.^2 ./ENLs)));
speckle_filtered_image(means~=0) = fbar(means~=0);
speckle_filtered_image=uint8(speckle_filtered_image); 
speckle_filtered_image = medfilt3(speckle_filtered_image);
speckle_filtered_image = medfilt3(speckle_filtered_image);
subplot(1,2,1), imshow(speckle_noisy_image)
title('Noisy Image (Speckle Noise)'),
subplot(1,2,2), imshow(speckle_filtered_image);
title('Image after removing Speckle Noise using Lee Filter'),
xlabel('-----> Press any key to Exit','FontSize',24,'FontWeight','bold','Color','b')
pause,
close all,
%==========================================================================

