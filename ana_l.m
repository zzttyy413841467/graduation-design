% % % 
figure(1);
plot(delta_lqr(1,:),delta_lqr(2,:)/1000,'o')
xl=xlabel('�յ��ٶ�ƫ��/(m/s)');
yl=ylabel('�յ�߶�ƫ��/(km)');
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
print -dtiffn -r600 ���ؿ���߶��ٶ�ƫ��1
figure(2);
plot(delta_lqr(4,:),delta_lqr(5,:),'o')
xl=xlabel('�յ㾭��ƫ��/degree');
yl=ylabel('�յ�γ��ƫ��/degree');
hold on
xlim([-0.8 0.8])
ylim([-0.8 0.8])
grid on
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
phi1=-0.45:0.05:0.45;
lambda1=calcu_c(phi1);
plot(lambda1-72.5,phi1,'r-');
plot(145-lambda1-72.5,phi1,'r-');
set(gcf,'unit','centimeters','position',[10 5 7.8 5.8])
set(xl,'FontSize',10);
set(yl,'FontSize',10);
print -dtiffn -r600 ���ؿ��徭γ��ƫ��1

% % % 
wrong_l=sum(delta_lqr(1,:)<-150|delta_lqr(1,:)>150);%sum(delta_lqr(2,:)<=1000&delta_lqr(2,:)>=-1000)
percent_l=1-wrong_l/len;
