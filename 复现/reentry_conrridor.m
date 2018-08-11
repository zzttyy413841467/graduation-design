function reentry_conrridor
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
clear;
clc;
g0=9.81;
Re=6378145;
V=linspace(7800,760,100);
mass=20000;
H0=1.2e5;
rho0=1.225;
N=length(V);
a1=-0.2074;
a2=0.029244;
b1=0.06304;
b2=0.6214;
sref=95;
Qmax=1.15e10;
nymax=2.5;
q_max=12000;
alpha=ones(1,N);
for ii=1:N
    alpha(ii)=Alpha_fun(V(ii));
end
CL=a1+a2*alpha;
CD=b1+b2*CL.^2;
DQ=CD.*sref.*Qmax.^2./(2.*mass.*V.^4.3);
Dq=q_max*sref.*CD/mass;
h=H0;
H=ones(1,N);
for ii=1:N
    h=h+400;
    [fh,d_fh]=equli_fh(h,V(ii));
    h1=h-fh/d_fh;
    while (abs(h1-h)>=1e-5)
        h=h1;
        [fh,d_fh]=equli_fh(h,V(ii));
        h1=h-fh/d_fh;
    end
    H(ii)=h1;
    h=h1;
end
g=g0*Re^2./(Re+H).^2;
DE=(CD./CL).*(g-V.^2./(Re+H));
Dn=g*nymax./sqrt(1+(CL./CD).^2);
LD=CL./CD;
hold on
plot(V,DQ,'-');
plot(V,Dn,'--');
plot(V,Dq,'-.');
plot(V,DE,':');
xlabel('速度（m/s）')
ylabel('阻力加速度（m/s^{2}）')
axis([750,7800,0,15]);
set(gca,'xdir','reverse');
grid on


end

