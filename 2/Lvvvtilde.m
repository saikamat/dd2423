function pixels = Lvvtilde(inpic, shape)
if (nargin < 2)
    shape = 'same';
end

deltax      = [0, 0, -0.5, 0, 0.5, 0, 0];
deltay      = [0; 0; -0.5; 0; 0.5; 0; 0];
deltaxxx    = [0, -0.5, 1, 0, -1, 0.5, 0];
deltaxxy    = [0; -0.5; 1; 0; -1; 0.5; 0];
deltaxyy    = [-0.125; 0; 0.375; 0; -0.375; 0; 0.125];
deltayyy    = [0; -0.5; 1; 0; -1; 0.5; 0];
% the operators.

Lx          = filter2(deltax, inpic, shape);
Ly          = filter2(deltay, inpic, shape);
Lxxx        = filter2(deltaxxx, inpic, shape);
Lxxy        = filter2(deltaxxy, inpic, shape);
Lxyy        = filter2(deltaxyy, inpic, shape);
Lyyy        = filter2(deltayyy, inpic, shape);
% the ingredients for computing the Lvvtilde.
pixels      = (Lx.^3) .* Lxxx + 3 * (Lx.^2) .* Ly .* Lxxy + ...
                3 * Lx .* (Ly.^2) .* Lxyy + (Ly.^3) .* Lyyy;

end