clear
nx=60;                           
ny=60;                                
niter=10000;                     
dx=2/(nx-1);                   
dy=2/(ny-1);                    
x=0:dx:2;                        
y=0:dy:2;                      

p=zeros(ny,nx);                 
pn=zeros(ny,nx);                 

p(:,1)=0;
p(:,nx)=y;
p(1,:)=p(2,:);                  
p(ny,:)=p(ny-1,:);               

j=2:nx-1;
i=2:ny-1;
for it=1:niter
    pn=p;
    p(i,j)=((dy^2*(pn(i+1,j)+pn(i-1,j)))+(dx^2*(pn(i,j+1)+pn(i,j-1))))/(2*(dx^2+dy^2));
    p(:,1)=0;
    p(:,nx)=y;
    p(1,:)=p(2,:);
    p(ny,:)=p(ny-1,:);   
end

surf(x,y,p,'EdgeColor','none');       
shading interp
title({'2-D Laplace''s equation';['{\itNumber of iterations} = ',num2str(it)]})
xlabel('Spatial co-ordinate (x) \rightarrow')
ylabel('{\leftarrow} Spatial co-ordinate (y)')
zlabel('Solution profile (P) \rightarrow')
