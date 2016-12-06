function [linepar, acc] = houghline(img, nrho, ntheta, nlines)
% other parameters omitted for simplicity.

dist        = 1.2;

E           = edge(img);
[r,c]       = find(E);
edgedata    = [c';r'];

% create the edge data.
% have not used my own extractedgeline()
% since it is not perfect

if (nargin < 4)
    nlines  = 10;
end
if (nargin < 3)
    nrho    = max(edgedata(:)) * dist;
end
if (nargin < 2)
    ntheta  = 200;
end
% determine the parameters.
% if not specified, use default instead.

row         = edgedata(2,:)';
column      = edgedata(1,:)';
Ts          = [0:pi/ntheta:pi-pi/ntheta]';
CsT         = cos(Ts);
SnT         = sin(Ts);
S           = row * CsT' + column * SnT';

Smin        = min(S(:));
Smax        = max(S(:));
m           = (nrho-1)/(Smax-Smin);
b           = (Smax-nrho*Smin)/(Smax-Smin);
rmS         = round(m*S + b);

% Allocate accumulator space
% Define a coordinate system in the accumulator space

acc         = [];
for k=1:nrho,
% Loop over all the input curves (cf. pixelplotcurves)
 isEq       = (rmS==k);
 % Check if valid pointheta with respect to threshold
 acc(:,k)     = sum(isEq)';
 % Compute index values in the accumulator space
 % Update the accumulator
end

subplot(1,1,1)
showgrey(acc)
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;

hLocalMax   = vision.LocalMaximaFinder;
hLocalMax.MaximumNumLocalMaxima = nlines; % nlines
hLocalMax.NeighborhoodSize = [3 3];
hLocalMax.Threshold = 1;

linepar      = step(hLocalMax, acc);
% Extract local maxima from the accumulator

x           = linepar(:,1);
y           = linepar(:,2);
plot(x,y,'s','color','black'), hold off;

end