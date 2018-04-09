function MED = medie(x, radius, type)
%MEDIE Summary of this function goes here
%   Detailed explanation goes here

[M, N] = size(x);
k = radius;

xext = padarray(x, [k k], type);
MED = zeros(M,N);

for i=1:M
    for j=1:N
        MED(i,j) = mean2(xext(i:i+k, j:j+k));
    end
end

end

