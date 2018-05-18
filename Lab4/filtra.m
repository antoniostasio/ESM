function y = filtra(x,sigma, r)
%FILTRA Summary of this function goes here
%   Detailed explanation goes here
[M,N] = size(x);

var_noise = sigma^2;


%{
y = zeros(M-2*r:N-2*r);

for i=1+r:M-r,
    for j=1+r:N-r,
        xloc = x(i-r:i+r,j-r:j+r);
        mean_local = mean2(xloc);
        var_local = std2(xloc)^2;
        y(i-r,j-r) = x(i,j) - (var_noise/var_local)*(x(i,j)-mean_local);
    end
end
%}

meanX = mean2(x);

MEANS = colfilt(x, [r r], 'sliding', @mean);
VARS = colfilt(x, [r r], 'sliding', @std).^2;

y = x - var_noise*(x-MEANS)./VARS;

%y = padarray(y, [r r], 'symmetric');
end

