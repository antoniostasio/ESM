
x = imread('vista_aerea.jpg');
x = double(x);
[M, N] = size(x);

% MEAN
%{
radius = 2;
MED = zeros(M-radius, N-radius);
for i=1:M-radius
    for j=1:N-radius
        MED(i,j) = mean2(x(i:i+radius,j:j+radius));
    end
end
figure(1);
imshow(MED, [0 255]);
%}

%{
%y = nlfilter(x, [3 3], 'mean2(x)');
y = colfilt(x, [3 3], 'sliding', @mean);

figure(1);
subplot(1,2,1); imshow(x, [0 255]);
subplot(1,2,2); imshow(y, [0 255]);
%}

% HISTOGRAM
%{
n = hist(x(:), 0:255);
figure(2);
bar(n);
axis([0 255 0 1.1*max(n)]);
%}

% OFFSET
%{
x = imread('vista_aerea.jpg');
x = double(x);
[M, N] = size(x);

x1 = x -50;
x1(x1<0) = 0;
y = x1*(255/max(x1(:)));
mask = y<0;
%}

% GAMMA
%{
gamma = 0.4;
y = x.^gamma;
y = FSHS(y);
%}

% HISTEQ
%{
y = FSHS(histeq(x/255)*255);
ny = hist(y(:), 0:255);
%}

figure(1);
subplot(1,2,1);
subplot(1,2,2);

figure(2);
subplot(1,2,1);
subplot(1,2,2);
