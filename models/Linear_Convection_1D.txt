clear;
nx=50;               
nt=50;                
dt=0.01;             
c=1.0;                
dx=2/(nx-1);          
x=0:dx:2;            
u=zeros(1,nx);       
un=zeros(1,nx);       
sigma=abs(c)*dt/dx;   

for i=1:nx
    if ((0.75<=x(i))&&(x(i)<=1.25))
        u(i)=2;
    else
        u(i)=1;
    end
end

i=2:nx-1;
for it=0:nt
    un=u;
    h=plot(x,u);       
    axis([0 2 0 3])
    xlabel('Spatial co-ordinate (x) \rightarrow')
    ylabel('Transport property profile (u) \rightarrow')
    drawnow;
    refreshdata(h)
    pause(0.1)
    u(i)=un(i)-0.5*(sign(c)+1)*((c*dt*(un(i)-un(i-1)))/dx)...
        +0.5*(sign(c)-1)*((c*dt*(un(i+1)-un(i)))/dx);
end
