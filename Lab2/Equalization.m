function y = Equalization(x)
%EQUALIZATION Summary of this function goes here
%   Detailed explanation goes here

[M, N] = size(x);

n = hist(x(:), 0:255);

tx = zeros(1,256);

numpixels = M*N;
for k=1:256
    tx(k) = sum(n(1:k))/numpixels;
end


y = zeros(M,N);

for i=1:M
    for j=1:N
        index = uint8(x(i,j))+1;
        y(i,j) = tx(index)*255;
    end
end

end

