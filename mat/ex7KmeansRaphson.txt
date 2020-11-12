clear 

load('YourData.mat');

K = 3;
max_iters = 10;
initial_centroids = [3 3; 6 2; 8 5];

[centroids, idx] = runkMeans(X, initial_centroids, max_iters, true);

A = double(imread('yourData2'));
A = A / 255; 
img_size = size(A);

X = reshape(A, img_size(1) * img_size(2), 3);

K = 16; 
max_iters = 10;

initial_centroids = kMeansInitCentroids(X, K);

[centroids, idx] = runkMeans(X, initial_centroids, max_iters);

