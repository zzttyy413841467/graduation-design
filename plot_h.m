constant_sim;

r0=Re+105000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('slidemodecontrol',[0 2000]);

delta(1,1)=yout(end,4)-solution.phase.state(end,4);
delta(2,1)=yout(end,1)-solution.phase.state(end,1);
delta(3,1)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,1)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
delta(5,1)=(yout(end,3)-solution.phase.state(end,3))*180/pi;

figure(1);
% subplot(3,3,1);
plot(tout,(yout(:,1)-Re)/1000);
hold on;
plot(time,(solution.phase.state(:,1)-Re)/1000,'--');
hold on
xlabel('t/s');
ylabel('h/km');
legend('¸ú×Ù¹ì¼£','±ê×¼¹ì¼£');
grid on

figure(2);
% subplot(3,3,1);
plot(tout,yout(:,4));
hold on;
plot(time,solution.phase.state(:,4),'--');
hold on
xlabel('t/s');
ylabel('V/(m/s)');
 legend('¸ú×Ù¹ì¼£','±ê×¼¹ì¼£');
grid on

figure(3);
% subplot(3,3,1);
plot(tout,57.3*yout(:,5));
hold on;
plot(time,57.3*solution.phase.state(:,5),'--');
hold on;
xlabel('t/s');
ylabel('\theta/deg');
legend('¸ú×Ù¹ì¼£','±ê×¼¹ì¼£');
grid on

figure(4);
plot(yout(:,4),(yout(:,1)-Re));
hold on
plot(solution.phase.state(:,4),solution.phase.state(:,1)-Re,'--')
% hold on;
xlabel('V/(m/s)');
ylabel('h/km');
 legend('¸ú×Ù¹ì¼£','±ê×¼¹ì¼£');
grid on

figure(5);
plot(tout,yout(:,8));
hold on;
plot(time,aoa);

figure(6);
plot(tout,yout(:,9));
hold on;
plot(time,57.3*solution.phase.state(:,7));

figure(7);
plot(57.3*yout(:,2),57.3*yout(:,3));
hold on;
plot(57.3*solution.phase.state(:,2),57.3*solution.phase.state(:,3),'--');
xlabel('¾­¶È/degree');
ylabel('Î³¶È/degree');
grid on
legend('¸ú×Ù¹ì¼£','±ê×¼¹ì¼£');

figure(9);
plot(tout,57.3*yout(:,6));
hold on;
plot(time,57.3*solution.phase.state(:,6),'--');
legend('¸ú×Ù¹ì¼£','±ê×¼¹ì¼£');
grid on

% figure(8)
% plot3(57.3*yout(:,2),57.3*yout(:,3),yout(:,1));
% hold on;
% plot3(57.3*solution.phase.state(:,2),57.3*solution.phase.state(:,3),solution.phase.state(:,1),'--');
% xlabel('¾­¶È/degree');
% ylabel('Î³¶È/degree');
% zlabel('r/m')
% ylim([-10 10]);
% grid on
% legend('¸ú×Ù¹ì¼£','±ê×¼¹ì¼£');