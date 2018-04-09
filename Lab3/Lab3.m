% BIT-PLANE SLICING
%{
x = imread('frattale.jpg');
x = double(x);

B1 = bitset(x,1,0);

figure(1);
subplot(1,2,1); imshow(x, [0 255]);
subplot(1,2,2);
imshow(B1, [0 255]);
%}

%{
fid = fopen('lena.y' , 'r');
lena = fread(fid, [512 512], 'uint8');
lena = lena';

fid = fopen('marchio.y', 'r');
marchio = fread(fid, [350 350], 'uint8');
mext = padarray(marchio, [81 81], 1);

y = bitset(lena, 1, mext);


figure(1);
subplot(1,2,1); imshow(lena, [0 255]);
subplot(1,2,2); imshow(y, [0 255]);
figure(2); imshow(mext, []);
%}

% ARITHMETIC OPERATION
%{
x = imread('frattale.jpg');
y = x;
for i =  1:4
    y = bitset(y, i, 0);
end

figure(1);
subplot(1,2,1); imshow(x, [0 255]);
subplot(1,2,2); imshow(y, [0 255]);
figure(2); imshow(x-y, []);
%}

% DECIMAZIONE PER 2
%{
x = imread('balena.bmp');
x = double(x);
[M, N] = size(x);



y = zeros(M/2, N/2);

for i=1:(M/2)
    for j=1:(N/2)
        y(i,j) = (x(2*i-1,2*j-1) + x(2*i, 2*j) )/2;
    end
end

%y = x(1:2:M, 1:2:N);

figure(1);
subplot(1,2,1);
imshow(y, [0 255]);
subplot(1,2,2);
imshow(x, [0 255]);
%}

% INTERPOLAZIONE
%{
x = imread('boat.bmp');
x = double(x);
[M,N] = size(x);

% con meshgrid
% esempio: riduzione scala 3/2
[n,m] = meshgrid(1:N,1:M);
scale = 3/2;
[np,mp] = meshgrid(1:scale:N, 1:scale:M);
y = interp2(n,m,x,np,mp, 'linear');

% con matrice di trasformazione
% esempio: zoom 2x
A = [2 0 0; 0 2 0; 0 0 1];
tform = affine2d(A);
y2 = imwarp(x, tform, 'bilinear');

figure(1);
imshow(y2, [0 255]);
%}
