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

    u(i)=0.5*(un(i+1)+un(i-1))-0.25*(dt/dx)*(un(i+1).^2-un(i-1).^2);
    
end
