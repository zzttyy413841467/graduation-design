%输入参数
traj2_sim_init;
%运行simulink模型
opt = simset('SrcWorkspace','Current');
[tout,xout,outp] = sim('untitled',[0 100000],opt);
%作图
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
xlabel('速度（m/s）');
ylabel('阻力加速度（m/s^{2}）');
axis([750,7800,0,15]);
set(gca,'xdir','reverse');
grid on;
figure(2)
plot(V_LD,nu,'r');
xlabel('速度（m/s）');
ylabel('倾侧角（°）');
set(gca,'xdir','reverse');
grid on;
figure(3);
plot(lambda,phi,'r');
xlabel('经度（°）');
ylabel('纬度（°）');
grid on;
figure(4)
plot(t,V_LD,'r');
ylabel('速度（m/s）');
xlabel('时间（s）');
grid on;
figure(5)
plot(t,theta,'r');
ylabel('弹道倾角（°）');
xlabel('时间（s）');
grid on;
figure(6)
plot(t,sigma,'r');
ylabel('弹道偏角（°）');
xlabel('时间（s）');
grid on;
figure(7)
plot(t,h,'r');
xlabel('时间（s）');
ylabel('高度（m）');
grid on;
figure(8)
plot(t,R,'r');
xlabel('时间（s）');
ylabel('射程（m）');
grid on;
