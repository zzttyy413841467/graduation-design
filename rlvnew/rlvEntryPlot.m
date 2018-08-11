%------------------------------%
% Extract Solution from Output %
%------------------------------%
solution = output.result.solution;
time = solution.phase(1).time;
altitude  = (solution.phase(1).state(:,1)-auxdata.Re)/1000;
longitude = solution.phase(1).state(:,2)*180/pi;
latitude  = solution.phase(1).state(:,3)*180/pi;
speed     = solution.phase(1).state(:,4)/1000;
fpa       = solution.phase(1).state(:,5)*180/pi;
azimuth   = solution.phase(1).state(:,6)*180/pi;
% aoa       = solution.phase(1).control(:,1)*180/pi;
% bank      = solution.phase(1).control(:,2)*180/pi;

bank      = solution.phase(1).control(:,1)*180/pi;
alpha0=20/57.3;
alphaf=10/57.3;
v1=5;
v2=3;
aoa=57.3*(alpha0.*(speed>v1)+((speed-v1)*(alphaf-alpha0)/(v2-v1)+alpha0).*(speed<=v1&speed>=v2)+alphaf.*(speed<v2));

Cl = auxdata.cl(3)*exp(auxdata.cl(4)*speed)+auxdata.cl(2)*aoa/57.3+auxdata.cl(1);
Cd = auxdata.cd(3)*exp(auxdata.cd(4)*speed)+auxdata.cd(2)*(aoa/57.3).^2+auxdata.cd(1);
q=1/2*auxdata.rho0.*exp(-altitude*1000./auxdata.H).*(speed*1000).^2;
S=auxdata.S;
m=auxdata.mass;
g=auxdata.mu./solution.phase(1).state(:,1).^2;
aaa=q.*Cl.*S./m-g+(speed*1000).^2./solution.phase(1).state(:,1);




%---------------%
% Plot Solution %
%---------------%
figure(1)
pp = plot(time,altitude,'-', 'markersize', 7, 'linewidth', 1.5);
xl = xlabel('Time (s)');
yl = ylabel('Altitude (km)');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16);
set(pp,'LineWidth',1.25);
grid on
print -depsc2 rlvAltitude.eps
print -dpng rlvAltitude.png

figure(2)
plot(longitude,latitude,'-', 'markersize', 7, 'linewidth', 1.5);
xl = xlabel('Longitude (deg)');
yl = ylabel('Latitude (deg)');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16);
set(pp,'LineWidth',1.25);
grid on
print -depsc2 rlvLonLat.eps
print -dpng rlvLonLat.png

figure(3)
plot(time,speed,'-', 'markersize', 7, 'linewidth', 1.5);
xl = xlabel('Time (s)');
yl = ylabel('Speed (km/s)');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16);
set(pp,'LineWidth',1.25);
grid on
print -depsc2 lvSpeed.eps
print -dpng rlvSpeed.png

figure(4)
plot(time,fpa,'-', 'markersize', 7, 'linewidth', 1.5);
yl = xlabel('Time (s)');
xl = ylabel('Flight Path Angle (deg)');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16);
set(pp,'LineWidth',1.25);
grid on
print -depsc2 rlvFlightPathAngle.eps
print -dpng rlvFlightPathAngle.png

figure(5)
plot(time,azimuth,'-', 'markersize', 7, 'linewidth', 1.5);
yl = xlabel('Time (s)');
xl = ylabel('Azimuth Angle (deg)');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16);
set(pp,'LineWidth',1.25);
grid on
print -depsc2 rlvAzimuthAngle.eps
print -dpng rlvAzimuthAngle.png

figure(6)
plot(time,aoa,'-', 'markersize', 7, 'linewidth', 1.5);
yl = xlabel('Time (s)');
xl = ylabel('Angle of Attack (deg)');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16);
set(pp,'LineWidth',1.25);
grid on
print -depsc2 rlvAngleofAttack.eps
print -dpng rlvAngleofAttack.png

figure(7)
plot(time,bank,'-', 'markersize', 7, 'linewidth', 1.5);
yl = xlabel('Time (s)');
xl = ylabel('Bank Angle (deg)');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16);
set(pp,'LineWidth',1.25);
grid on
print -depsc2 rlvBankAngle.eps
print -dpng rlvBankAngle.png

for i=1:length(output.meshhistory)
  mesh(i).cumfraction = [0 cumsum(output.meshhistory(i).phase.fraction)];
  mesh(i).sizecumfraction = i*ones(size(mesh(i).cumfraction));
end
marks = {'bd','gs','r^','cv','mo','kh'};
figure(8);
pp = plot(mesh(1).cumfraction,mesh(1).sizecumfraction,marks{1},mesh(2).cumfraction,mesh(2).sizecumfraction,marks{2},mesh(3).cumfraction,mesh(3).sizecumfraction,marks{3});
yl = xlabel('Location of Mesh Points (Percent)');
xl = ylabel('Mesh Refinement Iteration Number');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16);
set(gca,'YTick',0:1:length(output.meshhistory));
axis([0 1 0 3]);
grid on
print -depsc2 rlvMeshHistory.png
print -dpng rlvMeshHistory.png

