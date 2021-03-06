%%Name ex2.m
clear ; close all; clc

data = load('yourData.txt');
X = data(:, [1, 2]); y = data(:, 3);


[m, n] = size(X);

X = [ones(m, 1) X];

initial_theta = zeros(n + 1, 1);


[cost, grad] = costFunction(initial_theta, X, y);

options = optimset('GradObj', 'on', 'MaxIter', 400);

[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);


p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('Expected accuracy (approx): 89.0\n');
fprintf('\n');
