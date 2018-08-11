V=(500:50:7900)';
alpha0=30/57.3;
alphaf=10/57.3;
v1=6500;
v2=5000;
aoa=(alpha0.*(V>v1)+((V-v1)*(alphaf-alpha0)/(v2-v1)+alpha0).*(V<=v1&V>=v2)+alphaf.*(V<v2));
auxdata.Re = 6371393;              % Equatorial Radius of Earth (m)
auxdata.S  = 0.113;                % Vehicle Reference Area (m^2)
auxdata.cl(1) = -0.998;                  % Parameters for lift coefficient
auxdata.cl(2) = 0.07412*57.3;
auxdata.cl(3) = 0.0017/340;
auxdata.cd(1) = -0.03795;       
auxdata.cd(2) = 0.001944*57.3^2; 
auxdata.cd(3) = -0.05119/340; 
auxdata.H     = 7320;              % Density Scale Height (m)
auxdata.rho0  = 1.225;% Sea Level Atmospheric Density (slug/ft^3)
auxdata.mu    = auxdata.Re^2*9.81;     % Earth Gravitational Parameter (ft^^3/s^2) 
auxdata.mass  = 498.95; 
Cl = exp(auxdata.cl(3)*V)+auxdata.cl(2)*aoa+auxdata.cl(1);
Cd = exp(auxdata.cd(3)*V)+auxdata.cd(2)*(aoa).^2+auxdata.cd(1);

S=auxdata.S;
m=auxdata.mass;

hqdot=2*auxdata.H.*log(sqrt(1.225).*V.^3.15/1e7/4000);
hq=auxdata.H*log(1.225*V.^2/2/1.2e5);
hn=auxdata.H*log(1.225*S*V.^2.*sqrt(Cl.^2+Cd.^2)./2/4/m/9.8);
f=@(x)1/2*1.225*exp(-x/auxdata.H).*V.^2.*Cl.*S./m-auxdata.mu./(auxdata.Re+x).^2+(V.^2./(auxdata.Re+x));
hb=fsolve(f,zeros(length(V),1));

calcu_hv;

figure;
plot(yy(:,4),yy(:,1)-auxdata.Re,'linewidth', 1.5)
hold on;
plot(V,hqdot,':');
hold on
plot(V,hq,'-.');
hold on
plot(V,hn,'--');
hold on
plot(V,hb);
plot(V_hua,hv_hua,'linewidth', 1.5);

ylim([0 1e5]);
ylabel('高度/m');
xlabel('速度/(m/s)');
% title('最优轨迹高度-速度曲线');
legend({'最优轨迹','热流边界','动压边界','过载边界','平衡滑翔边界'},'Location','NorthWest','FontSize',10);
% print -dtiffn -r600 最优轨迹高度-速度曲线

% figure;
% plot(V,hqdot,':');
% hold on
% plot(V,hq,'-.');
% hold on
% plot(V,hn,'--');
% hold on
% plot(V,hb);
% ylim([0 1e5]);
% ylabel('高度/m');
% xlabel('速度/(m/s)');
% legend({'热流边界','动压边界','过载边界','平衡滑翔边界'},'Location','NorthWest','FontSize',10);
% print -dtiffn -r600 高度-速度再入走廊