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


theta1=yy(end,5);
V1=yy(end,4);
h1=yy(end,1)-Re;
Vf=1000;
hf=15000;
Vm=1/2*(V1+Vf);
q1=1/2*rho0*exp(-h1/hs)*V1^2;
qf=1/2*rho0*exp(-hf/hs)*Vf^2;
qm=1/2*(q1+qf);
hm=-hs*log(2*qm/rho0/Vm^2);

if V1>=v1
    alpha1=alpha0;
elseif V1<v1&V1>=v2
    alpha1=(V1-v1)*(alphaf-alpha0)/(v2-v1)+alpha0;
else
    alpha1=alphaf;
end

if Vf>=v1
    alpha2=alpha0;
elseif Vf<v1&Vf>=v2
    alpha2=(Vf-v1)*(alphaf-alpha0)/(v2-v1)+alpha0;
else
    alpha2=alphaf;
end

Cl1=exp(cl2*V1)+cl1*alpha1+cl0;
Cd1=exp(cd2*V1)+cd1*alpha1.^2+cd0;
Clf=exp(cl2*Vf)+cl1*alpha2+cl0;
Cdf=exp(cd2*Vf)+cd1*alpha2.^2+cd0;

rho1=rho0.*exp(-h1./hs);
q1=1/2*rho1.*V1.^2;
L1=q1.*Cl1.*S/m;
D1=q1.*Cd1.*S/m;
g1=mu./(Re+h1).^2;
rhof=rho0.*exp(-hf./hs);
qf=1/2*rhof.*Vf.^2;
Lf=qf.*Clf.*S/m;
Df=qf.*Cdf.*S/m;
gf=mu./(Re+hf).^2;

thetaf=-11/57.3;
dh_dv1=-V1*sin(theta1)/(D1+g1*sin(theta1));
dh_dvf=-Vf*sin(thetaf)/(Df+gf*sin(thetaf));

A=[V1^4,V1^3,V1^2,V1,1;Vm^4,Vm^3,Vm^2,Vm,1;Vf^4,Vf^3,Vf^2,Vf,1;4*V1^3,3*V1^2,2*V1,1,0;4*Vf^3,3*Vf^2,2*Vf,1,0];
B=[h1;hm;hf;dh_dv1;dh_dvf];
k=A\B;



V_hua=[V1,7728:-1:1000];
hv_hua=k(1)*V_hua.^4+k(2)*V_hua.^3+k(3)*V_hua.^2+k(4)*V_hua+k(5);
dhv_hua=4*k(1)*V_hua.^3+3*k(2)*V_hua.^2+2*k(3)*V_hua+k(4);
d2hv_hua=12*k(1)*V_hua.^2+6*k(2)*V_hua+2*k(3);

alpha_hua=(alpha0.*(V_hua>v1)+((V_hua-v1)*(alphaf-alpha0)/(v2-v1)+alpha0).*(V_hua<=v1&V_hua>=v2)+alphaf.*(V_hua<v2));
Cl_hua=exp(cl2*V_hua)+cl1*alpha_hua+cl0;
Cd_hua=exp(cd2*V_hua)+cd1*alpha_hua.^2+cd0;


rho_hua=rho0.*exp(-hv_hua./hs);
q_hua=1/2*rho_hua.*V_hua.^2;
L_hua=q_hua.*Cl_hua.*S/m;
D_hua=q_hua.*Cd_hua.*S/m;
g_hua=mu./(Re+hv_hua).^2;


theta_hua=asin(-dhv_hua.*D_hua./(dhv_hua+V_hua));
R_go=cumtrapz(V_hua,dhv_hua.*cot(theta_hua));

D_vhua=-D_hua./hs.*dhv_hua+2*D_hua./V_hua+D_hua.*cd2.*exp(cd2.*V_hua)./Cd_hua;
dthetadt=(-d2hv_hua.*(D_hua+g_hua.*sin(theta_hua)).^2-sin(theta_hua).*(D_hua+g_hua.*sin(theta_hua))+V_hua.*sin(theta_hua).*(D_vhua-2*mu./(Re+hv_hua).^3.*sin(theta_hua).*dhv_hua))./(-g_hua.*cos(theta_hua)./(D_hua+g_hua.*sin(theta_hua))-V_hua.*cos(theta_hua));
nu=acos((dthetadt-V_hua.*cos(theta_hua)./(Re+hv_hua)+g_hua.*cos(theta_hua)./V_hua).*V_hua./L_hua);

bz.V=[yy(:,4);V_hua(2:end)'];
bz.nu=[25*180/pi*ones(length(yy(:,4))-1,1);nu'];
bz.theta=[yy(:,5);theta_hua(2:end)'];
bz.r=[yy(:,1);(hv_hua(2:end)+Re)'];
bz.R=[yy(:,7);(R_go(2:end)+yy(end,7))'];
% Vdot_hua=-D_hua-g_hua.*sin(theta_hua);
% hdot_hua=V_hua.*sin(theta_hua);
% dthetadt1=(d2hv_hua-sin(theta_hua)./Vdot_hua-hdot_hua./Vdot_hua.^2.*D_vhua)./(V_hua.*cos(theta_hua)./Vdot_hua.^2+g_hua.*hdot_hua.*cos(theta_hua)./Vdot_hua.^3);
% cosnu1=(dthetadt1-V_hua.*cos(theta_hua)./(Re+hv_hua)+g_hua.*cos(theta_hua)./V_hua).*V_hua./L_hua;
