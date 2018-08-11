clear
load('s16.mat')
solution = output.result.solution;
time = solution.phase(1).time;
bank = solution.phase(1).state(:,7);
RR = solution.phase(1).state(:,8);
h= solution.phase(1).state(:,1)-6371393;
plot(time,h);
hold on
tspan=0:0.01:3000;
V0=7900;
r0=100000+6371393;
theta0=0;
phi0=0;
gamma0=-2*pi/180;
psi0=10*pi/180;
y0=[r0;theta0;phi0;V0;gamma0;psi0;0];
options=odeset('events',@stop_conditions);
[tt yy]=ode45(@dydt,tspan,y0,options);
plot(tt,yy(:,1)-6371393);
figure;
plot(tt,yy(:,4));
figure;
plot(tt,57.3*yy(:,5));
figure;
plot(tt,57.3*yy(:,6));
hold on
plot(time,57.3*solution.phase(1).state(:,6));
figure;
plot(57.3*yy(:,2),57.3*yy(:,3));
hold on
plot(57.3*solution.phase(1).state(:,2),57.3*solution.phase(1).state(:,3));

data1=[tt yy(:,3)*180/pi yy(:,2)*180/pi yy(:,1)-6371393];
f1=fopen('data1.e','w');
fprintf(f1,'stk.v.5.0\r\n\r\nBEGIN Ephemeris\r\n\r\nNumberOfEphemerisPoints\t%d\r\n\r\n',length(tt)); 
fprintf(f1,'CentralBody\tEarth\r\n\r\nEphemerisLLATimePos\r\n');
for ii=1:length(tt)
    for jj=1:4
        fprintf(f1,'%f\t',data1(ii,jj));
    end
    fprintf(f1,'\r\n'); 
end
fprintf(f1,'END Ephemeris\r\n');
fclose(f1);