clear ; close all; clc

fprintf('Loading and Visualizing Data ...\n')

load('yourData1.mat');

C = 1;
model = svmTrain(X, y, C, @linearKernel, 1e-3, 20);

load('yourData2.mat');

fprintf('\nTraining SVM with RBF Kernel (this may take 1 to 2 minutes) ...\n');

C = 1; sigma = 0.1;

model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 

load('yourData3.mat');


[C, sigma] = dataset3Params(X, y, Xval, yval);


model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
visualizeBoundary(X, y, model);
