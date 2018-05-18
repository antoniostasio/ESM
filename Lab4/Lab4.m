% FILTRAGGIO SPAZIALE
%{
x = double(imread('lena.jpg'));
k = 15;
h = ones(k)/(k^2);
g = fspecial('gaussian', 15, 5);
y = imfilter(x, g, 'replicate', 'full');
figure(1); imshow(y, []);
%}

% Thresholding filtering
%{
x = double(imread('spazio.jpg'));
k = 15;
h = ones(k)/k^2;
y = imfilter(x, h);
maxim = max(y(:));

y1 = y>(maxim*0.25);

figure(1);
subplot(1,2,1); imshow(x, []);
subplot(1,2,2); imshow(x.*y1, []);
%}

% Denoising
%{
x = double(imread('barbara.gif'));
[M,N] = size(x);

n = 16*randn([M,N]);

noisy = x + n;
h = fspecial('average', 3);
y = imfilter(noisy, h, 'symmetric');

mse = mean2((x-y).^2);
%}

% SALE E PEPE
%{
x = double(imread('circuito_rumoroso.jpg'));
y = colfilt(x, [5 5], 'sliding', @median);
figure; imshow(y, [0,255]);
%}

% ENHANCHEMENT
%{
x = double(imread('luna.jpg'));
h = [0 -1 0; -1 5 -1; 0 -1 0];
y = imfilter(x, h);
figure; imshow(y, [0 255]);
%}

% ESTRAZIONE KEYPOINT
clear all; close all; clc;
x = double(imread('tetto.png'));
% Creazione dei filtri per il calcolo delle derivate
V = [0 -1 0; 0 1 0; 0 0 0];
H = [0 0 0; -1 1 0; 0 0 0];
D1 = [-1 0 0; 0 1 0; 0 0 0];
D2 = [0 0 -1; 0 1 0; 0 0 0];
% Calcolo delle derivate prime
v = imfilter(x,V,'replicate');
h = imfilter(x,H,'replicate');
d1 = imfilter(x,D1,'replicate');
d2 = imfilter(x,D2,'replicate');
% Quadrati delle derivate
vv = v.^2;
hh = h.^2;
dd1 = d1.^2;
dd2 = d2.^2;

% Calcolo su finestra scorrevole dei valori al quadrato
Qv = colfilt(vv,[5 5], 'sliding', @sum);
Qh = colfilt(hh,[5 5], 'sliding', @sum);
Qd1 = colfilt(dd1,[5 5], 'sliding', @sum);
Qd2 = colfilt(dd2,[5 5], 'sliding', @sum);
% Calcolo del minimo
Qmin = min(min(Qv,Qh), min(Qd1,Qd2));
MQmin = colfilt(Qmin, [3 3], 'sliding', @max);
% Calcolo dei punti salienti
SP = (Qmin > 500) & (Qmin == MQmin);
% Visualizzazione
figure;
subplot(1,2,1); imshow(x,[]); title('Immagine test');
subplot(1,2,2); imshow(SP,[]); title('Mappa dei Keypoint');