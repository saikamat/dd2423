% q1
deltax = [1, -1];
deltay = [1; -1];
tools = few256;
% tools = godthem256;
dxtools = conv2(tools, deltax, 'valid');
dytools = conv2(tools, deltay, 'valid');

% q2
foo = zeros(256, 1);
dxtools = [dxtools, foo];
foo = zeros(1, 256);
dytools = [dytools; foo];
% complement those matrices with ett linje of zeros.
gradmagntools = sqrt(dxtools .^2 + dytools .^2);
% compute the gradient magnitude.
showgrey((gradmagntools - threshold) > 0);

% q4
deltax      = [-0.5, 0, 0.5]; % only 3 digits
deltay      = [-0.5; 0; 0.5];
deltaxx     = [0, 1, -2, 1, 0];
deltaxy     = [0.25; 0; -0.5; 0; 0.25];
deltayy     = [0; 1; -2; 1; 0]; % only 5 digits
deltaxxx    = [0, -0.5, 1, 0, -1, 0.5, 0];
deltaxxy    = [0; -0.5; 1; 0; -1; 0.5; 0];
deltaxyy    = [-0.125; 0; 0.375; 0; -0.375; 0; 0.125];
deltayyy    = [0; -0.5; 1; 0; -1; 0.5; 0];
% the operators.

% q5
subplot(2,3,1)
showgrey(Lvvvtilde(discgaussfft(tools, 0.01), 'same') < 0)
subplot(2,3,2)
showgrey(Lvvvtilde(discgaussfft(tools, 1), 'same') < 0)
subplot(2,3,3)
showgrey(Lvvvtilde(discgaussfft(tools, 4), 'same') < 0)
subplot(2,3,4)
showgrey(Lvvvtilde(discgaussfft(tools, 16), 'same') < 0)
subplot(2,3,5)
showgrey(Lvvvtilde(discgaussfft(tools, 40), 'same') < 0)
subplot(2,3,6)
showgrey(Lvvvtilde(discgaussfft(tools, 64), 'same') < 0)

% q7
curves = extractedge(img, 1, 40);
% for extracting the tools.
curves = extractedge(img, 2, 400);
% for extracting the house.