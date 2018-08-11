figure(1);
hold on
plot(Ma,C_L(:,1),'d-');
plot(Ma,C_L(:,2),'h-');
plot(Ma,C_L(:,3),'o-');
plot(Ma,C_L(:,4),'p-');
plot(Ma,C_L(:,5),'s-');
plot(Ma,C_L(:,6),'x-');
xl=xlabel('�����Ma');
yl=ylabel('����ϵ��Cl');
grid on
legend('\alpha=0^{\circ}','\alpha=1^{\circ}','\alpha=5^{\circ}','\alpha=10^{\circ}','\alpha=15^{\circ}','\alpha=30^{\circ}')
figure(2);
hold on
plot(Ma,C_D(:,1),'d-');
plot(Ma,C_D(:,2),'h-');
plot(Ma,C_D(:,3),'o-');
plot(Ma,C_D(:,4),'p-');
plot(Ma,C_D(:,5),'s-');
plot(Ma,C_D(:,6),'x-');
xl=xlabel('�����Ma');
yl=ylabel('����ϵ��Cd');
grid on
legend('\alpha=0^{\circ}','\alpha=1^{\circ}','\alpha=5^{\circ}','\alpha=10^{\circ}','\alpha=15^{\circ}','\alpha=30^{\circ}')
figure(3);
surf(X,Y,C_L)
grid on
yl=ylabel('�����Ma');
xl=xlabel('����\alpha/ ^{\circ}');
zl=zlabel('����ϵ��Cl');
figure(4);
surf(X,Y,C_D)
grid on
yl=ylabel('�����Ma');
xl=xlabel('����\alpha/ ^{\circ}');
zl=zlabel('����ϵ��Cd');