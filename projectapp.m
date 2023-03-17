%==========================================================================
%                        Part 0: interface
%==========================================================================
function projectapp
fig = uifigure('Name','Image Proccesing Project');
fig.Position = [540 450 370 270];
 fig.WindowStyle = 'modal';
 im = uiimage(fig) ; 
  im.ImageSource ='D:\My_Matlab\fac_logo.png';
  im.Position = [20 120 100 100];
btn = uibutton(fig,'push',...
               'Text', 'Browse for Image',...
                'Position',[120 180 120 40],...
               'ButtonPushedFcn', @(btn,event) plotButtonPushed(btn,im));
 end

function plotButtonPushed(~,~)
 [PathName,FileName,x] = uigetfile('*.jpg;*.png;*.bmp','Pick an Image');
  x = imread([FileName,PathName]);
 

% This program summarize the project 
% Ahmed Zahran 7 Jan 2021
%==========================================================================
%                        Part 1: Read Image
%==========================================================================
% Clear memory and screen:
%clc, close all,
% Read image:
img = x ;
% open a figure in full screen size:
% s = get(0, 'ScreenSize');
% figure('Position', [0 0 s(3) s(4)]);
% or by using normalized units:
% figure('Units','normalized','Position',[0 0 1 1])
% plot original image:
% imshow(img), 
% write a title to image:
% title('Original Image'),
%==========================================================================
%                   Part 2: Image transformations
%==========================================================================
% %convert RGB to 3 color channels:
%----------------------------------
[red,green,blue] = imsplit(img);
%Create an all black channel
allBlack = zeros(size(img, 1), size(img, 2), class(img));
%Create color versions of the individual color channels:
justRed = cat(3, red, allBlack, allBlack);
justGreen = cat(3, allBlack, green, allBlack);
justBlue = cat(3, allBlack, allBlack, blue);
%Display all the channels and original image in one figure:
figure('Units','normalized','Position',[0 0 1 1])
subplot(2,2,1), imshow(img)
title('Original Image'),
subplot(2,2,2), imshow(justRed)
title('Red Channel'),
subplot(2,2,3), imshow(justGreen)
title('Green Channel'),
subplot(2,2,4), imshow(justBlue)
title('Blue Channel'),
pause,
clf,
%--------------------------------------------------------------------------
%convert RGB to HSV:
%-------------------
HSVimage = rgb2hsv(img);
%Spliting to HSV channels:
[H,S,V] = imsplit(HSVimage);
%Display all the channels and original image in one figure:
%figure('Units','normalized','Position',[0 0 1 1])
subplot(2,2,1), imshow(HSVimage)
title('HSV Image'),
subplot(2,2,2), imshow(H)
title('Hue Channel'),
subplot(2,2,3), imshow(S)
title('Saturation Channel'),
subplot(2,2,4), imshow(V)
title('Value Channel'),
pause,
clf,
%--------------------------------------------------------------------------
% %convert RGB to Grey image:
%----------------------------
grey_image = rgb2gray(img);
%open a figure:
%figure('Units','normalized','Position',[0 0 1 1])
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(grey_image)
title('Grey Scale Image'),
pause,
clf,
%--------------------------------------------------------------------------
%convert RGB to B&W image:
%---------------------------
grey_image = rgb2gray(img);
bw = imbinarize(grey_image); 
%open a figure:
%figure('Units','normalized','Position',[0 0 1 1])
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(bw);
title('B&W Image'),
pause,
clf,
%==========================================================================
%                     Part 3: Image enhancement
%==========================================================================
% Brightness Improvement:
%------------------------
bright=img.*1.1;   
%figure('Units','normalized','Position',[0 0 1 1])
subplot(1,2,1), imshow(img)
title ('Original Image'),
subplot(1,2,2), imshow(bright);
title('Brightness Improved Image'),
pause,
clf,
%--------------------------------------------------------------------------
% Contrast Enhancement:
%----------------------
contrast_image = imadjust(img,[.2 .3 0; .6 .7 1],[]);
%figure('Units','normalized','Position',[0 0 1 1])
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(contrast_image);
title('Contrast Improved Image'),
pause,
clf,
%--------------------------------------------------------------------------
% Edge Sharpining:
%-----------------
sharp_image = imsharpen(img);
%figure('Units','normalized','Position',[0 0 1 1])
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(sharp_image);
title('Edge Improved Image'),
pause,
clf,
%--------------------------------------------------------------------------
% Smoothing:
%-----------
smooth_image = imgaussfilt(img,2.5);
%figure('Units','normalized','Position',[0 0 1 1])
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(smooth_image);
title('Smoothed Image'),
pause,
clf,
%==========================================================================
%                   Part 4: Adding noise to image
%==========================================================================
% Adding Gaussian noise:
%-----------------------
gaussian_noisy_image = imnoise(img,'gaussian');
%figure('Units','normalized','Position',[0 0 1 1])
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(gaussian_noisy_image);
title('Noisy Image (Gaussian Noise)'),
pause,
clf,
%--------------------------------------------------------------------------
% Adding Poisson noise:
%-----------------------
poission_noisy_image = imnoise(img,'poisson') ;
%figure('Units','normalized','Position',[0 0 1 1])
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(poission_noisy_image);
title('Noisy Image (Poission Noise)'),
pause,
clf,
%--------------------------------------------------------------------------
% Adding Salt & Pepper Gaussian noise:
%-------------------------------------
salt_pepper_noisy_image = imnoise(img,'salt & pepper');
%figure('Units','normalized','Position',[0 0 1 1])
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(salt_pepper_noisy_image);
title('Noisy Image (Salt & Pepper  Noise)'),
pause,
clf,
%--------------------------------------------------------------------------
% Adding Speckle noise:
%---------------------
speckle_noisy_image = imnoise(img,'speckle');
%figure('Units','normalized','Position',[0 0 1 1])
subplot(1,2,1), imshow(img)
title('Original Image'),
subplot(1,2,2), imshow(speckle_noisy_image);
title('Noisy Image (Speckle Noise)'),
pause,
clf,
%==========================================================================
%                  Part 5: Removing noise from image
%==========================================================================
% Removing Gaussian noise:
%-------------------------
gaussian_noisy_image = imnoise(img,'gaussian');
gausian_filterd_image = imgaussfilt(gaussian_noisy_image,2) ;
%figure('Units','normalized','Position',[0 0 1 1])
subplot(1,2,1), imshow(gaussian_noisy_image)
title('Noisy Image (Gaussian Noise)'),
subplot(1,2,2), imshow(gausian_filterd_image);
title('Image after removing Gaussian Noise'),
pause,
clf,
%--------------------------------------------------------------------------
% Removing Poisson noise:
%------------------------
poisson_noisy_image =imnoise(img,'poisson') ;
poisson_filtered_image= myLee(poisson_noisy_image);
%figure('Units','normalized','Position',[0 0 1 1])
subplot(1,2,1), imshow(poisson_noisy_image)
title('Noisy Image (Poisson Noise)'),
subplot(1,2,2), imshow(poisson_filtered_image);
title('Image after removing Poisson Noise'),
pause,
clf,
%--------------------------------------------------------------------------
% Removing Salt & Pepper Gaussian noise:
%---------------------------------------
salt_pepper_noisy_image = imnoise(img,'salt & pepper');
salt_pepper_filtered_image = medfilt3(salt_pepper_noisy_image);
%figure('Units','normalized','Position',[0 0 1 1])
subplot(1,2,1), imshow(salt_pepper_noisy_image)
title('Noisy Image (Salt & Pepper  Noise)'),
subplot(1,2,2), imshow(salt_pepper_filtered_image);
title('Image after removing Salt & Pepper  Noise'),
pause,
clf,
%--------------------------------------------------------------------------
% Removing Speckle noise:
%-----------------------
speckle_noisy_image = imnoise(img ,'speckle');
speckle_filtered_image = myLee(speckle_noisy_image); %need improvement
speckle_filtered_image = medfilt3(speckle_filtered_image);
speckle_filtered_image = medfilt3(speckle_filtered_image);
%figure('Units','normalized','Position',[0 0 1 1])
subplot(1,2,1), imshow(speckle_noisy_image)
title('Noisy Image (Speckle Noise)'),
subplot(1,2,2), imshow(speckle_filtered_image);
title('Image after removing Speckle Noise'),
pause,
close all,
%==========================================================================

end
