function DEV = deviazioni(x, k, type)
%DEVIAZIONI Summary of this function goes here
%   Detailed explanation goes here
[M, N] = size(x);

xext = padarray(x, [k k], type);

DEV = zeros(M,N);

for i=1:M
    for j=1:N
        dx = xext(i:i+k, j:j+k);
        DEV(i,j) = std(dx(:),1);
    end
end


end

