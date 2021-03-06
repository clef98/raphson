clc; clear; clf;

%This function serves the standard 4th order Runge-Kutta method
h = 1.2;                                           
x = 0:h:3;                                         
y = zeros(1,length(x)); y(1) = 5;                                          
f = @(t,r) 3.*exp(-t)-0.4*r;

for i=1:(length(x)-1)                             
    k1 = f(x(i),y(i));
    k2 = f(x(i)+0.5*h,y(i)+0.5*h*k_1);
    k3 = f((x(i)+0.5*h),(y(i)+0.5*h*k_2));
    k4 = f((x(i)+h),(y(i)+k_3*h));
    y(i+1) = y(i)+(1/6)*(k1+2*k2+2*k3+k4)*h;  
end
