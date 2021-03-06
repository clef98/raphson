clear;
nx=100;                          
ny=100;                              
dx=2/(nx-1);                     
dy=2/(ny-1);                   
x=0:dx:2;                   
y=0:dy:2;                     
UW=0;                        
UE=y;                         
US=0;                        
UN=0;
UnW=0;                         
UnE=0;                          
UnS=0;                           
UnN=0;                          
u=zeros(nx,ny);                

bc=zeros(nx-2,ny-2);
bc(1,:)=UW/dx^2; bc(nx-2,:)=UE(2:ny-1)/dx^2;  
bc(:,1)=-UnS/dy; bc(:,ny-2)=UnN/dy; 

bc(1,1)=UW/dx^2-UnS/dy; bc(nx-2,1)=UE(2)/dx^2-UnS/dy;
bc(1,ny-2)=UW/dx^2+UnN/dy; bc(nx-2,ny-2)=UE(ny-1)/dx^2+UnN/dy;

Ex=sparse(2:nx-2,1:nx-3,1,nx-2,nx-2);
Ax=Ex+Ex'-2*speye(nx-2);        
Ey=sparse(2:ny-2,1:ny-3,1,ny-2,ny-2);
Ay=Ey+Ey'-2*speye(ny-2);       
Ay(1,1)=-1; Ay(ny-2,ny-2)=-1; 
A=kron(Ay/dy^2,speye(nx-2))+kron(speye(ny-2),Ax/dx^2);

S=zeros(nx-2,ny-2);             
S=reshape(S-bc,[],1);
S=A\S;
S=reshape(S,nx-2,ny-2);
u(2:nx-1,2:ny-1)=S;

%Dirichlet:
u(1,:)=UW;
u(nx,:)=UE;
%u(:,1)=US;
%u(:,ny)=UN;

%Neumann:
%u(1,:)=u(2,:)-UnW*dx;
%u(nx,:)=u(nx-1,:)+UnE*dx;
u(:,1)=u(:,2)-UnS*dy;
u(:,ny)=u(:,ny-1)+UnN*dy;

surf(x,y,u','EdgeColor','none');
shading interp
title('2-D Laplace''s equation')
xlabel('Spatial co-ordinate (x) \rightarrow')
ylabel('{\leftarrow} Spatial co-ordinate (y)')
zlabel('Solution profile (P) \rightarrow')
