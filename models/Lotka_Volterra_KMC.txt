clear
Nt=5000;                 
alpha=2;                 
beta=0.05;               
gamma=1.5;               
prey_init=20;            
predator_init=40;        
T=zeros(1,Nt+1);         
prey=zeros(1,Nt+1);      
predator=zeros(1,Nt+1);  
x=prey_init; prey(1)=x;
y=predator_init; predator(1)=y;

for it=1:Nt
    k=[alpha*x beta*x*y gamma*y];             
    s=cumsum(k);                              
    u=random('unif',0,1);
    index=find(s>=s(3)*u);                    
    switch index(1)
        case 1
            x=x+1;
        case 2
            if (x>1)
                x=x-1;
                y=y+1;
            end
        otherwise
            if (y>1)
                y=y-1;
            end
    end
    prey(it+1)=x;                   
    predator(it+1)=y;              
    dt=-log(1-u)/s(3);             
    T(it+1)=T(it)+dt;
end

plot(T,prey,'Color','r'); 
hold on     
plot(T,predator,'Color','k')
ylabel('Population \rightarrow')
xlabel('Time \rightarrow')
legend('Prey population','Predator population')
hold off
figure
plot(prey,predator)                     
xlabel('Prey Population \rightarrow')
ylabel('Predator population \rightarrow')
