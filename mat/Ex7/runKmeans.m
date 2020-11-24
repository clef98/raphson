%%Name runKmeans.m
function [centroids, idx] = runkMeans(X, initial_centroids, ...
                                      max_iters, plot_progress)
                                      
if ~exist('plot_progress', 'var') || isempty(plot_progress)
    plot_progress = false;
end

[m n] = size(X);
K = size(initial_centroids, 1);
centroids = initial_centroids;
previous_centroids = centroids;
idx = zeros(m, 1);

for i=1:max_iters
    
    if exist('OCTAVE_VERSION')
        fflush(stdout);
    end

    idx = findClosestCentroids(X, centroids);    
    centroids = computeCentroids(X, idx, K);
    
end

end
