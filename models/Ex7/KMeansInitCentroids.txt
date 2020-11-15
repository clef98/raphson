%%Name KMeansInitCentroids.m
function centroids = kMeansInitCentroids(X, K)

centroids = zeros(K, size(X, 2));

% Initialize the centroids to be random examples
randidx = randperm(size(X, 1));
centroids = X(randidx(1:K), :);

end
