function y=elabora(x)
% ELABORA Conserva i 4 elementi più grandi di una matrice
% y=elabora(x);
% x: matrice di ingresso
% y: risultato

[M, N] = size(x);
%if (M ~= 3 && N ~= 7)
%    error ('dimensioni matrice errate');
%end
if (min(min(x)) < 0)
    error ('presenti numeri negativi');
end

maxnums = max(x);
maxnums = sort(maxnums);

mask = x>=maxnums(4);

y = x.*mask;
end