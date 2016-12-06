function pixels = gaussfft(inpic, sigma2)


ftransform = fft2(inpic);

[xsize ysize] = size(ftransform);
[x y] = meshgrid(0 : xsize-1, 0 : ysize-1);

%impulse = zeros(xsize, ysize);
%impulse(x, y) = exp(sigma2 * (cos(2 * pi*(x / xsize)) + cos(2 * pi*(y / ysize)) - 2)) / (2 * pi * sigma2);
%showgrey(impulse);

foo = fft2(inpic);
impulse = exp(-(sigma2 / 2) * ((2 * pi * x / xsize).^2 + (2 * pi * y / ysize).^2));
pixels = ifft2(foo .* impulse);