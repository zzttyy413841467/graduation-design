function [value,isterminal,direction]=stop_conditions(t,y)

m=498.95;
S=0.113;

cd2 = -0.05119/340;
cd1 = 0.001944*57.3^2;
cd0 = -0.03795;
cl2 = 0.0017/340;
cl1 = 0.07412*57.3;
cl0 = -0.998;

rho0=1.225;
g0=9.81;
Re=6371393;
mu=g0*Re^2;
hs=7320;
v1=6500;
v2=5000;
alpha0=30/180*pi;
alphaf=10/180*pi;

r=y(1);
theta=y(2);
phi=y(3);
V=y(4);
gamma=y(5);
psai=y(6);


if V>=v1
    alpha=alpha0;
elseif V<v1&V>=v2
    alpha=(V-v1)*(alphaf-alpha0)/(v2-v1)+alpha0;
else
    alpha=alphaf;
end

Cl=exp(cl2*V)+cl1*alpha+cl0;
Cd=exp(cd2*V)+cd1*alpha.^2+cd0;
h=r-Re;
rho=rho0.*exp(-h./hs);
q=1/2*rho.*V.^2;
L=q.*Cl.*S/m;
D=q.*Cd.*S/m;
g=mu./(Re+h).^2;

f=@(x)1/2*1.225*exp(-x/hs).*V.^2.*Cl.*S./m-mu./(Re+x).^2+(V.^2./(Re+x));
hb=fsolve(f,0);
rhob=rho0.*exp(-hb./hs);
dh_dv=-V*sin(gamma)/(D+g*sin(gamma));
rb=hb+Re;

dh_dv1=(-1/2*rhob*S/m*(2*V*Cl+V^2*cl2*exp(cl2*V))-2*V/rb)/(-1/2*rhob*S*V^2*Cl/hs/m+2*mu/rb^3-V^2/rb^2);
dh_dv2=(-1/2*rho*S/m*(2*V*Cl+V^2*cl2*exp(cl2*V))-2*V/r)/(-1/2*rho*S*V^2*Cl/hs/m+2*mu/r^3-V^2/r^2);
value=abs(dh_dv-dh_dv1)-50;
isterminal=1;
direction=-1;
end
