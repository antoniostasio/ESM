function y = FSHS(x)
%FSHS Summary of this function goes here
%   Detailed explanation goes here

xmin = min(x(:));
xmax = max(x(:));

y = (x-xmin)*255/(xmax-xmin);

end

