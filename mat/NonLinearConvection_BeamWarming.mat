clear;
nx=400;             
nt=50;              
dt=0.01;          
dx=4/(nx-1);        
x=0:dx:4;          
u=zeros(1,nx);      
un=zeros(1,nx);    
Eexp=0.11;         

index=find(x>=2);
u(1:index(1))=1;   
ustar=u;
b=zeros(nx,1);
I=speye(nx,nx);

i=2:nx-1;
for it=1:nt
    un=u;
    h=plot(x,u,'k');      
    axis([0 4 -1 2])
    title({'1-D Convection';['time(\itt) = ',num2str(dt*it)]})
    xlabel('Spatial co-ordinate (x) \rightarrow')
    ylabel('Transport property profile (u) \rightarrow')
    drawnow; 
    refreshdata(h)
    
    E=(-0.25*dt/dx)*sparse(2:nx,1:nx-1,un(1:nx-1),nx,nx);
    Et=(0.25*dt/dx)*sparse(2:nx,1:nx-1,un(2:nx),nx,nx);
    D=E+Et'+I;
    D(1,1)=1;D(1,2)=0;D(nx,nx)=1;D(nx,nx-1)=0;
    b(3:nx-2)=un(3:nx-2)-Eexp*(un(5:nx)-4*un(4:nx-1)+6*un(3:nx-2)-4*un(2:nx-3)+un(1:nx-4));
    b(1)=1;b(nx)=0;b(2)=1;b(nx-1)=0;
    u=D\b;
end
        
