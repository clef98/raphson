clear;
nx=100;             
nt=50;              
dt=0.01;            
dx=2/(nx-1);       
x=0:dx:2;           
u=zeros(1,nx);     
un=zeros(1,nx);     

for i=1:nx
    if ((0.5<=x(i))&&(x(i)<=1))
        u(i)=1+sin(4*pi*x(i));
    else
        u(i)=1;
    end
end

i=3:nx;
for it=0:nt
    un=u;
    h=plot(x,u,'k');     
    axis([0 2 -1 3])
    xlabel('Spatial co-ordinate (x) \rightarrow')
    ylabel('Transport property profile (u) \rightarrow')
    drawnow; 
    refreshdata(h)
    %Beam-Warming
    u(i)=un(i)-(dt*u(i).*(3*un(i)-4*un(i-1)+un(i-2))/(2*dx))+(dt^2*(un(i).^2).*(un(i)-2*un(i-1)+un(i-2))/(2*dx*dx));
    %FD time, BD space (Explicit):
    u(i)=un(i)-(dt*(un(i).*(un(i)-un(i-1)))/dx);
end
