constant_sim;

r0=Re+100000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('lqrcontrol',[0 2000]);

figure(1);
% subplot(3,3,1);
plot(tout,(yout(:,1)-Re)/1000);
% hold on;
% plot(time,solution.phase.state(:,1)-Re,'--');
hold on
xlabel('t/s');
ylabel('h/km');
% legend('跟踪轨迹','标准轨迹');
grid on

figure(2);
% subplot(3,3,1);
plot(tout,yout(:,4));
% hold on;
% plot(time,solution.phase.state(:,4),'--');
hold on
xlabel('t/s');
ylabel('V/(m/s)');
% legend('跟踪轨迹','标准轨迹');
grid on

figure(3);
% subplot(3,3,1);
plot(tout,57.3*yout(:,5));
% hold on;
% plot(time,57.3*solution.phase.state(:,5),'--');
hold on;
xlabel('t/s');
ylabel('\theta/deg');
% legend('跟踪轨迹','标准轨迹');
grid on

figure(4);
plot(yout(:,4),(yout(:,1)-Re)/1000);
% hold on;
% plot(solution.phase.state(:,4),solution.phase.state(:,1)-Re,'--')
hold on;
xlabel('V/(m/s)');
ylabel('h/km');
% legend('跟踪轨迹','标准轨迹');
grid on

% figure(4);
% plot(tout,57.3*yout(:,8));
% hold on;
% plot(time,aoa);

% figure(5);
% plot(tout,57.3*yout(:,9));
% hold on;
% plot(time,57.3*solution.phase.state(:,7));
% 
figure(5);
plot(57.3*yout(:,2),57.3*yout(:,3));
hold on;
xlabel('经度/degree');
ylabel('纬度/degree');
grid on
% plot(57.3*solution.phase.state(:,2),57.3*solution.phase.state(:,3));
% 
% figure(7);
% plot(tout,57.3*yout(:,6));
% hold on;
% plot(time,57.3*solution.phase.state(:,6));
figure(6);
plot3(57.3*yout(:,2),57.3*yout(:,3),yout(:,1)-Re);
hold on;
xlabel('经度/degree');
ylabel('纬度/degree');
zlabel('高度/m')
grid on

% % % % % % % % % % % % % % % % % % % % 

r0=Re+110000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('lqrcontrol',[0 2000]);

figure(1);
% subplot(3,3,2);
plot(tout,(yout(:,1)-Re)/1000,'--');


figure(2);
% subplot(3,3,2);
plot(tout,yout(:,4),'--');


figure(3);
% subplot(3,3,2);
plot(tout,57.3*yout(:,5),'--');

figure(4);
% subplot(3,3,2);
plot(yout(:,4),(yout(:,1)-Re)/1000,'--');

figure(5);
plot(57.3*yout(:,2),57.3*yout(:,3),'--');

figure(6);
plot3(57.3*yout(:,2),57.3*yout(:,3),yout(:,1)-Re,'--');
% % % % % % % % % % % % % % % % % % % % % % % % 
% 
% 
r0=Re+90000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('lqrcontrol',[0 2000]);


figure(1);
% subplot(3,3,2);
plot(tout,(yout(:,1)-Re)/1000,'-.');
legend('h_{0}=100km','h_{0}=110km','h_{0}=90km');
title('高度时间曲线');
figure(2);
% subplot(3,3,2);
plot(tout,yout(:,4),'-.');
legend('h_{0}=100km','h_{0}=110km','h_{0}=90km');
title('速度时间曲线');
figure(3);
% subplot(3,3,2);
plot(tout,57.3*yout(:,5),'-.');
legend('h_{0}=100km','h_{0}=110km','h_{0}=90km');
title('弹道倾角时间曲线');
figure(4);
% subplot(3,3,2);
plot(yout(:,4),(yout(:,1)-Re)/1000,'-.');
legend('h_{0}=100km','h_{0}=110km','h_{0}=90km');
title('高度速度曲线');
figure(5);
plot(57.3*yout(:,2),57.3*yout(:,3),'-.');
title('地面轨迹');
legend('h_{0}=100km','h_{0}=110km','h_{0}=90km');
figure(6);
plot3(57.3*yout(:,2),57.3*yout(:,3),yout(:,1)-Re,'-.');
legend('h_{0}=100km','h_{0}=110km','h_{0}=90km');
%asin(cos(pi/180*60)*sin(48/180*pi-u(4))/sin(acos(sin(pi/180*60)*sin(u(3))+cos(pi/180*60)*cos(u(3))*cos(48/180*pi-u(4)))))
% asin(sin(48/180*pi-u(4))/sin(acos(cos(48/180*pi-u(4))*cos(60/180*pi-u(3)))))