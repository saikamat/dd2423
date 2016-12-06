%question 1 (need redraw)

fftwavetemplate(5,9);
fftwavetemplate(9,5);
fftwavetemplate(17,9);
fftwavetemplate(17,121);
fftwavetemplate(5,1);
fftwavetemplate(125,1);

%question 5

fftwavetemplate(64,64);
fftwavetemplate(72,72);

%question 10
F = [ zeros(56, 128); ones(16, 128); zeros(56, 128)];
G = F';
showfs(conv2(fftshift(F),fftshift(G)));

%question 11
F = [zeros(60, 128); ones(8, 128); zeros(60, 128)] .* ...
[zeros(128, 48) ones(128, 32) zeros(128, 48)];

%question 14
x = -64:1:63;
[X, Y] = meshgrid(x);
t = 0.1; % or 0.3, 1, 10, 100 or whatever
Z = (1 / (2 * pi * t)) * exp(-(X.^2 + Y.^2)/(2 * t));
mesh(Z);

%question 17
addfoo = discgaussfft(add, 0.8);showgrey(addfoo)
addfoo = medfilt2(add);showgrey(addfoo)
addfoo = ideal(add, 0.7);showgrey(addfoo)

%question 19
img = hand256;
smoothimg = ideal(img, 0.8);
N=4;
for i=1:N
if i>1 % generate subsampled versions
img = rawsubsample(img);
smoothimg = rawsubsample(smoothimg);
end
subplot(2, N, i)
showgrey(img)
subplot(2, N, i+N)
showgrey(smoothimg)
end