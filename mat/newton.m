clc; clear; clf;

f = x*exp(x)-1; 
g = diff(f); 
n = 5; %Number of decimal places 
epsilon = 5*10^-(n+1)
x_0 = 5; %Sample initial approximation
for i=1:100
       f0 = vpa(subs(f,x,x_0)); 
       f0_d = vpa(subs(g,x,x_0)); 
    y = x0-f0/f0_d;
  e = abs(y-x_0);
  if e < epsilon
    break;
  end
  x_0 = y;
end

y = y - rem(y,10^-n); 
