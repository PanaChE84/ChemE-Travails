function f= semibatch(t,y)
k=2.2;
V0=10;
v=0.1;
V=V0+v*t;
f(1,1)=-k*y(1)*y(2)-0.1*y(1)/(V);
f(2,1)=-k*y(1)*y(2)+0.1*(0.025-y(2))/(V);
f(3,1)=k*y(1)*y(2)-0.1*y(3)/(V);
f(4,1)= k*y(1)*y(2);
end
%the whole section below must be uncommented and run
%commands to be given for solution and plots:
% tspan=0:500;
% Cin= [0.1 0 0 0];
% [t,y]= ode45('semibatch',tspan,Cin)
% iodinecyanide_vec =y(:,1); 
%plot(tspan,iodinecyanide_vec)
% methylamine_vec= y(:,2); 
% plot(tspan,methylamine_vec)
% methyliodide_vec= y(:,3); 
% plot(tspan,methyliodide_vec)
% reaction_rate_vec= y(:,4);
%plot(tspan,reaction_rate_vec) 
%ConcAFinal=iodinecyanide_vec(1,end);
%Vfinal=60; (10+0.1*500)
%initialmolesofA=1; (0.1*10)
%finalmolesofA= ConcAFinal*Vfinal;
%ConversionRatio1= 1-finalmolesofA/initialmolesofA
% clc
% Conversion 2:
% tspan=0:500;
% Cin2= [1 0 0 0];
% [t,y]= ode45('CH014_Ques1_function',tspan,Cin2)
% iodinecyanide_vec2 =y(:,1)
% ConcAFinal=iodinecyanide_vec(1,end);
%Vfinal=60; (10+0.1*500)
% initialmolesofA=10; (1*10)
% finalmolesofA= ConcAFinal*Vfinal;
%ConversionRatio2= 1-finalmolesofA/initialmolesofA