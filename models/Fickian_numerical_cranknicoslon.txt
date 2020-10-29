clear; clc; clf;

L=1;
T=5;
M=4000;
dt=T/M;
N=20;
dx=L/N;
D=1;
alpha=D*dt/(dx*dx);
u=zeros(N+1,M+1);

for i=1:N+1
   x(i) =(i-1)*dx;
end

threshold=1*10^-8;
straight_found=0;
du_dt0=ones(1,M);
du_dt=zeros(1,M);

aa(1:N)=-alpha;
bb(1:N+1)=2+2*alpha;
cc(1:N)=-alpha;
MM=diag(bb,0)+diag(aa,-1)+diag(cc,1);
MM(N+1,N)=-2*alpha;

aa0(1:N)=alpha;
bb0(1:N+1)=2-2*alpha;
cc0(1:N)=alpha;
MM0=diag(bb0,0)+diag(aa0,-1)+diag(cc0,1);
MM0(N+1,N)=2*alpha;

bound=zeros(N+1,1);
bound(1,1)=1;

for j=2:M    
  	uu=u(1:N+1,j-1);
	u(1:N+1,j)=MM\(MM0*uu+2*alpha*bound);
	u(1,j)=1;
	%u(N+1,j)=0;
hold on
if j==8||j==40||j==80||j==160||j==320||j==640
    plot(x,u(:,j-1));
end
end  
        
for j=3:M
    du_dt=abs(u(:,j-2)-u(:,j-1));
    du_dt0(j)=max(du_dt);
    if du_dt0(j)<=threshold && straight_found==0
        display((j-1)*dt);
        straight_found=1;
    end
end
        
xlabel({'Distance'});
title({'Crank-Nicolson'});
ylabel({'Concentration'});

