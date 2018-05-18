function g = elabora3(col)
%ELABORA3 Summary of this function goes here
%   Detailed explanation goes here

[m,n] = size(col);

x = col(ceil(m/2),:);

u = col-x;
mask = u >= 0;

powers = [1; 128; 64; 2; 0; 32; 4; 8; 16];

y = mask.*powers;

g = sum(y);

end

