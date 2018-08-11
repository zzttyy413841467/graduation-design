constant_sim;

clear delta
r0=Re+110000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('lqrcontrol',[0 2000]);
delta(1,1)=yout(end,4)-solution.phase.state(end,4);
delta(2,1)=yout(end,1)-solution.phase.state(end,1);
delta(3,1)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,1)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
delta(5,1)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
delta(6,1)=calcu_R(yout(end,2),yout(end,3));

r0=Re+90000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('lqrcontrol',[0 2000]);
delta(1,2)=yout(end,4)-solution.phase.state(end,4);
delta(2,2)=yout(end,1)-solution.phase.state(end,1);
delta(3,2)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,2)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
delta(5,2)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
delta(6,2)=calcu_R(yout(end,2),yout(end,3));


r0=Re+107500;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('lqrcontrol',[0 2000]);
delta(1,3)=yout(end,4)-solution.phase.state(end,4);
delta(2,3)=yout(end,1)-solution.phase.state(end,1);
delta(3,3)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,3)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
delta(5,3)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
delta(6,3)=calcu_R(yout(end,2),yout(end,3));

r0=Re+92500;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('lqrcontrol',[0 2000]);
delta(1,4)=yout(end,4)-solution.phase.state(end,4);
delta(2,4)=yout(end,1)-solution.phase.state(end,1);
delta(3,4)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,4)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
delta(5,4)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
delta(6,4)=calcu_R(yout(end,2),yout(end,3));

r0=Re+104900;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('lqrcontrol',[0 2000]);
delta(1,5)=yout(end,4)-solution.phase.state(end,4);
delta(2,5)=yout(end,1)-solution.phase.state(end,1);
delta(3,5)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,5)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
delta(5,5)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
delta(6,5)=calcu_R(yout(end,2),yout(end,3));

r0=Re+95000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('lqrcontrol',[0 2000]);
delta(1,6)=yout(end,4)-solution.phase.state(end,4);
delta(2,6)=yout(end,1)-solution.phase.state(end,1);
delta(3,6)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,6)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
delta(5,6)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
delta(6,6)=calcu_R(yout(end,2),yout(end,3));

r0=Re+102500;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('lqrcontrol',[0 2000]);
delta(1,7)=yout(end,4)-solution.phase.state(end,4);
delta(2,7)=yout(end,1)-solution.phase.state(end,1);
delta(3,7)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,7)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
delta(5,7)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
delta(6,7)=calcu_R(yout(end,2),yout(end,3));

r0=Re+97500;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('lqrcontrol',[0 2000]);
delta(1,8)=yout(end,4)-solution.phase.state(end,4);
delta(2,8)=yout(end,1)-solution.phase.state(end,1);
delta(3,8)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,8)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
delta(5,8)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
delta(6,8)=calcu_R(yout(end,2),yout(end,3));

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=8030;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,1)=yout(end,4)-solution.phase.state(end,4);
% delta(2,1)=yout(end,1)-solution.phase.state(end,1);
% delta(3,1)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,1)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,1)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,1)=calcu_R(yout(end,2),yout(end,3));
% 
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=8000;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,2)=yout(end,4)-solution.phase.state(end,4);
% delta(2,2)=yout(end,1)-solution.phase.state(end,1);
% delta(3,2)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,2)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,2)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,2)=calcu_R(yout(end,2),yout(end,3));
% 
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7950;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,3)=yout(end,4)-solution.phase.state(end,4);
% delta(2,3)=yout(end,1)-solution.phase.state(end,1);
% delta(3,3)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,3)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,3)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,3)=calcu_R(yout(end,2),yout(end,3));
% 
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7850;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,4)=yout(end,4)-solution.phase.state(end,4);
% delta(2,4)=yout(end,1)-solution.phase.state(end,1);
% delta(3,4)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,4)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,4)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,4)=calcu_R(yout(end,2),yout(end,3));
% 
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7800;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,5)=yout(end,4)-solution.phase.state(end,4);
% delta(2,5)=yout(end,1)-solution.phase.state(end,1);
% delta(3,5)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,5)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,5)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,5)=calcu_R(yout(end,2),yout(end,3));
% 
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7750;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,6)=yout(end,4)-solution.phase.state(end,4);
% delta(2,6)=yout(end,1)-solution.phase.state(end,1);
% delta(3,6)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,6)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,6)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,6)=calcu_R(yout(end,2),yout(end,3));

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-1.5*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,1)=yout(end,4)-solution.phase.state(end,4);
% delta(2,1)=yout(end,1)-solution.phase.state(end,1);
% delta(3,1)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,1)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,1)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,1)=calcu_R(yout(end,2),yout(end,3));
% 
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-1.7*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,2)=yout(end,4)-solution.phase.state(end,4);
% delta(2,2)=yout(end,1)-solution.phase.state(end,1);
% delta(3,2)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,2)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,2)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,2)=calcu_R(yout(end,2),yout(end,3));
% 
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-1.9*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,3)=yout(end,4)-solution.phase.state(end,4);
% delta(2,3)=yout(end,1)-solution.phase.state(end,1);
% delta(3,3)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,3)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,3)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,3)=calcu_R(yout(end,2),yout(end,3));
% 
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2.1*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,4)=yout(end,4)-solution.phase.state(end,4);
% delta(2,4)=yout(end,1)-solution.phase.state(end,1);
% delta(3,4)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,4)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,4)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,4)=calcu_R(yout(end,2),yout(end,3));
% 
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2.3*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,5)=yout(end,4)-solution.phase.state(end,4);
% delta(2,5)=yout(end,1)-solution.phase.state(end,1);
% delta(3,5)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,5)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,5)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,5)=calcu_R(yout(end,2),yout(end,3));
% 
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2.4*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,6)=yout(end,4)-solution.phase.state(end,4);
% delta(2,6)=yout(end,1)-solution.phase.state(end,1);
% delta(3,6)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,6)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,6)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,6)=calcu_R(yout(end,2),yout(end,3));

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% rho0=1.225*(1+0.25);
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,1)=yout(end,4)-solution.phase.state(end,4);
% delta(2,1)=yout(end,1)-solution.phase.state(end,1);
% delta(3,1)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,1)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,1)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,1)=calcu_R(yout(end,2),yout(end,3));
% 
% rho0=1.225*(1+0.20);
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,2)=yout(end,4)-solution.phase.state(end,4);
% delta(2,2)=yout(end,1)-solution.phase.state(end,1);
% delta(3,2)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,2)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,2)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,2)=calcu_R(yout(end,2),yout(end,3));
% 
% rho0=1.225*(1+0.1);
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,3)=yout(end,4)-solution.phase.state(end,4);
% delta(2,3)=yout(end,1)-solution.phase.state(end,1);
% delta(3,3)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,3)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,3)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,3)=calcu_R(yout(end,2),yout(end,3));
% 
% rho0=1.225*(1-0.1);
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,4)=yout(end,4)-solution.phase.state(end,4);
% delta(2,4)=yout(end,1)-solution.phase.state(end,1);
% delta(3,4)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,4)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,4)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,4)=calcu_R(yout(end,2),yout(end,3));
% 
% rho0=1.225*(1-0.2);
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,5)=yout(end,4)-solution.phase.state(end,4);
% delta(2,5)=yout(end,1)-solution.phase.state(end,1);
% delta(3,5)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,5)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,5)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,5)=calcu_R(yout(end,2),yout(end,3));
% 
% rho0=1.225*(1-0.25);
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,6)=yout(end,4)-solution.phase.state(end,4);
% delta(2,6)=yout(end,1)-solution.phase.state(end,1);
% delta(3,6)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,6)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,6)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,6)=calcu_R(yout(end,2),yout(end,3));
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% constant_sim;
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,9)=yout(end,4)-solution.phase.state(end,4);
% delta(2,9)=yout(end,1)-solution.phase.state(end,1);
% delta(3,9)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,9)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,9)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,9)=calcu_R(yout(end,2),yout(end,3));

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% constant_sim;
% 
% delta_l=0.06;
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,1)=yout(end,4)-solution.phase.state(end,4);
% delta(2,1)=yout(end,1)-solution.phase.state(end,1);
% delta(3,1)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,1)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,1)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,1)=calcu_R(yout(end,2),yout(end,3));
% 
% delta_l=0.04;
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,2)=yout(end,4)-solution.phase.state(end,4);
% delta(2,2)=yout(end,1)-solution.phase.state(end,1);
% delta(3,2)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,2)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,2)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,2)=calcu_R(yout(end,2),yout(end,3));
% 
% delta_l=0.02;
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,3)=yout(end,4)-solution.phase.state(end,4);
% delta(2,3)=yout(end,1)-solution.phase.state(end,1);
% delta(3,3)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,3)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,3)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,3)=calcu_R(yout(end,2),yout(end,3));
% 
% delta_l=-0.02;
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,4)=yout(end,4)-solution.phase.state(end,4);
% delta(2,4)=yout(end,1)-solution.phase.state(end,1);
% delta(3,4)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,4)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,4)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,4)=calcu_R(yout(end,2),yout(end,3));
% 
% delta_l=-0.04;
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,5)=yout(end,4)-solution.phase.state(end,4);
% delta(2,5)=yout(end,1)-solution.phase.state(end,1);
% delta(3,5)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,5)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,5)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,5)=calcu_R(yout(end,2),yout(end,3));
% 
% delta_l=-0.06;
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,6)=yout(end,4)-solution.phase.state(end,4);
% delta(2,6)=yout(end,1)-solution.phase.state(end,1);
% delta(3,6)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,6)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,6)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,6)=calcu_R(yout(end,2),yout(end,3));

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% constant_sim;
% 
% delta_d=0.09;
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,1)=yout(end,4)-solution.phase.state(end,4);
% delta(2,1)=yout(end,1)-solution.phase.state(end,1);
% delta(3,1)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,1)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,1)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,1)=calcu_R(yout(end,2),yout(end,3));
% 
% 
% delta_d=0.06;
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,2)=yout(end,4)-solution.phase.state(end,4);
% delta(2,2)=yout(end,1)-solution.phase.state(end,1);
% delta(3,2)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,2)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,2)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,2)=calcu_R(yout(end,2),yout(end,3));
% 
% 
% delta_d=0.03;
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,3)=yout(end,4)-solution.phase.state(end,4);
% delta(2,3)=yout(end,1)-solution.phase.state(end,1);
% delta(3,3)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,3)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,3)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,3)=calcu_R(yout(end,2),yout(end,3));
% 
% 
% delta_d=-0.03;
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,4)=yout(end,4)-solution.phase.state(end,4);
% delta(2,4)=yout(end,1)-solution.phase.state(end,1);
% delta(3,4)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,4)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,4)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,4)=calcu_R(yout(end,2),yout(end,3));
% 
% 
% delta_d=-0.06;
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,5)=yout(end,4)-solution.phase.state(end,4);
% delta(2,5)=yout(end,1)-solution.phase.state(end,1);
% delta(3,5)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,5)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,5)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,5)=calcu_R(yout(end,2),yout(end,3));
% 
% delta_d=-0.09;
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('lqrcontrol',[0 2000]);
% delta(1,6)=yout(end,4)-solution.phase.state(end,4);
% delta(2,6)=yout(end,1)-solution.phase.state(end,1);
% delta(3,6)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,6)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,6)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,6)=calcu_R(yout(end,2),yout(end,3));