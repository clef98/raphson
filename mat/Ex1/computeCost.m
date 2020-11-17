%%Name computeCost.m
function J = computeCost(X, y, theta)

m = length(y); 
J = 0;
a = X * theta;
J = (1/(2*m)) * sum((a-y) .^ 2);
end
