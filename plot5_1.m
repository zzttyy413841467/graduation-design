constant_sim;

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
% figure(4);
% plot(tout,57.3*yout(:,8));
% hold on;
% plot(time,aoa);

% figure(5);
% plot(tout,57.3*yout(:,9));
% hold on;
% plot(time,57.3*solution.phase.state(:,7));
% 
% figure(6);
% plot(57.3*yout(:,2),57.3*yout(:,3));
% hold on;
% plot(57.3*solution.phase.state(:,2),57.3*solution.phase.state(:,3));
% 
% figure(7);
% plot(tout,57.3*yout(:,6));
% hold on;
% plot(time,57.3*solution.phase.state(:,6));

figure(6);
plot3(57.3*yout(:,2),57.3*yout(:,3),yout(:,1)-Re);
hold on;
xlabel('����/degree');
ylabel('γ��/degree');
zlabel('�߶�/m')
grid on
% % % % % % % % % % % % % % % % % % % % 

r0=Re+100000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-1.5*pi/180;
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
% 
r0=Re+100000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2.5*pi/180;
azi0=10*pi/180;
sim('feedbackcontrol',[0 2000]);

figure(1);
% subplot(3,3,2);
plot(tout,(yout(:,1)-Re)/1000,'-.');
legend('\theta_{0}=-2\circ','\theta_{0}=-1.5\circ','\theta_{0}=-2.5\circ');
title('�߶�ʱ������');
figure(2);
% subplot(3,3,2);
plot(tout,yout(:,4),'-.');
legend('\theta_{0}=-2\circ','\theta_{0}=-1.5\circ','\theta_{0}=-2.5\circ');
title('�ٶ�ʱ������');
figure(3);
% subplot(3,3,2);
plot(tout,57.3*yout(:,5),'-.');
legend('\theta_{0}=-2\circ','\theta_{0}=-1.5\circ','\theta_{0}=-2.5\circ');
title('�������ʱ������');
figure(4);
% subplot(3,3,2);
plot(yout(:,4),(yout(:,1)-Re)/1000,'-.');
legend('\theta_{0}=-2\circ','\theta_{0}=-1.5\circ','\theta_{0}=-2.5\circ');
title('�߶��ٶ�����');
figure(5);
title('����켣');
plot(57.3*yout(:,2),57.3*yout(:,3),'-.');
legend('\theta_{0}=-2\circ','\theta_{0}=-1.5\circ','\theta_{0}=-2.5\circ');

figure(6);
title('����');
plot3(57.3*yout(:,2),57.3*yout(:,3),yout(:,1)-Re,'-.');
legend('\theta_{0}=-2\circ','\theta_{0}=-1.5\circ','\theta_{0}=-2.5\circ');