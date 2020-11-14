%%Name costFunction.m
function [J, grad] = costFunction(theta, X, y)

m = length(y);
J = 0;
grad = zeros(size(theta));

hyp = sigmoid(X * theta);
var_1 = y * -1 + 1;
var_2 = hyp * -1 + 1;
J = (1/m) * (((y * -1)' * (log(hyp))) - (var_1' * log(var_2)));
grad = (1/m) * (X' * (hyp - y));
end
