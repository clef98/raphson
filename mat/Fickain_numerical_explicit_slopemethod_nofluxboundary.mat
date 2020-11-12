clc; clear; clf

L=1;
D=1;
N=20;
M=4000;
dx=L/N;
%dt=T/M;
dt=0.5*dx*dx/D;
alpha=D*dt/dx^2;
u0=zeros(M+1,N+1);

x=zeros(1,N+1);
for i=1:N+1
    x(i)=(i-1)*dx;
    u0(i)=0;
end
u0(:,1)=1;

threshold=1*10^-7;
straight_found=0;
%du_dt=zeros(1,M);
du_dt0=ones(1,M);

hold on;

for j=2:M
   for i=2:N
        u0(j-1,i)=u0(j-1,i)+alpha*(u0(j-1,i-1)+u0(j-1,i+1)-2*u0(j-1,i));
   end  
   u0(:,N+1)=u0(:,N); 
   if j==2
       du_dt=zeros(1,M);
   end
   if j~=2
       du_dt=abs(u0(j-2,:)-u0(j-1,:));
       du_dt0(j)=max(du_dt);
   end
    while du_dt0(j)<= threshold && straight_found==0
       display((j-1)*dt);
       straight_found=1;
    end
    if j==8||j==40 || j==80 ||j==160||j==320 ||j==640
        plot(x,u0(j-1,:))
    end
    u0(j,:)=u0(j-1,:); 
end
