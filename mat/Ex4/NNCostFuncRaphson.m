%%nnCostFunction.mat
function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));



%COST FUNCTION WITHOUT REG.
a1 = [ones(m,1), X]; %a1 size 5000*401
z2 = a1*Theta1';     %z2 size 5000*25
a2 = sigmoid(z2);    
m2 = size(a2,1);  
a2 = [ones(m2, 1), a2]; %a2 size 5000*26
z3 = a2 * Theta2';      %z3 size 5000*10
a3 = sigmoid(z3);
HypOfX = a3;             %HypOfX size 5000*10

s3 = zeros(m, num_labels);

for i=1:m
  
  y_1 = zeros(num_labels,1);   %y_1 size 10*1
  y_1(y(i)) = 1;

  
  J = J + (log(HypOfX(i,:)) * (-y_1) - log(1-HypOfX(i,:))*(1-y_1))/m ;
  
  
  
%ADDING REG. TO COSTFUNCTION  
  
endfor


Theta1_temp_1 = Theta1'(2:end, :);
Theta2_temp_1 = Theta2'(2:end, :);
J = J + (lambda/(2*m))*(sum(sum(Theta1_temp_1 .^ 2)) + sum(sum(Theta2_temp_1 .^ 2)));


y_v =(1:num_labels) == y; % will be 5000*10

delta3 = a3 - y_v;        %5000*10
delta2 = delta3*Theta2(:,2:end) .* sigmoidGradient(z2);   %5000*25


Theta1_grad = (1/m) * (delta2' * a1);   %25*401
Theta2_grad = (1/m) * (delta3' * a2);   %10*26s

Theta1_grad(:,2:end) = Theta1_grad(:,2:end) + (lambda/m) * Theta1(:,2:end);
Theta2_grad(:,2:end) = Theta2_grad(:,2:end) + (lambda/m) * Theta2(:,2:end);

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
