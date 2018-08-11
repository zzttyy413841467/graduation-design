% function [A,B,K]=calcu_A_B
% clear;
constant_sim;


load('s16.mat');
solution = output.result.solution;
time = solution.phase(1).time;
r  = solution.phase(1).state(:,1);
% longitude = solution.phase(1).state(:,2);
% latitude  = solution.phase(1).state(:,3);
V = solution.phase(1).state(:,4);
theta  = solution.phase(1).state(:,5);
% azimuth   = solution.phase(1).state(:,6);
bank  = solution.phase(1).state(:,7);
alpha0=20/57.3;
alphaf=10/57.3;
v1=6500;
v2=5000;
alpha=alpha0.*(V>v1)+((V-v1)*(alphaf-alpha0)/(v2-v1)+alpha0).*(V<=v1&V>=v2)+alphaf.*(V<v2);
Cl=exp(cl2*V)+cl1*alpha+cl0;
Cd=exp(cd2*V)+cd1*alpha.^2+cd0;
rho=rho0.*exp(-(r-Re)./hs);
q=1/2*rho.*V.^2;
L=q.*Cl.*S;
D=q.*Cd.*S;
g=mu./r.^2;

g_r=-2*mu./r.^3;
rho_r=-rho./hs;
Cd_alpha=2*cd1.*alpha;
Cd_V=cd2.*exp(cd2*V);
Cl_alpha=cl1;
Cl_V=cl2.*exp(cl2*V);
D_V=2*D./V+D.*Cd_V./Cd;
D_r=D.*rho_r./rho;
L_V=2*L./V+L.*Cl_V./Cl;
L_r=L.*rho_r./rho;
D_alpha=D.*Cd_alpha./Cd;
L_alpha=L.*Cl_alpha./Cl;

A11=(D_V.*V-D-m.*g.*sin(theta))./(m.*V.^2.*cos(theta));
A12=(D.*sin(theta)+m*g)./(m.*V.*(cos(theta)).^2);
A13=D_r./(m.*V.*cos(theta))+g_r.*tan(theta)./V;
A21=(2*L-L_V.*V).*cos(bank)./(m.*V.^3.*cos(theta))-2*g./V.^3;
A22=-L.*cos(bank).*sin(theta)./(m.*V.^2.*(cos(theta)).^2);
A23=-L_r.*cos(bank)./(m.*V.^2.*cos(theta))+g_r./V.^2+1./r.^2;
A31=zeros(length(time),1);
A32=-1./(cos(theta)).^2;
A33=zeros(length(time),1);
B11=D_alpha./(m.*V.*cos(theta));
B12=zeros(length(time),1);
B21=-L_alpha.*cos(bank)./(m.*V.^2.*cos(theta));
B22=L.*sin(bank)./(m.*V.^2.*cos(theta));
B31=zeros(length(time),1);
B32=zeros(length(time),1);

Q=[1 0 0;0 3e2^2/0.02^2 0;0 0 3e2^2/2e3^2];
R=[3e2^2/0.1^2 0;0 3e2^2/0.1^2];
% Q=[1 0 0;0 1 0;0 0 1];
% R=[1 0;0 1];


A=zeros(3,3,length(time));
B=zeros(3,2,length(time));
for ii=1:length(time)
    A(1,1,:)=A11;
    A(1,2,:)=A12;
    A(1,3,:)=A13;
    A(2,1,:)=A21;
    A(2,2,:)=A22;
    A(2,3,:)=A23;
    A(3,1,:)=A31;
    A(3,2,:)=A32;
    A(3,3,:)=A33;
    
    B(1,1,:)=B11;
    B(1,2,:)=B12;
    B(2,1,:)=B21;
    B(2,2,:)=B22;
    B(3,1,:)=B31;
    B(3,2,:)=B32;
end
 K=zeros(2,3,length(time));
 P=zeros(3,3,length(time));
 pdot=zeros(3,3,length(time));
for ii=1:length(time)
   [K1,P1,r]=lqr(-A(:,:,ii),-B(:,:,ii),Q,R);
   K(:,:,ii)=K1;
   P(:,:,ii)=P1;
   pdot(:,:,ii)=P(:,:,ii)*A(:,:,ii)+A(:,:,ii).'*P(:,:,ii)-P(:,:,ii)*B(:,:,ii)*inv(R)*B(:,:,ii).'*P(:,:,ii)+Q;
end
K1=reshape(K(1,:,:),3,length(time)).';
K2=reshape(K(2,:,:),3,length(time)).';



