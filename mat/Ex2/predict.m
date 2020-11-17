%%Name predict.m
function p = predict(theta, X)

m = size(X, 1); 
p = zeros(m, 1);

temp = sigmoid(X * theta)
for i = 1:m
  if temp(i,1) >= 0.5
    p(i,1) = 1
  else
    p(i,1) == 0
  endif
endfor

end
