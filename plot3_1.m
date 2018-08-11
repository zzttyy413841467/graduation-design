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

figure(6);
plot3(57.3*yout(:,2),57.3*yout(:,3),yout(:,1)-Re);
hold on;
xlabel('����/degree');
ylabel('γ��/degree');
zlabel('�߶�/m')
grid on


r0=Re+100000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('feedbackcontrol',[0 2000]);
figure(1);
% subplot(3,3,2);
plot(tout,(yout(:,1)-Re)/1000,'-.');
legend('���Ŷ�','�����ܶȴ�������Ŷ�');
title('�߶�ʱ������');
figure(2);
% subplot(3,3,2);
plot(tout,yout(:,4),'-.');
legend('���Ŷ�','�����ܶȴ�������Ŷ�');
title('�ٶ�ʱ������');
figure(3);
% subplot(3,3,2);
title('�������ʱ������');
plot(tout,57.3*yout(:,5),'-.');
legend('���Ŷ�','�����ܶȴ�������Ŷ�');
figure(4);
% subplot(3,3,2);
title('�߶��ٶ�����');
plot(yout(:,4),(yout(:,1)-Re)/1000,'-.');
legend('���Ŷ�','�����ܶȴ�������Ŷ�');
figure(5);

plot(57.3*yout(:,2),57.3*yout(:,3),'-.');
legend('���Ŷ�','�����ܶȴ�������Ŷ�');
title('����켣');
figure(6);
title('����');
plot3(57.3*yout(:,2),57.3*yout(:,3),yout(:,1)-Re,'-.');
legend('���Ŷ�','�����ܶȴ�������Ŷ�');