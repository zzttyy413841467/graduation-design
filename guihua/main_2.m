clear
tspan=0:0.1:2000;
V0=7900;
r0=100000+6371393;
theta0=0;
phi0=0;
gamma0=-2*pi/180;
psi0=40*pi/180;
y0=[r0;theta0;phi0;V0;gamma0;psi0;0];
options=odeset('events',@stop_conditions1);
[tt yy]=ode45(@dydt1,tspan,y0,options);
plot(yy(:,4),yy(:,1)-6371393);
figure;
plot(57.3*yy(:,2),57.3*yy(:,3));
figure;
plot(tt,yy(:,1)-6371393);
figure;
plot(tt,yy(:,4));