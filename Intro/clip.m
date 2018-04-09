function y = clip(x, Limit)
%CLIP Satura i dati di un vettore ad un valore limite
%   y = clip(x, Limit)
%   x: input vector
%   Limit: valore di saturazione
%   y: vettore saturato

mask = (x>Limit) - (x<-Limit);
y = (Limit*mask) + (x.*~mask);
end

