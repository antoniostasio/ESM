clear; clc;

x1 = rgb2gray(imread('I1.png'));
x1 = double(x1);

x2 = rgb2gray(imread('I2.png'));
x2 = double(x2);

h = [-1  2 -1;
      2 -4  2;
     -1  2 -1];
B = [3 3];

x1filtered = imfilter(x1, h);
x2filtered = imfilter(x2, h); 

y1 = colfilt(x1filtered, B, 'sliding', @elabora3);
y2 = colfilt(x2filtered, B, 'sliding', @elabora3);

%{
x = [1 2 3 4;% 5 6;
     2 4 6 8;% 10 12;
     3 6 9 12];% 15 18;
     %4 8 12 16 20 24
     %5 10 15 20 25 30];
 
 y = colfilt(x, [3 3], 'sliding', @elabora3);
 %}

std_y1 = std(hist(y1(:), 0:255));
std_y2 = std(hist(y2(:), 0:255));
