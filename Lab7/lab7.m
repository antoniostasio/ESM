% CUBO rgb
%{
vertici = [0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 1 1 1];
facce = [1 5 6 2; 1 3 7 5; 1 2 4 3; 2 4 8 6; 3 7 8 4; 5 6 8 7];
colori = vertici;

patch('Vertices', vertici, 'Faces', facce, ...
    'FaceVertexCdata', colori, 'FaceColor', 'interp');
view([10 10 10]);
axis square; axis off;
%}
x = imread('foto_originale.tif');
%x = double(x);

% NEGATIVO
%{
y = imcomplement(x);
x(:,:,1) = 255 - x(:,:,1);
x(:,:,2) = 255 - x(:,:,2);
x(:,:,3) = 255 - x(:,:,3);
%}

% CONTRASTO
%{
%figure; imshow(x);
%y = rgb2hsi(x);
%I = y(:,:,3);

y = x.^(4/7);
%y(:,:,3) = I/max(I(:));
y = y/max(y(:));
%y = hsi2rgb(y);
%}

% ENHANCHEMENT A COLORI
%{
B = 3;
z = rgb2hsi(x);
I = z(:,:,3);
h = [0 -1 0; -1 5 -1; 0 -1 0];

I = imfilter(I,h,'replicate');

y = cat(3, z(:,:,1), z(:,:,2), I);
y = hsi2rgb(y);
%}



%% ESERCIZIO 1.1
%{
x = imread('cubo.jpg');
x = double(x)/255;

y = rgb2cmy(x);

imshow(y, []);
%}

%% ESERCIZIO 1.2
%{
x = imread('cubo.jpg');
x = double(x);
xHSI = rgb2hsi(x);

imshow(xHSI(:,:,1), []);
%}

figure;
imshow(y, []);