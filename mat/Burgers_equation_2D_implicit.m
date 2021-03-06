clear;
nx=30;                          
ny=30;                                
nt=60;                           
dt=0.01;                        
dx=2/(nx-1);                    
dy=2/(ny-1);                     
x=0:dx:2;                        
y=0:dy:2;                        
vis=0.01;                       
u=zeros(nx,ny);                 
un=zeros(nx,ny);                 
v=zeros(nx,ny);                 
vn=zeros(nx,ny);                 
rhsx=zeros(nx,ny);
rhsy=zeros(nx,ny);

for i=1:nx
    for j=1:ny
        if ((0.5<=y(j))&&(y(j)<=1)&&(0.5<=x(i))&&(x(i)<=1))
            u(i,j)=0;
            v(i,j)=1;
        else
            u(i,j)=1;
            v(i,j)=0;
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

Ex=(vis*dt/dx^2)*sparse(2:nx,1:nx-1,1,nx,nx);
Dx=Ex+Ex'-(2*dt*vis/dx^2)*speye(nx);
Ey=(vis*dt/dy^2)*sparse(2:ny,1:ny-1,1,ny,ny);
Dy=Ey+Ey'-(2*dt*vis/dy^2)*speye(ny);
d=kron(Dy,speye(nx))+kron(speye(ny),Dx);
D=d-speye(nx*ny);

i=2:nx-1;
j=2:ny-1;
m=2:nx;
n=2:ny;
for it=0:nt
    un=u;
    vn=v;
    h=quiver(x,y,u',v','k');
    axis([0 2 0 2])
    axis square
    xlabel('Spatial co-ordinate (x) \rightarrow')
    ylabel('Spatial co-ordinate (y) \rightarrow')
    drawnow;
    refreshdata(h)
 
    rhsx(m,n)=un(m,n)-(dt*un(m,n).*(un(m,n)-un(m-1,n))/dx)-(dt*vn(m,n).*(un(m,n)-un(m,n-1))/dy);
    rhsy(m,n)=vn(m,n)-(dt*un(m,n).*(vn(m,n)-vn(m-1,n))/dx)-(dt*vn(m,n).*(vn(m,n)-vn(m,n-1))/dy);
    bx=-reshape(rhsx,[],1);
    bx(1:nx)=0;bx(nx*(ny-1)+1:nx*ny)=0;         
    bx(1:nx:nx*(ny-1)+1)=0;bx(nx:nx:nx*ny)=0;   
    solx=D\bx;
    u=reshape(solx,nx,ny);
    by=-reshape(rhsy,[],1);
    by(1:nx)=0;by(nx*(ny-1)+1:nx*ny)=0;         
    by(1:nx:nx*(ny-1)+1)=0;by(nx:nx:nx*ny)=0;  
    soly=D\by;
    v=reshape(soly,nx,ny);
 
    u(1,:)=0;
    u(nx,:)=0;
    u(:,1)=0;
    u(:,ny)=0;
    v(1,:)=0;
    v(nx,:)=0;
    v(:,1)=0;
    v(:,ny)=0;
    %}
end
