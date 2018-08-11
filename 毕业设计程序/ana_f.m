% % % 
figure(1);
plot(delta_fb(1,:),delta_fb(2,:)/1000,'o')
xl=xlabel('终点速度偏差/(m/s)');
yl=ylabel('终点高度偏差/(km)');
hold on
V_list=-150:150;
h_list=-1.5:0.1:1.5;
plot(-150*ones(length(h_list),1),h_list,'r-');
plot(150*ones(length(h_list),1),h_list,'r-');
plot(V_list,1.5*ones(length(V_list)),'r-');
plot(V_list,-1.5*ones(length(V_list)),'r-');
xlim([-300 300])
ylim([-2 2])
grid on
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
set(xl,'FontSize',10);
set(yl,'FontSize',10);
print -dtiffn -r600 蒙特卡洛高度速度偏差2
figure(2);
plot(delta_fb(4,:),delta_fb(5,:),'o')
xl=xlabel('终点经度偏差/degree');
yl=ylabel('终点纬度偏差/degree');
hold on
xlim([-0.8 0.8])
ylim([-0.8 0.8])
grid on
phi1=-0.45:0.05:0.45;
lambda1=calcu_c(phi1);
plot(lambda1-72.5,phi1,'r-');
plot(145-lambda1-72.5,phi1,'r-');
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
set(xl,'FontSize',10);
set(yl,'FontSize',10);
print -dtiffn -r600 蒙特卡洛经纬度偏差2



% % % 
wrong_f=sum(delta_fb(1,:)<-150|delta_fb(1,:)>150);%sum(delta_fb(2,:)<=1000&delta_fb(2,:)>=-1000)
percent_f=1-wrong_f/len;
