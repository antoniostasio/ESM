function y = rot_shear(x,theta,c)
%ROT_SHEAR Summary of this function goes here
%   Detailed explanation goes here

[M,N] = size(x);
% trasla l'origine nel centro dell'immagine
tr1 = [1 0 -N/2;
      0 1 -M/2;
      0 0 1];
% ruota il piano
rot = [cos(theta) -sin(theta) 0;
       sin(theta) cos(theta) 0;
       0 0 1];
% trasla l'immagine nella posizione originale
tr2 = [1 0 N/2;
      0 1 M/2;
      0 0 1];
warp = [1 0 0;
        0 c 0;
        0 0 1];

tmat = (tr2*warp*rot*tr1)';
tform = affine2d(tmat);
y = imwarp(x, tform, 'OutputView', Rx);

end

