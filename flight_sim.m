function f=flight_sim(u)
% m=498.95;
% S=0.113;
S=0.484;
m=907.2;

rho0=1.225;
g0=9.81;
Re=6371393;
mumu=g0*Re^2;
hs=7320;
alpha0=u(1);
alphaf=u(2);
v1=u(3);
v2=u(4);
% sigma=u(5);
sigma=0;

% cd0 = -0.05119/340;
% cd1 = 0.001944*57.3^2;
% cd2 = -0.03795;
% cl0 = 0.0017/340;
% cl1 = 0.07412*57.3;
% cl2 = -0.998;

cl0=-0.2317;
cl1=0.0513;
cl2=0.2945;
cl3=-0.1028/340;
cd0=0.024;
cd1=7.24e-4;
cd2=0.406;
cd3=-0.323/340;



tspan=0:0.1:3000;
V0=7200;
h0=100000;
theta0=160/57.3;
phi0=15/57.3;
gamma0=-2/57.3;
psi0=55/57.3;
R0=0;
y0=[h0;theta0;phi0;V0;gamma0;psi0;0];
assignin('base','alpha0',alpha0);
assignin('base','alphaf',alphaf);
assignin('base','v1',v1);
assignin('base','v2',v2);
assignin('base','sigma',sigma);
options=odeset('events',@stop_conditions);
[tt yy]=ode45(@dydt,tspan,y0,options);
assignin('base','tt',tt);
assignin('base','yy',yy);

h=yy(:,1);
V=yy(:,4);
alpha=alpha0.*(V>v1)+((V-v1)*(alphaf-alpha0)/(v2-v1)+alpha0).*(V<=v1&V>=v2)+alphaf.*(V<v2);
Cl=cl2*exp(cl3*V)+cl1*alpha+cl0;
Cd=cd2*exp(cd3*V)+cd1*alpha.^2+cd0;
rho=rho0.*exp(-h./hs);
q=1/2*rho.*V.^2;
L=q.*Cl.*S;
D=q.*Cd.*S;
g=mumu./(Re+h).^2;
Qdot=1e-7*sqrt(rho).*(V).^3.15;
n=sqrt(L.^2+D.^2)./m./g;

%sum(-min(0,L./m*cos(sigma)+V.^2./(Re+h)-g))+
f=-yy(end,7)+10000*sum(-min(0,L./m*cos(sigma)+V.^2./(Re+h)-g))+10000*(sum(max(0,q-500000))+sum(max(0,Qdot-1e6))+sum(max(0,n-4)))^2;%+10000*(sum(max(0,q-150000))+sum(max(0,Qdot-2.6e5))+sum(max(0,n-55)))^2;%+10000*((yy(end,4)-800)^2+(yy(end,5)+80/57.3)^2);
end