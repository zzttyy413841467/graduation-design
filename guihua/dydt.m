function ydot=dydt(t,y)

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
alpha0=30*pi/180;
alphaf=10*pi/180;
sigma=25*pi/180;
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
L=q.*Cl.*S;
D=q.*Cd.*S;
g=mu./(Re+h).^2;

rdot=V.*sin(gamma);
thetadot=V.*cos(gamma).*sin(psai)./r./cos(phi);
phidot=V.*cos(gamma).*cos(psai)./r;
Vdot=-D./m-g.*sin(gamma);
gammadot=1./V.*(L.*cos(sigma)./m+(V.^2./r-g).*cos(gamma));
psaidot=1./V.*(L.*sin(sigma)./m./cos(gamma)+(V.^2./r).*cos(gamma).*sin(psai).*tan(phi));
Rdot=V.*cos(gamma);
ydot=[rdot;thetadot;phidot;Vdot;gammadot;psaidot;Rdot];


end