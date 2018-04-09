x = imread('filament.tif');
x = FSHS(double(x));
[M, N] = size(x);

nk = hist(x(:), 0:255);

MED = medie(x, 3, 'symmetric');
DEV = deviazioni(x, 3, 'symmetric');
VAR = (DEV.^2);

med = mean2(x);
dev = std2(x);

k0 = 0.4;
k1 = 0.2;
k2 = 4;
E = 4;

mask = (MED<=k0*med).*(VAR<=k2*dev).*(VAR>=k1*dev);

y = (E*mask).*x + (~mask).*x;

dv = colfilt(x, [3 3], 'sliding', @std);

figure(1);
subplot(1,2,1);
imshow(mask, [0 1]);
subplot(1,2,2);
imshow(y, [0 255]);