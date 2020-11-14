%%Name gaussianKernel.m
function sim = gaussianKernel(x1, x2, sigma)

x1 = x1(:); x2 = x2(:);
sim = 0;
sigma_temp = -1*2*(sigma^2);
xSub = x1-x2;
sim = exp(sum(xSub .^ 2)/sigma_temp);

end
