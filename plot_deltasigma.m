V=8000:-10:500;
delta_sigma=10*(V>=6000)+20*(V<6000&V>=3000)+(5+(20-5)/(3000-2000)*(V-2000)).*(V<3000&V>=2000)+5*(V<2000);
minusdelta_sigma=-delta_sigma;
plot(V,delta_sigma,'b');
hold on
plot(V,minusdelta_sigma,'b');
ylim([-30 30])
set(gca,'xdir','reverse')
grid on
xlabel('�ٶ�/(m/s)')
ylabel('��������/degree')
