%%Name sigmoid.m
function g = sigmoid(z)

g = zeros(size(z));

var_1 = -z;
var_2 = e .^ var_1;
g = 1 ./(var_2 .+ 1);
end
