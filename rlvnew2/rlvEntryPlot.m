%------------------------------%
% Extract Solution from Output %
auxdata.Re = 6371393;              % Equatorial Radius of Earth (m)
auxdata.S  = 0.113;                % Vehicle Reference Area (m^2)
% auxdata.S  = 0.484; 
auxdata.cl(1) = -0.998;                  % Parameters for lift coefficient
auxdata.cl(2) = 0.07412*57.3;
auxdata.cl(3) = 0.0017/340;
auxdata.cd(1) = -0.03795;       
auxdata.cd(2) = 0.001944*57.3^2; 
auxdata.cd(3) = -0.05119/340; 
% auxdata.cl(1) = -0.2317;                  % Parameters for liftcoefficient 
% auxdata.cl(2) = 0.0513*57.3; 
% auxdata.cl(3) = 0.2945;
% auxdata.cl(4) = -0.1028/340; 
% auxdata.cd(1) = 0.024; 
% auxdata.cd(2) =7.24e-4*57.3^2; 
% auxdata.cd(3) = 0.406; 
% auxdata.cd(4) = -0.323/340;

auxdata.H     = 7320;              % Density Scale Height (m)
auxdata.rho0  = 1.225;% Sea Level Atmospheric Density (slug/ft^3)
auxdata.mu    = auxdata.Re^2*9.81;     % Earth Gravitational Parameter (ft^^3/s^2) 
auxdata.mass  = 498.95; 
% auxdata.mass  = 907.2; 

solution = output.result.solution;
time = solution.phase(1).time;
altitude  = (solution.phase(1).state(:,1)-auxdata.Re)/1000;
longitude = solution.phase(1).state(:,2)*180/pi;
latitude  = solution.phase(1).state(:,3)*180/pi;
speed     = solution.phase(1).state(:,4)/1000;
fpa       = solution.phase(1).state(:,5)*180/pi;
azimuth   = solution.phase(1).state(:,6)*180/pi;
RR=solution.phase(1).state(:,8);
% aoa       = solution.phase(1).control(:,1)*180/pi;
% bank      = solution.phase(1).control(:,2)*180/pi;

bank      = solution.phase(1).state(:,7)*180/pi;
alpha0=20/57.3;
alphaf=10/57.3;
v1=6.5;
v2=5;
aoa=57.3*(alpha0.*(speed>v1)+((speed-v1)*(alphaf-alpha0)/(v2-v1)+alpha0).*(speed<=v1&speed>=v2)+alphaf.*(speed<v2));

% Cl = auxdata.cl(3)*exp(auxdata.cl(4)*speed*1000)+auxdata.cl(2)*aoa/57.3+auxdata.cl(1);
% Cd = auxdata.cd(3)*exp(auxdata.cd(4)*speed*1000)+auxdata.cd(2)*(aoa/57.3).^2+auxdata.cd(1);

Cl = exp(auxdata.cl(3)*speed*1000)+auxdata.cl(2)*aoa/57.3+auxdata.cl(1);
Cd = exp(auxdata.cd(3)*speed*1000)+auxdata.cd(2)*(aoa/57.3).^2+auxdata.cd(1);

q=1/2*auxdata.rho0.*exp(-altitude*1000./auxdata.H).*(speed*1000).^2;
S=auxdata.S;
m=auxdata.mass;
g=auxdata.mu./solution.phase(1).state(:,1).^2;
speeddot=-q.*Cd.*S./m-g.*sin(solution.phase(1).state(:,5));
qqq=q.*Cd.*S./m;
ggg=g.*sin(solution.phase(1).state(:,5));
qdot=1e-7*sqrt(auxdata.rho0.*exp(-altitude*1000./auxdata.H)).*(speed*1000).^3.15;
n=sqrt((q.*Cl.*S./m).^2+(q.*Cd.*S./m).^2)./g;

%---------------%
% Plot Solution %
%---------------%
figure(1)
hold on
pp = plot(time,altitude,'-');
xl = xlabel('时间/s');
yl = ylabel('高度/km');
% title('高度时间曲线');
set(xl,'FontSize',10);
set(yl,'FontSize',10);
% set(gca,'FontSize',16);
% set(pp,'LineWidth',1.25);
grid on
% print -depsc2 rlvAltitude.eps
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 高度时间曲线


figure(2)
plot(longitude,latitude,'-');
xl = xlabel('经度/deg');
yl = ylabel('纬度/deg');
set(xl,'FontSize',10);
set(yl,'FontSize',10);
% set(gca,'FontSize',16);
% set(pp,'LineWidth',1.25);
grid on
% title('地面轨迹');
% print -depsc2 rlvLonLat.eps
% print -dpng rlvLonLat.png
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 地面轨迹

figure(3)
plot(time,1000*speed,'-');
xl = xlabel('时间/s');
yl = ylabel('速度/(m/s)');
set(xl,'FontSize',10);
set(yl,'FontSize',10);
% set(gca,'FontSize',16);
% set(pp,'LineWidth',1.25);
grid on
% title('速度时间曲线');
% print -depsc2 lvSpeed.eps
% print -dpng rlvSpeed.png
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 速度时间曲线

figure(4)
plot(time,fpa,'-');
yl = xlabel('时间/s');
xl = ylabel('弹道倾角/deg');
set(xl,'FontSize',10);
set(yl,'FontSize',10);
% set(gca,'FontSize',16);
% set(pp,'LineWidth',1.25);
grid on
% title('弹道倾角时间曲线');
% print -depsc2 rlvFlightPathAngle.eps
% print -dpng rlvFlightPathAngle.png
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 弹道倾角时间曲线

figure(5)
plot(time,azimuth,'-');
yl = xlabel('时间/s');
xl = ylabel('弹道偏角/deg');
set(xl,'FontSize',10);
set(yl,'FontSize',10);
% set(gca,'FontSize',16);
% set(pp,'LineWidth',1.25);
grid on
% title('方向角时间曲线');
% print -depsc2 rlvAzimuthAngle.eps
% print -dpng rlvAzimuthAngle.png
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 弹道偏角时间曲线

figure(6)
plot(time,aoa,'-');
yl = xlabel('时间/s');
xl = ylabel('攻角/deg');
set(xl,'FontSize',10);
set(yl,'FontSize',10);
% set(gca,'FontSize',16);
% set(pp,'LineWidth',1.25);
ylim([5 25])
grid on
% title('攻角时间曲线');
% print -depsc2 rlvAngleofAttack.eps
% print -dpng rlvAngleofAttack.png
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 攻角时间曲线

figure(7)
plot(time,bank,'-');
yl = xlabel('时间/s');
xl = ylabel('倾侧角幅值/deg');
set(xl,'FontSize',10);
set(yl,'FontSize',10);
% set(gca,'FontSize',16);
% set(pp,'LineWidth',1.25);
grid on
% title('倾侧角时间曲线');
% print -depsc2 rlvBankAngle.eps
% print -dpng rlvBankAngle.png
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 倾侧角幅值时间曲线

% for i=1:length(output.meshhistory)
%   mesh(i).cumfraction = [0 cumsum(output.meshhistory(i).phase.fraction)];
%   mesh(i).sizecumfraction = i*ones(size(mesh(i).cumfraction));
% end
% marks = {'bd','gs','r^','cv','mo','kh'};
% figure(8);
% pp = plot(mesh(1).cumfraction,mesh(1).sizecumfraction,marks{1},mesh(2).cumfraction,mesh(2).sizecumfraction,marks{2},mesh(3).cumfraction,mesh(3).sizecumfraction,marks{3});
% yl = xlabel('Location of Mesh Points (Percent)');
% xl = ylabel('Mesh Refinement Iteration Number');
% set(xl,'FontSize',18);
% set(yl,'FontSize',18);
% set(gca,'FontSize',16);
% set(gca,'YTick',0:1:length(output.meshhistory));
% axis([0 1 0 3]);
% grid on
% print -depsc2 rlvMeshHistory.png
% print -dpng rlvMeshHistory.png


figure(8)
plot(time,n);
nmax=4*ones(length(time),1);
hold on
plot(time,nmax,'--');
xl=xlabel('时间/s');
yl=ylabel('过载/g');
set(xl,'FontSize',10);
set(yl,'FontSize',10);
% legend({'n','n_{max}'},'FontSize',10);
ylim([0 5]);
grid on
% title('过载时间曲线');
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 过载时间曲线

figure(9)
plot(time,q);
qmax=1.2e5*ones(length(time),1);
hold on
plot(time,qmax,'--');
xl=xlabel('时间/s');
yl=ylabel('动压/pa');
set(xl,'FontSize',10);
set(yl,'FontSize',10);
% legend({'q','q_{max}'},'FontSize',6)
ylim([0 1.5e5]);
% title('动压时间曲线');
grid on
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 动压时间曲线


figure(10)
plot(time,qdot);
qdotmax=4000*ones(length(time),1);
hold on
plot(time,qdotmax,'--');
xl=xlabel('时间/s');
yl=ylabel('热流密度/(kW/m^{2})');
set(xl,'FontSize',10);
set(yl,'FontSize',10);
% legend('qdot','qdot_{max}')
grid on
ylim([0 5e3]);
% title('热流密度时间曲线');
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 热流密度时间曲线


% figure(11)
% plot(speed*1000,altitude*1000);
% ylim([0 1e5]);
% hold on
% hqdot=2*auxdata.H.*log(sqrt(1.225).*(speed*1000).^3.15/1e7/4000);
% plot(speed*1000,hqdot);
% hold on;
% hq=auxdata.H*log(1.225*(speed*1000).^2/2/1.2e5);
% plot(speed*1000,hq);
% hold on;
% hn=auxdata.H*log(1.225*S*(speed*1000).^2.*sqrt(Cl.^2+Cd.^2)./2/4/m/9.8);
% plot(speed*1000,hn);
% % hb=zeros(1366,1);
% % for ii=1:1366
% %     
% %     f=@(x)1/2*1.225*exp(-x/auxdata.H).*(speed(ii)*1000).^2.*Cl(ii).*S.*cos(bank(ii)/57.3)-g(ii)+((speed(ii)*1000).^2./(auxdata.Re+x));
% %     hb(ii)`fsolve(f,20000);
% % end
% hold on;
% f=@(x)1/2*1.225*exp(-x/auxdata.H).*(speed*1000).^2.*Cl.*S./m-g+((speed*1000).^2./(auxdata.Re+x));
% hb=fsolve(f,zeros(length(speed),1));
% f1=f(hb);
% plot(speed*1000,hb);
% title('高度速度再入走廊');

figure(12)
plot3(longitude,latitude,altitude);
% ylim([-10 10]);
% xlim([-10 10]);
grid on
% title('弹道');
xlabel('经度/deg');
ylabel('纬度/deg');
zlabel('高度/km');
view(28.9,19.6)