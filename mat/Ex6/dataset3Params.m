%%Name dataset3Params.m
function [C, sigma] = dataset3Params(X, y, Xval, yval)

C = 1;
sigma = 0.3;

pred_error = zeros(8,8);
C_temp = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
sigma_temp = C_temp;

for i = 1:length(C_temp);
  for j = 1:length(sigma_temp);
   
    model = svmTrain(X, y, C_temp(i), @(x1, x2) gaussianKernel(x1, x2, sigma_temp(j)));
    pred = svmPredict(model, Xval);
    pred_error(i,j) = mean(double(pred ~= yval));
    (i-1)*8+j
    
  endfor
endfor

[M,I]=min(pred_error(:));
[I_row, J_col] = ind2sub(size(pred_error), I);

C = C_temp(I_row);
sigma = sigma_temp(J_col);

end
