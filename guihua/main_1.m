clear
tspan=0:0.1:1000;
V0=7900;
r0=100000+6371393;
theta0=0;
phi0=0;
gamma0=-2*pi/180;
psi0=40*pi/180;
y0=[r0;theta0;phi0;V0;gamma0;psi0;0];
options=odeset('events',@stop_conditions);
[tt yy]=ode45(@dydt,tspan,y0,options);
plot(yy(:,4),yy(:,1)-6371393);
bianjie1;


