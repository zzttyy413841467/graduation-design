constant_sim;
% % % % % % % % % % % % % % % % % 
rho0=1.225;
r0=Re+100000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('feedbackcontrol',[0 2000]);

figure(1);
% subplot(3,3,1);
plot(tout,(yout(:,1)-Re)/1000);
% hold on;
% plot(time,solution.phase.state(:,1)-Re,'--');
hold on
xlabel('t/s');
ylabel('h/km');
legend('���ٹ켣','��׼�켣');
grid on

figure(2);
% subplot(3,3,1);
plot(tout,yout(:,4));
% hold on;
% plot(time,solution.phase.state(:,4),'--');
hold on
xlabel('t/s');
ylabel('V/(m/s)');
legend('���ٹ켣','��׼�켣');
grid on

figure(3);
% subplot(3,3,1);
plot(tout,57.3*yout(:,5));
% hold on;
% plot(time,57.3*solution.phase.state(:,5),'--');
hold on;
xlabel('t/s');
ylabel('\theta/deg');
legend('���ٹ켣','��׼�켣');
grid on

figure(4);
plot(yout(:,4),(yout(:,1)-Re)/1000);
% hold on;
% plot(solution.phase.state(:,4),solution.phase.state(:,1)-Re,'--')
hold on;
xlabel('V/(m/s)');
ylabel('h/km');
legend('���ٹ켣','��׼�켣');
grid on

figure(5);
plot(57.3*yout(:,2),57.3*yout(:,3));
hold on;
xlabel('����/degree');
ylabel('γ��/degree');
grid on

figure(6);
plot3(57.3*yout(:,2),57.3*yout(:,3),yout(:,1)-Re);
hold on;
xlabel('����/degree');
ylabel('γ��/degree');
zlabel('�߶�/m')
grid on
% % % % % % % % % % % % % % % % % % % % % % % % % % 
rho0=1.225*(1+0.05);
r0=Re+100000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('feedbackcontrol',[0 2000]);
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
rho0=1.225*(1-0.05);
r0=Re+100000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('feedbackcontrol',[0 2000]);
figure(1);
title('�߶�ʱ������');
% subplot(3,3,2);
plot(tout,(yout(:,1)-Re)/1000,'-.');
legend('\rho��ƫ��','\rho+5%','\rho-5%');

figure(2);
title('�ٶ�ʱ������');
% subplot(3,3,2);
plot(tout,yout(:,4),'-.');
legend('\rho��ƫ��','\rho+5%','\rho-5%');

figure(3);
title('�������ʱ������');
% subplot(3,3,2);
plot(tout,57.3*yout(:,5),'-.');
legend('\rho��ƫ��','\rho+5%','\rho-5%');
figure(4);
title('�߶��ٶ�����');
% subplot(3,3,2);
plot(yout(:,4),(yout(:,1)-Re)/1000,'-.');
legend('\rho��ƫ��','\rho+5%','\rho-5%');
figure(5);
title('����켣');
plot(57.3*yout(:,2),57.3*yout(:,3),'-.');
legend('\rho��ƫ��','\rho+5%','\rho-5%');

figure(6);
title('����');
plot3(57.3*yout(:,2),57.3*yout(:,3),yout(:,1)-Re,'-.');
legend('\rho��ƫ��','\rho+5%','\rho-5%');