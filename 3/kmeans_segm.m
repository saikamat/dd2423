function [ segm, centers ] = kmeans_segm(I, K, L, seed)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Let X be a set of pixels and V be a set of K cluster centers in 3D (R,G,B).
% Recompute all distances between pixels and cluster centers

[maxRow, maxColumn, ~] = size(I);
Ivec = single(reshape(I, maxRow*maxColumn, 3));
% reshape the image.

rng(seed);
permutation = randperm(size(Ivec, 1));
for i = 1:K
	clusters(i, :) = Ivec(permutation(i), :);
end
% Randomly initialize the K cluster centers

dist = pdist2(Ivec, clusters, 'euclidean');
% Compute all distances between pixels and cluster centers

for i = 1:L
% Iterate L times
	[~,index] = min(dist');
	% Assign each pixel to the cluster center for which the distance is minimum
	for j = 1:K
		indexfoo = find(index == j);
		clusters(j, :) = mean(Ivec(indexfoo, :), 1);
	end
	% Recompute each cluster center by taking the mean of all pixels assigned to it
	dist = pdist2(Ivec, clusters, 'euclidean');
	% Recompute all distances between pixels and cluster centers
end

[~,index] = min(dist');
segm = reshape(index, maxRow, maxColumn);
for i = 1:K
	centers(i) = ceil(mean(find(segm == i)));
end

centers = double(clusters);
%centers = [centers', clusters];

end