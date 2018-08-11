%�������
traj2_sim_init;
%����simulinkģ��
opt = simset('SrcWorkspace','Current');
[tout,xout,outp] = sim('untitled',[0 100000],opt);
%��ͼ
V_LD=outp(:,1);
theta=outp(:,2)/pi*180;
sigma=outp(:,3)/pi*180;
phi=outp(:,4)/pi*180;
lambda=outp(:,5)/pi*180;
h=outp(:,6)-Re;
nu=outp(:,7);
D=outp(:,8);
R=outp(:,9);
t=tout;
figure(1);
hold on;
V_D0=750:7800;
jj=1;
for ii=V_D0
    D0(jj)=D_fun(ii);
    jj=jj+1;
end

plot(V_D0,D0,'--')
plot(V_LD,D,'-');
xlabel('�ٶȣ�m/s��');
ylabel('�������ٶȣ�m/s^{2}��');
axis([750,7800,0,15]);
set(gca,'xdir','reverse');
grid on;
figure(2)
plot(V_LD,nu,'r');
xlabel('�ٶȣ�m/s��');
ylabel('���ǣ��㣩');
set(gca,'xdir','reverse');
grid on;
figure(3);
plot(lambda,phi,'r');
xlabel('���ȣ��㣩');
ylabel('γ�ȣ��㣩');
grid on;
figure(4)
plot(t,V_LD,'r');
ylabel('�ٶȣ�m/s��');
xlabel('ʱ�䣨s��');
grid on;
figure(5)
plot(t,theta,'r');
ylabel('������ǣ��㣩');
xlabel('ʱ�䣨s��');
grid on;
figure(6)
plot(t,sigma,'r');
ylabel('����ƫ�ǣ��㣩');
xlabel('ʱ�䣨s��');
grid on;
figure(7)
plot(t,h,'r');
xlabel('ʱ�䣨s��');
ylabel('�߶ȣ�m��');
grid on;
figure(8)
plot(t,R,'r');
xlabel('ʱ�䣨s��');
ylabel('��̣�m��');
grid on;
