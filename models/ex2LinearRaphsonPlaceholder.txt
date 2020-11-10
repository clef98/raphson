clear 

data = load('YourData.txt');
X = data(:, [1, 2]); y = data(:, 3);
plotData(X, y);
hold on;
legend('y = 1', 'y = 0')
hold off;




X = mapFeature(X(:,1), X(:,2));
initial_theta = zeros(size(X, 2), 1);
lambda = 1;
[cost, grad] = costFunctionReg(initial_theta, X, y, lambda);

test_theta = ones(size(X,2),1);
[cost, grad] = costFunctionReg(test_theta, X, y, 10);

initial_theta = zeros(size(X, 2), 1);
lambda = 1;

options = optimset('GradObj', 'on', 'MaxIter', 400);

[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);


plotDecisionBoundary(theta, X, y);
hold on;
title(sprintf('lambda = %g', lambda))

legend('y = 1', 'y = 0', 'Decision boundary')
hold off;

p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('Expected accuracy (with lambda = 1): 83.1 (approx)\n');
