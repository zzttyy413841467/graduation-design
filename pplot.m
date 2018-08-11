constant_sim;

r0=Re+102000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('slidemodecontrol',[0 2000]);

figure(1);
% subplot(3,3,1);
plot(tout,(yout(:,1)-Re));
hold on;
plot(time,solution.phase.state(:,1)-Re,'--');
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
hold on;
plot(solution.phase.state(:,4),solution.phase.state(:,1)-Re,'--')
hold on;
xlabel('V/(m/s)');
ylabel('h/km');
legend('¸ú×Ù¹ì¼£','±ê×¼¹ì¼£');
grid on

figure(10);
plot(tout,57.3*yout(:,8));
hold on;
plot(time,aoa,'--');
legend('¸ú×Ù¹ì¼£','±ê×¼¹ì¼£');
% figure(5);
% plot(tout,57.3*yout(:,9));
% hold on;
% plot(time,57.3*solution.phase.state(:,7));
% 
figure(5);
plot(57.3*yout(:,2),57.3*yout(:,3));
hold on;
xlabel('¾­¶È/degree');
ylabel('Î³¶È/degree');
grid on
plot(57.3*solution.phase.state(:,2),57.3*solution.phase.state(:,3),'--');
% 
% figure(7);
% plot(tout,57.3*yout(:,6));
% hold on;
% plot(time,57.3*solution.phase.state(:,6));


% figure(6);
% plot3(57.3*yout(:,2),57.3*yout(:,3),yout(:,1)-Re);
% hold on;
% xlabel('¾­¶È/degree');
% ylabel('Î³¶È/degree');
% zlabel('¸ß¶È/m')
% grid on