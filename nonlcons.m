function [c,ceq]=nonlcons(x)
constant;
k=evalin('base','k');
N=k+1;
state=x(1:6*N);
control=x(6*N+1:6*N+2*k);
t0=x(6*N+2*k+1);
tf=x(6*N+2*k+2);
state1=reshape(state,N,6);
stru.state=state1(1:k,:);
stru.control=reshape(control,k,2);
stru.time=[t0 tf];

u=stru.control;
xx=stru.state;
alpha=u(:,1);
sigma=u(:,2);
h=xx(:,1);
V=xx(:,4);
Cl=a0+a1*alpha;
Cd=b0+b1*alpha+b2*alpha.^2;
rho=rho0.*exp(-h./hs);
q=1/2*rho.*V.^2;
L=q.*Cl.*S;
D=q.*Cd.*S;
g=mumu./(Re+h).^2;

Qdot=(c0+c1.*u(:,1)+c2.*u(:,1).^2+c3*u(:,1).^3).*17700.*sqrt(rho).*(0.0001*V).^3.07;
n=sqrt(L.^2+D.^2)./m./g;

c=[Qdot-79500;n-2.5;q-13400];

ceq=[state1(1,1)-79248;state1(end,1)-24384;state1(1,3);state1(1,2);state1(1,4)-6492;state1(end,4)-762;state1(1,5)+1.5/57.3;state1(end,5)+10/57.3;state1(1,6)];

end