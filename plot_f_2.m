constant_sim;

r0=Re+100000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=90/180*pi;
sim('feedbackcontrol',[0 2000]);

figure(1);
plot(yout(:,4),(yout(:,1)-Re)/1000,'k','LineWidth',0.8);
hold on;
xl=xlabel('速度/(m/s)');
yl=ylabel('高度/km');
set(xl,'FontSize',10);
set(yl,'FontSize',10);
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
grid on

figure(2);
plot(57.3*yout(:,2),57.3*yout(:,3),'k','LineWidth',0.8);
hold on;
xl=xlabel('经度/degree');
yl=ylabel('纬度/degree');
set(xl,'FontSize',10);
set(yl,'FontSize',10);
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
grid on

figure(3);
plot3(57.3*yout(:,2),57.3*yout(:,3),(yout(:,1)-Re)/1000,'k','LineWidth',1.2);
hold on;
xlabel('经度/degree');
ylabel('纬度/degree');
zlabel('高度/km')
grid on
view(22,22)

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

r0=Re+100000;
lon0=0;
lat0=0;
V0=8000;
fpa0=-2*pi/180;
azi0=90/180*pi;
sim('feedbackcontrol',[0 2000]);

figure(1);
plot(yout(:,4),(yout(:,1)-Re)/1000,'r--','LineWidth',0.8);
ylim([0 100])
xlim([0 8200])
figure(2);
plot(57.3*yout(:,2),57.3*yout(:,3),'r--','LineWidth',0.8);
ylim([-7.5 12.5])
figure(3);
plot3(57.3*yout(:,2),57.3*yout(:,3),(yout(:,1)-Re)/1000,'r--','LineWidth',1.2);
ylim([-10 10])
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

r0=Re+100000;
lon0=0;
lat0=0;
V0=7810;
fpa0=-2*pi/180;
azi0=90/180*pi;
sim('feedbackcontrol',[0 2000]);

figure(1);
plot(yout(:,4),(yout(:,1)-Re)/1000,'b-.','LineWidth',0.8);
legend({'V_{0}=7900m/s','V_{0}=8000m/s','V_{0}=7800m/s'},'FontSize',9,'Location','NorthWest');
print -dtiffn -r600 比较hv12

figure(2);
plot(57.3*yout(:,2),57.3*yout(:,3),'b-.','LineWidth',0.8);
legend({'V_{0}=7900m/s','V_{0}=8000m/s','V_{0}=7800m/s'},'FontSize',9);
print -dtiffn -r600 比较地轨12

figure(3);
plot3(57.3*yout(:,2),57.3*yout(:,3),(yout(:,1)-Re)/1000,'b-.','LineWidth',1.2);
legend({'V_{0}=7900m/s','V_{0}=8000m/s','V_{0}=7800m/s'});