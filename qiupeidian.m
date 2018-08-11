clear
m=92079.25;
S=249.9;
a0=-0.20704;
a1=0.029244*57.3;
b0=0.07854;
b1=-0.0061592*57.3;
b2=0.000621048*57.3^2;
c0=1.0672181;
c1=-0.019213774*57.3;
c2=0.00021286289*57.3^2;
c3=-0.0000010117249*57.3^3;
rho0=1.225;
g0=9.81;
Re=6378145;
mumu=g0*Re^2;
hs=7320;
% % % % % % % % % 
% LGR点
k=40;
N=k+1;
% point=eval(vpasolve(Legendre(k)-Legendre(k-1)));
point=GetLGR(k);
tau=[point;1];
syms t;
L=zeros(N);
L_b=zeros(k);
syms L L_b;
% 离散状态变量
for ii=1:N
    prod1=1;
    prod2=1;
    for jj=1:N
        if(jj==ii)
            continue;
        else
            prod1=prod1*vpa((t-tau(jj)));
            prod2=prod2*vpa((tau(ii))-vpa(tau(jj)));
        end
    end
    L(ii)=prod1/prod2;
end
L=vpa(L,4);
D=vpa(diff(L),4);
X1=sym('X1',[1,N]);
X2=sym('X2',[1,N]);
X3=sym('X3',[1,N]);
X4=sym('X4',[1,N]);
X5=sym('X5',[1,N]);
X6=sym('X6',[1,N]);
X{1}=X1;
X{2}=X2;
X{3}=X3;
X{4}=X4;
X{5}=X5;
X{6}=X6;
x=zeros(6,N);
xdot=zeros(6,N);
f=zeros(6,N);
syms x xdot f;
for ii=1:6
    for jj=1:k
        x(ii,jj)=subs(dot(L,X{ii}),t,tau(jj));
        xdot(ii,jj)=subs(dot(D,X{ii}),t,tau(jj));
    end
end
% 离散控制变量
for ii=1:k
    prod1=1;
    prod2=1;
    for jj=1:k
        if(jj==ii)
            continue;
        else
            prod1=prod1*vpa((t-tau(jj)));
            prod2=prod2*vpa((tau(ii))-vpa(tau(jj)));
        end
    end
    L_b(ii)=prod1/prod2;
end
L_b=vpa(L_b,4);
U1=sym('U1',[1,k]);
U2=sym('U2',[1,k]);
U{1}=U1;
U{2}=U2;
u=zeros(2,k);
syms u;
for ii=1:2
    for jj=1:k
        u(ii,jj)=subs(dot(L_b,U{ii}),t,tau(jj));
    end
end
% % % % % % % % 
% q=1/2*rho*x(,ii)^2;
% Cl=a0+a1*alpha;
% Cd=b0+b1*alpha+b2*alpha^2;
% rho=rho0*exp(-(r-Re)/hs);
% g=mu/r^2;

% % % % % % % % 
% 微分方程约束转化为代数方程约束
syms tf t0

for ii=1:k
    f1(ii)=xdot(1,ii)-(tf-t0)/2*(x(4,ii)*sin(x(5,ii)));
    f2(ii)=xdot(2,ii)-(tf-t0)/2*(x(4,ii)*cos(x(5,ii))*sin(x(6,ii))/(x(1,ii)+Re)/cos(x(3,ii)));
    f3(ii)=xdot(3,ii)-(tf-t0)/2*(x(4,ii)*cos(x(5,ii))*cos(x(6,ii))/(x(1,ii)+Re));
    f4(ii)=xdot(4,ii)+(tf-t0)/2*((b0+b1*u(1,ii)+b2*u(1,ii)^2)*(1/2*rho0*exp(-x(1,ii)/hs)*x(4,ii)^2)*S/m+mumu/x(1,ii)^2*sin(x(5,ii)));
    f5(ii)=xdot(5,ii)-(tf-t0)/2*(((a0+a1*u(1,ii))*(1/2*rho0*exp(-x(1,ii)/hs)*x(4,ii)^2)*S*cos(u(2,ii))/m+(x(4,ii)^2/x(1,ii)-mumu/(x(1,ii)+Re)^2)*cos(x(5,ii)))/x(4,ii));
    f6(ii)=xdot(6,ii)-(tf-t0)/2*(((a0+a1*u(1,ii))*(1/2*rho0*exp(-x(1,ii)/hs)*x(4,ii)^2)*S*sin(u(2,ii))/m/cos(x(5,ii))+x(4,ii)^2/(x(1,ii)+Re)*cos(x(5,ii))*sin(x(6,ii))*tan(x(3,ii)))/x(4,ii));
    Qdot(ii)=(c0+c1*u(1,ii)+c2*u(1,ii)^2+c3*u(1,ii)^3)*17700*sqrt(rho0*exp(-x(1,ii)/hs))*(0.0001*x(4,ii))^3.07;
    n(ii)=sqrt(((b0+b1*u(1,ii)+b2*u(1,ii)^2)*(1/2*rho0*exp(-x(1,ii)/hs)*x(4,ii)^2)*S)^2+((a0+a1*u(1,ii))*(1/2*rho0*exp(-x(1,ii)/hs)*x(4,ii)^2)*S)^2)/m/mumu/x(1,ii)^2;
    q(ii)=1/2*rho0*exp(-x(1,ii)/hs)*x(4,ii)^2;
end
y=matlabFunction([(Qdot-795000).';(n-2.5).';(q-13400).'],[f1.';f2.';f3.';f4.';f5.';f6.'],'vars',{[X1,X2,X3,X4,X5,X6,U1,U2,t0,tf]},'File','yueshufuncfinal1','Optimize',false,'Outputs',{'c','ceq'});
