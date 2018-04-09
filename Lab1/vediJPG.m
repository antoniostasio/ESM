function vediJPG(nomefile)
%VEDIJPG mostra a video un'immagine in formato JPG
%   Detailed explanation goes here
fid = fopen(nomefile, 'r');
if fid < 0
    fprintf('File non trovato: %s\n', nomefile);
else
    x = imread(nomefile);
    figure;
    imshow(x);
    title(nomefile);
end
end

