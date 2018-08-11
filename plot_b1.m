constant_sim;

r0=Re+100000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=90*pi/180;
sim('lqrcontrol',[0 2000]);

% delta(1,1)=yout(end,4)-solution.phase.state(end,4);
% delta(2,1)=yout(end,1)-solution.phase.state(end,1);
% delta(3,1)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,1)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,1)=(yout(end,3)-solution.phase.state(end,3))*180/pi;

delta(1,1)=yout(end,4)-solution.phase.state(end,4);
delta(2,1)=yout(end,1)-solution.phase.state(end,1);
delta(3,1)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,1)=yout(end,2)*180/pi-72.5;
delta(5,1)=yout(end,3)*180/pi-0*180/pi;
delta(6,1)=calcu_R(yout(end,2),yout(end,3));
figure(1);
% subplot(3,3,1);
plot(tout,(yout(:,1)-Re)/1000,'LineWidth',1.2);
hold on;
plot(time,(solution.phase.state(:,1)-Re)/1000,'--','LineWidth',1.2);
hold on
xl = xlabel('ʱ��/s');
yl = ylabel('�߶�/km');
set(xl,'FontSize',9);
set(yl,'FontSize',9);
legend({'���ٹ켣','��׼�켣'},'FontSize',9);
grid on
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 ���ٹ켣�߶�ʱ������

figure(2);
% subplot(3,3,1);
plot(tout,yout(:,4),'LineWidth',1.2);
hold on;
plot(time,solution.phase.state(:,4),'--','LineWidth',1.2);
hold on
xl = xlabel('ʱ��/s');
yl = ylabel('�ٶ�/(m/s)');
legend({'���ٹ켣','��׼�켣'},'FontSize',9,'Location','Southwest');
grid on
set(xl,'FontSize',9);
set(yl,'FontSize',9);
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 ���ٹ켣�ٶ�ʱ������



figure(3);
% subplot(3,3,1);
plot(tout,57.3*yout(:,5),'LineWidth',1.2);
hold on;
plot(time,57.3*solution.phase.state(:,5),'--','LineWidth',1.2);
hold on;
xl = xlabel('ʱ��/s');
yl = ylabel('�������/deg');
legend({'���ٹ켣','��׼�켣'},'FontSize',9,'Location','Southwest');
grid on
set(xl,'FontSize',9);
set(yl,'FontSize',9);
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 ���ٹ켣�������ʱ������



figure(4);
plot(yout(:,4),(yout(:,1)-Re)/1000,'LineWidth',1.2);
hold on
plot(solution.phase.state(:,4),(solution.phase.state(:,1)-Re)/1000,'--','LineWidth',1.2)
% hold on;
xl=xlabel('�ٶ�/(m/s)');
yl=ylabel('�߶�/km');
set(xl,'FontSize',9);
set(yl,'FontSize',9);
legend({'���ٹ켣','��׼�켣'},'FontSize',9);
grid on
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 ���ٹ켣�߶��ٶ�


figure(5);
plot(57.3*yout(:,2),57.3*yout(:,3),'LineWidth',1.2);
hold on;
% plot(57.3*solution.phase.state(:,2),57.3*solution.phase.state(:,3),'--','LineWidth',1.2);
xl = xlabel('����/deg');
yl = ylabel('γ��/deg');
set(xl,'FontSize',9);
set(yl,'FontSize',9);
ylim([-10 10])
grid on
% legend({'���ٹ켣','��׼�켣'},'FontSize',9,'Location','Southeast');
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 ���ٹ켣����켣



figure(6)
plot3(57.3*yout(:,2),57.3*yout(:,3),(yout(:,1)-Re)/1000,'LineWidth',1.2);
% hold on;
% plot3(57.3*solution.phase.state(:,2),57.3*solution.phase.state(:,3),(solution.phase.state(:,1)-Re)/1000,'--','LineWidth',1.2);
xl=xlabel('����/deg');
yl=ylabel('γ��/deg');
zl=zlabel('�߶�/km');
ylim([-10 10])
grid on
% legend('���ٹ켣','��׼�켣');
view(28.9,19.6)
print -dtiffn -r600 ���ٹ켣��ά����

figure(7)
plot(tout,57.3*yout(:,8),'LineWidth',1.2);
hold on;
xl = xlabel('ʱ��/s');
yl = ylabel('����/deg');
grid on
set(xl,'FontSize',9);
set(yl,'FontSize',9);
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 ���ٹ켣����ʱ������

figure(8)
plot(tout,57.3*yout(:,9),'LineWidth',1.2);
hold on;
xl = xlabel('ʱ��/s');
yl = ylabel('����/deg');
grid on
set(xl,'FontSize',9);
set(yl,'FontSize',9);
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
print -dtiffn -r600 ���ٹ켣����ʱ������
