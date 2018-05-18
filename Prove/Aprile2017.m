% EX.1
%{
load('img_SAR', 'img');
x = nlfilter(img, [64,64], @handler);

ships = x>35;
imshow(ships);

function y = handler(x)
[M,N] = size(x);
center_block = x(M/2-3:M/2+4,N/2-3:N/2+4);
mean_center = mean2(center_block);

border = ones([M,N]);
border(9:M-8,9:N-8) = zeros(M-16,N-16);
xb = border.*x;
mean_border = sum(xb(:))/sum(border(:));

y = mean_center/mean_border;
end
%}

% EX.2

x = imread('volto.png');
x = double(rgb2gray(x));
[M,N] = size(x);


X = fftshift(fft2(x,M,N));
ampX = real(abs(X));
du = 1/M; dv = 1/N;
m = -1/2:du:1/2-du;
n = -1/2:dv:1/2-dv;
[l,k] = meshgrid(n,m);

deltal = 0.1116;
deltak = 0.059;
G = ones(size(X));
sigma = 0.02;
for i=-3:3,
    for j=-7:7,
        if(rem(i+j,2)==0 & (abs(i)+abs(j))>0),
            D = sqrt( (l-i*deltal).^2 + (k-j*deltak).^2 );
            G = G - exp( (-D.^2)/(2*(sigma.^2)) );
            %G = G + (D<0.02);
        end
    end
    end
H = G;

Y = X.*H;

y = real(ifft2(fftshift(Y)));

figure;
imshow(log(1+abs(X).*H), []);
figure;
imshow(y, []);


