clear;
nx=90;                         
ny=90;                          
nt=50;                          
dt=0.01;                     
c=1.0;                          
dx=2/(nx-1);                    
dy=2/(ny-1);                     
x=0:dx:2;                       
y=0:dy:2;                        
u=zeros(nx,ny);                  
un=zeros(nx,ny);                 

for i=1:nx
    for j=1:ny
        if ((0.5<=y(j))&&(y(j)<=1)&&(0.5<=x(i))&&(x(i)<=1))
            u(i,j)=2;
        else
            u(i,j)=0;
        end
    end
end

u(1,:)=0;      
u(nx,:)=0;
u(:,1)=0;
u(:,ny)=0;

i=2:nx-1;
j=2:ny-1;
for it=1:nt
    un=u;
    h=surf(x,y,u','EdgeColor','none');      
    shading interp
    axis([0 2 0 2 0 2.5])
    xlabel('Spatial co-ordinate (x) \rightarrow')
    ylabel('{\leftarrow} Spatial co-ordinate (y)')
    zlabel('Transport property profile (u) \rightarrow')
    drawnow;
    refreshdata(h)
    
    u(i,j)=un(i,j)-(c*dt*(un(i,j)-un(i-1,j))/dx)-(c*dt*(un(i,j)-un(i,j-1))/dy);
    u(1,:)=0;
    u(nx,:)=0;
    u(:,1)=0;
    u(:,ny)=0;
end
