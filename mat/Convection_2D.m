clear;
nx=40;                          
ny=40;                              
nt=50;                           
dt=0.01;                        
dx=2/(nx-1);                    
dy=2/(ny-1);                     
x=0:dx:2;                        
y=0:dy:2;                        
u=zeros(nx,ny);                  
un=zeros(nx,ny);                 
v=zeros(nx,ny);                  
vn=zeros(nx,ny);                 

for i=1:nx
    for j=1:ny
        if ((0.5<=y(j))&&(y(j)<=1)&&(0.5<=x(i))&&(x(i)<=1))
            u(i,j)=4;
            v(i,j)=1;
        else
            u(i,j)=1;
            v(i,j)=2;
        end
    end
end

u(1,:)=0;
u(nx,:)=0;
u(:,1)=0;
u(:,ny)=0;
v(1,:)=0;
v(nx,:)=0;
v(:,1)=0;
v(:,ny)=0;
i=2:nx-1;
j=2:ny-1;

for it=0:nt
    un=u;
    vn=v;
    h=quiver(x,y,u',v','Color','black');       
    axis([0 2 0 2])
    xlabel('Spatial co-ordinate (x) \rightarrow')
    ylabel('Spatial co-ordinate (y) \rightarrow')
    drawnow; 
    refreshdata(h)
    u(i,j)=un(i,j)-(dt*un(i,j).*(un(i,j)-un(i-1,j))/dx)-(dt*vn(i,j).*(un(i,j)-un(i,j-1))/dy);
    v(i,j)=vn(i,j)-(dt*un(i,j).*(vn(i,j)-vn(i-1,j))/dx)-(dt*vn(i,j).*(vn(i,j)-vn(i,j-1))/dy);

    u(1,:)=0;
    u(nx,:)=0;
    u(:,1)=0;
    u(:,ny)=0;
    v(1,:)=0;
    v(nx,:)=0;
    v(:,1)=0;
    v(:,ny)=0;
end
