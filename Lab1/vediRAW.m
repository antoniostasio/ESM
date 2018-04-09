function vediRAW(nomefile, nRighe, nColonne, tipo)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fid = fopen(nomefile, 'r');
if fid < 0
    fprinf('File non trovato: %s\n', nomefile);
else
    x = fread(fid, [nRighe nColonne], tipo);
    x = x';
    figure;
    imshow(x, [0 255]);
    title(nomefile);
end
end

