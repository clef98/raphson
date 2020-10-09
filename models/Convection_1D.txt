% Simulating the inviscid Burgers' equation (1-D Convection) by the 
...Finite difference Method(a time march)
% Numerical scheme used is a first order upwind in space and time

%%
%Specifying Parameters
nx=100;             %Number of steps in space(x)
nt=50;              %Number of time steps 
dt=0.01;            %Width of each time step
dx=2/(nx-1);        %Width of space step
x=0:dx:2;           %Range of x=(0,2) and specifying the grid points
u=zeros(1,nx);      %Preallocating u
un=zeros(1,nx);     %Preallocating un

%%
%Initial conditions: a sinusoidal wave
for i=1:nx
    if ((0.5<=x(i))&&(x(i)<=1))
        u(i)=1+sin(4*pi*x(i));
    else
        u(i)=1;
    end
end

%%
%Calculating the velocity profile at every time step
i=3:nx;
for it=0:nt
    un=u;
    h=plot(x,u,'k');       %plotting the velocity profile
    axis([0 2 -1 3])
    title({'1-D Convection';['time(\itt) = ',num2str(dt*it)]})
    xlabel('Spatial co-ordinate (x) \rightarrow')
    ylabel('Transport property profile (u) \rightarrow')
    drawnow; 
    refreshdata(h)
    %Uncomment as necessary
    %------------------
    %Beam-Warming scheme(Explicit) 
    u(i)=un(i)-(dt*u(i).*(3*un(i)-4*un(i-1)+un(i-2))/(2*dx))+(dt^2*(un(i).^2).*(un(i)-2*un(i-1)+un(i-2))/(2*dx*dx));
    %------------------
    %FD in time and BD in space(Explicit):
    %u(i)=un(i)-(dt*(un(i).*(un(i)-un(i-1)))/dx);
end