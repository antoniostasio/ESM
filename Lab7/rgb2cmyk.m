function y = rgb2cmyk(x)
%RGB2CMY Summary of this function goes here
%   Detailed explanation goes here
y = rgb2cmy(x);
k = min(y, [], 3);
y = y - k;
y(:,:,4) = k;
end

