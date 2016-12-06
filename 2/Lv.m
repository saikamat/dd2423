function pixels = Lv(inpic, shape)
if (nargin < 2)
    shape = 'same';
end

deltax      = [-0.5, 0, 0.5]; % only 3 digits
deltay      = [-0.5; 0; 0.5];

Lx = filter2(deltax, inpic, shape);
Ly = filter2(deltay, inpic, shape);
pixels = Lx.^2 + Ly.^2;

end