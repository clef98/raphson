clc; clear; clf;

L=1;
k=1;
N=10;
M=900;
dx=L/N;
dt=0.5*dx*dx/k;
alpha=k*dt/dx^2;

x=zeros(1,N+1);
for i=1:N+1
    x(i)=(i-1)*dx;
end

du_xi=zeros(1,N);
du_ti=zeros(1,M);
straight_found=0;
straight_found_time=0;
threshold= .0000000005;
u0=zeros(1,N+1);
u0(1)=1;

hold on;
plot(x,u0);

for j=2:M
    for i=2:N
        u0(i)=u0(i)+alpha*(u0(i-1)+u0(i+1)-2*u0(i));
        %du_xi(i-1)=abs(abs(u0(i)-u0(i-1)));
        du_xi(i-1)=abs(abs(u0(i)-u0(i-1))-1/N);

    end 
    %u0(N+1)=u0(N); 
    %du_xi(N)=abs(abs(u0(N+1)-u0(N)));
    du_xi(N)=abs(abs(u0(N+1)-u0(N))-1/N);
    du_ti(j)=max(du_xi);
    if du_ti(j)<=threshold && straight_found==0
        straight_found_time = (j-1)*dt;
        straight_found = 1;
    end
        plot(x,u0)
end

display(straight_found_time);
% figure;
% plot(du_ti);