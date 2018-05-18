x = double(imread('barbara.gif'));
[M,N] = size(x);
sigma = [5 10 15 20 25 30 35];

for i=1:length(sigma),
    xr = x + sigma(i)*randn(M,N);
    y = filtra(xr, sigma(i), 7);
    MSE(i) = mean2((xr-y).^2);
    PSNR(i) = 10*log10(255^2/MSE(i));
end

figure(1);
subplot(1,2,1); plot(sigma, MSE, 'k-o');
xlabel('sigma rumore'); ylabel('MSE');

subplot(1,2,2); plot(sigma, PSNR, 'k-o');
xlabel('sigma rumore'); ylabel('PSNR');