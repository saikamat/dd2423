function edgecurves = extractedge(inpic, scale, threshold, shape)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if (nargin < 4)
    shape = 'same';
end

lv      = (Lv(inpic) > (threshold*10));
foo     = Lvvtilde(discgaussfft(inpic, scale), shape);
bar     = Lvvvtilde(discgaussfft(inpic, scale), shape);
% create Lvv and Lvvv tilde.
foo     = (foo > threshold);
baz     = (bar < 0);
baz     = foo .* baz;

curves  = zerocrosscurves(baz);
edgecurves = thresholdcurves(curves, lv.*(lv'));
%edgecurves = edgecurves - curvesfoo;
subplot(1, 1, 1);
overlaycurves(inpic, edgecurves);

end

