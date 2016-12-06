function pixels = Lvvtilde(inpic, shape)
if (nargin < 2)
    shape = 'same';
end

deltax      = [0, -0.5, 0, 0.5, 0];
deltay      = [0; -0.5; 0; 0.5; 0];
deltaxx     = [0, 1, -2, 1, 0];
deltaxy     = [0.25; 0; -0.5; 0; 0.25];
deltayy     = [0; 1; -2; 1; 0];
% the operators.

Lx          = filter2(deltax, inpic, shape);
Ly          = filter2(deltay, inpic, shape);
Lxx         = filter2(deltaxx, inpic, shape);
Lxy         = filter2(deltaxy, inpic, shape);
Lyy         = filter2(deltayy, inpic, shape);
% the ingredients for computing the Lvvtilde.
pixels      = (Lx.^2) .* Lxx + 2 * Lx .* Ly .* Lxy + (Ly.^2) .* Lyy;

end