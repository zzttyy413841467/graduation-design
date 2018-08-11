function phaseout = rlvEntryContinuous(input)

% input
% input.phase(phasenumber).state
% input.phase(phasenumber).control
% input.phase(phasenumber).time
% input.phase(phasenumber).parameter
%
% input.auxdata = auxiliary information
%
% output
% phaseout(phasenumber).dynamics
% phaseout(phasenumber).path
% phaseout(phasenumber).integrand

rad = input.phase.state(:,1);
lon = input.phase.state(:,2);
lat = input.phase.state(:,3);
speed = input.phase.state(:,4);
fpa = input.phase.state(:,5);
azimuth = input.phase.state(:,6);
%aoa = input.phase.control(:,1);
bank = input.phase.state(:,7);

bankdot = input.phase.control(:,1);
alpha0=30/57.3;
alphaf=10/57.3;
v1=6500;
v2=5000;
aoa=alpha0.*(speed>v1)+((speed-v1)*(alphaf-alpha0)/(v2-v1)+alpha0).*(speed<=v1&speed>=v2)+alphaf.*(speed<v2);


cd0 = input.auxdata.cd(1);
cd1 = input.auxdata.cd(2);
cd2 = input.auxdata.cd(3);
cl0 = input.auxdata.cl(1);
cl1 = input.auxdata.cl(2);
cl2 = input.auxdata.cl(3);

% cd0 = input.auxdata.cd(1);
% cd1 = input.auxdata.cd(2);
% cd2 = input.auxdata.cd(3);
% cd3 = input.auxdata.cd(4);
% cl0 = input.auxdata.cl(1);
% cl1 = input.auxdata.cl(2);
% cl2 = input.auxdata.cl(3);
% cl3 = input.auxdata.cd(4);


mu  = input.auxdata.mu;
rho0 = input.auxdata.rho0;
H = input.auxdata.H;
S = input.auxdata.S;
mass = input.auxdata.mass;
altitude = rad - input.auxdata.Re;

% CL = input.auxdata.cl(aoa,speed/340);
% CD = input.auxdata.cd(aoa,speed/340);

CL = exp(cl2*speed)+cl1*aoa+cl0;
CD = exp(cd2*speed)+cd1*aoa.^2+cd0;

% CL = cl2*exp(cl3*speed)+cl1*aoa+cl0;
% CD = cd2*exp(cd3*speed)+cd1*aoa.^2+cd0;

rho = rho0*exp(-altitude/H);

gravity = mu./rad.^2;
dynamic_pressure = 0.5*rho.*speed.^2;
D = dynamic_pressure.*S.*CD./mass;
L = dynamic_pressure.*S.*CL./mass;
slon = sin(lon);
clon = cos(lon);
slat = sin(lat);
clat = cos(lat);
tlat = tan(lat);
sfpa = sin(fpa);
cfpa = cos(fpa);
sazi = sin(azimuth);
cazi = cos(azimuth);
cbank = cos(bank);
sbank = sin(bank);

altdot   = speed.*sfpa;
londot   = speed.*cfpa.*sazi./(rad.*clat);
latdot   = speed.*cfpa.*cazi./rad;
speeddot = -D-gravity.*sfpa;
fpadot   = (L.*cbank-cfpa.*(gravity-speed.^2./rad))./speed;
azidot   = (L.*sbank./cfpa + speed.^2.*cfpa.*sazi.*tlat./rad)./speed;

qdot=1e-7*sqrt(rho).*(speed).^3.15;
Rdot=speed.*cfpa;
n=sqrt(L.^2+D.^2)./gravity;
balance=L-(gravity-speed.^2./rad);
% forbid1=(lon-10/180*pi).^2+(lat-20/180*pi).^2-(100000/input.auxdata.Re)^2;
% forbid2=(lon+10/180*pi).^2+(lat-50/180*pi).^2-(100000/input.auxdata.Re)^2;

phaseout.dynamics  = [altdot, londot, latdot, speeddot, fpadot, azidot, bankdot, Rdot];
phaseout.path = [dynamic_pressure, n, qdot,balance];
phaseout.integrand = qdot+1*fpadot.^2;%qdot+fpadot.^2