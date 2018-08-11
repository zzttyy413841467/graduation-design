function [c,ceq]=flight_sim_con(u)
yy=evalin('base','yy');

Vf=yy(end,4);
phif=yy(end,3);
thetaf=yy(end,2);



% alpha0=evalin('base','alpha0');
% alphaf=evalin('base','alphaf');
% v1=evalin('base','v1');
% v2=evalin('base','v2');
% % alpha=u(:,1);
% % sigma=u(:,2);
% h=yy(:,1);
% V=yy(:,4);
% alpha=alpha0.*(V>v1)+((V-v1)*(alphaf-alpha0)/(v2-v1)+alpha0).*(V<=v1&V>=v2)+alphaf.*(V<v2);
% 
% 
% Cl=a0+a1*alpha;
% Cd=b0+b1*alpha+b2*alpha.^2;
% rho=rho0.*exp(-h./hs);
% q=1/2*rho.*V.^2;
% L=q.*Cl.*S;
% D=q.*Cd.*S;
% g=mumu./(Re+h).^2;
% 
% Qdot=(c0+c1.*alpha+c2.*alpha.^2+c3*alpha.^3).*17700.*sqrt(rho).*(0.0001*V).^3.07;
% n=sqrt(L.^2+D.^2)./m./g;


ceq=[Vf-1000;phif-38/57.3;thetaf-260/57.3];
% c=[q-13400;Qdot-795000;n-2.5];
c=[];
end