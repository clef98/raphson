clc; clear; clf;

X = 0:0.01:1;
Y = 0:0.1:10;
Z = zeros(101, 101);

threshold=0.00001;
straight_found=0;

D=1;
syms n
%hold on
%figure(1);
for i = 1:101
      Z(i, :) = symsum((((-1)^n)*(erfc((2*n+X)/(2*sqrt(Y(i))/D))+erfc((2*n+2-X)/(2*sqrt(Y(i))/D)))), n, 0, 30);
  %plot (X, Z(i, :))    
end
for j=2:101
       if j==2
           du_dt=zeros(1,101);
           du_dt0=ones(1,101);
       end
       if j~=2
           du_dt=abs(Z(j-2,:)-Z(j-1,:));
           du_dt0(j)=max(du_dt);
       end
       if du_dt0(j)<= threshold && straight_found==0
           display(j-1);
           straight_found=1;
       end
end

%figure(2);
%surf(X,Y,Z)
