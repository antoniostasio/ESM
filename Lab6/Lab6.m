% Filtro BUTTERWORTH
%{
x = double(imread('testo.tif') );
[M,N] = size(x);

du = 1/M; dv = 1/N;
m = -1/2:du:1/2-du;
n = -1/2:dv:1/2-dv;
[l,k] = meshgrid(n,m);

D = sqrt(k.^2+l.^2);
D0 = 0.12;

H1 = (D <= D0);
sigma = 20;
n = 2;
H = 1./(1+(D./D0).^(2*n) );%exp( (-D.^2)/(2*(sigma.^2)) );

X = fftshift(fft2(x, M, N));

Y = H.*X;
ampY = log(1+abs(Y));
y = real(ifft2(fftshift(Y)) );
%}

fid = fopen('lenarumorosa.y', 'r');
x = fread(fid, [512 512], 'int16')';
[M,N] = size(x);

du = 1/M; dv = 1/N;
m = -1/2:du:1/2-du;
n = -1/2:dv:1/2-dv;
[l,k] = meshgrid(n,m);

X = fftshift(fft2(x));

% definizione filtro, ricerca semplice
%{
nu_0 = 0.2; B = 0.03;
order = 2;
D = sqrt(k.^2+(l-nu_0).^2);
%1./(1+(D./B).^(2*order) );
%exp( (-D.^2)./(2*sigma^2) );
%(D <= B);
H1 = exp( (-D.^2)./(2*sigma^2) );
D = sqrt(k.^2+(l+nu_0).^2);
H2 = exp( (-D.^2)./(2*sigma^2) );
H = 1-H1-H2;
%}

% definizione filtro, striscia verticale
B = 0.001;
H1 = (k >= -B) & (k <= B);
H2 = (l >= -0.02) & (l <= 0.02);
H = 1-H1-H2;

% filtraggio
Y = X.*H;

y = ifft2(fftshift(Y));
figure(1); mesh(k,l, log(1+abs(X)));
figure(2);
imshow(x, []);