clc; clear; clf;

threshold=0.00001;
straight_found=0;

L=1;
T=5;
N=20;
M=4000;
dx=L/N;
dt=T/M;
D=1;
%X = 0:0.01:1;
%Y = 0:0.1:10;
Z = zeros(M+1,N+1);
for n=1:N+1
    X(n)=(n-1)*dx;
end
for m=1:M+1
    Y(m)=(m-1)*dt;
end
syms n
hold on
%figure(1);
for i = 1:M+1
        %DIRICHLET
        %Z(i, :) = symsum(erfc((2*n+X)/(2*sqrt(Y(i))))-erfc((2*n+2-X)/(2*sqrt(Y(i)))), n, 0, 20);
        %NEUMANN
     Z(i, :) = symsum((((-1)^n)*(erfc((2*n+X)/(2*sqrt(Y(i))/D))+erfc((2*n+2-X)/(2*sqrt(Y(i))/D)))), n, 0, 20);
     %plot(X,Z(i,:))
end
for j=2:M
       if j==2
          du_dt=zeros(1,M);
          du_dt0=ones(1,M);
      end
      if j~=2
           du_dt=abs(Z(j-2,:)-Z(j-1,:));
           du_dt0(j)=max(du_dt);
       end
       if du_dt0(j)<= threshold && straight_found==0
           display((j-1)*dt);
          straight_found=1;
       end
end
%figure(2);
%surf(X,Y,Z)

