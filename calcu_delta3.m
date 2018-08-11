constant_sim;

clear delta
% 
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
% delta(1,1)=yout(end,4)-solution.phase.state(end,4);
% delta(2,1)=yout(end,1)-solution.phase.state(end,1);
% delta(3,1)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,1)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,1)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,1)=calcu_R(yout(end,2),yout(end,3));
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% r0=Re+106000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
% delta(1,1)=yout(end,4)-solution.phase.state(end,4);
% delta(2,1)=yout(end,1)-solution.phase.state(end,1);
% delta(3,1)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,1)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,1)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,1)=calcu_R(yout(end,2),yout(end,3));
% 
% r0=Re+104000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
% delta(1,2)=yout(end,4)-solution.phase.state(end,4);
% delta(2,2)=yout(end,1)-solution.phase.state(end,1);
% delta(3,2)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,2)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,2)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,2)=calcu_R(yout(end,2),yout(end,3));
% 
% 
% r0=Re+102000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
% delta(1,3)=yout(end,4)-solution.phase.state(end,4);
% delta(2,3)=yout(end,1)-solution.phase.state(end,1);
% delta(3,3)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,3)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,3)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,3)=calcu_R(yout(end,2),yout(end,3));
% 
% r0=Re+98000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
% delta(1,4)=yout(end,4)-solution.phase.state(end,4);
% delta(2,4)=yout(end,1)-solution.phase.state(end,1);
% delta(3,4)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,4)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,4)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,4)=calcu_R(yout(end,2),yout(end,3));
% 
% r0=Re+96100;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
% delta(1,5)=yout(end,4)-solution.phase.state(end,4);
% delta(2,5)=yout(end,1)-solution.phase.state(end,1);
% delta(3,5)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,5)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,5)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,5)=calcu_R(yout(end,2),yout(end,3));
% 
% r0=Re+94100;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
% delta(1,6)=yout(end,4)-solution.phase.state(end,4);
% delta(2,6)=yout(end,1)-solution.phase.state(end,1);
% delta(3,6)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,6)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,6)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,6)=calcu_R(yout(end,2),yout(end,3));


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7980;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
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
% V0=7950;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
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
% V0=7920;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
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
% V0=7880;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
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
% V0=7850;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
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
% V0=7820;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
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
% fpa0=-1.6*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
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
% fpa0=-1.75*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
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
% sim('slidemodecontrol',[0 2000]);
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
% sim('slidemodecontrol',[0 2000]);
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
% fpa0=-2.25*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
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
% fpa0=-2.39*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
% delta(1,6)=yout(end,4)-solution.phase.state(end,4);
% delta(2,6)=yout(end,1)-solution.phase.state(end,1);
% delta(3,6)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,6)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,6)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,6)=calcu_R(yout(end,2),yout(end,3));

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% rho0=1.225*(1+0.099);
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
% delta(1,1)=yout(end,4)-solution.phase.state(end,4);
% delta(2,1)=yout(end,1)-solution.phase.state(end,1);
% delta(3,1)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,1)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,1)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,1)=calcu_R(yout(end,2),yout(end,3));
% 
% rho0=1.225*(1+0.059);
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
% delta(1,2)=yout(end,4)-solution.phase.state(end,4);
% delta(2,2)=yout(end,1)-solution.phase.state(end,1);
% delta(3,2)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,2)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,2)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,2)=calcu_R(yout(end,2),yout(end,3));
% 
% rho0=1.225*(1+0.02);
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
% delta(1,3)=yout(end,4)-solution.phase.state(end,4);
% delta(2,3)=yout(end,1)-solution.phase.state(end,1);
% delta(3,3)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,3)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,3)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,3)=calcu_R(yout(end,2),yout(end,3));
% 
% rho0=1.225*(1-0.02);
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
% delta(1,4)=yout(end,4)-solution.phase.state(end,4);
% delta(2,4)=yout(end,1)-solution.phase.state(end,1);
% delta(3,4)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,4)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,4)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,4)=calcu_R(yout(end,2),yout(end,3));
% 
% rho0=1.225*(1-0.06);
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
% delta(1,5)=yout(end,4)-solution.phase.state(end,4);
% delta(2,5)=yout(end,1)-solution.phase.state(end,1);
% delta(3,5)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,5)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,5)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,5)=calcu_R(yout(end,2),yout(end,3));
% 
% rho0=1.225*(1-0.1);
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
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
% sim('slidemodecontrol',[0 2000]);
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
delta_l=0.05;
r0=Re+100000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('slidemodecontrol',[0 2000]);
delta(1,1)=yout(end,4)-solution.phase.state(end,4);
delta(2,1)=yout(end,1)-solution.phase.state(end,1);
delta(3,1)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,1)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
delta(5,1)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
delta(6,1)=calcu_R(yout(end,2),yout(end,3));
% 
% delta_l=0.04;
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
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
% sim('slidemodecontrol',[0 2000]);
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
% sim('slidemodecontrol',[0 2000]);
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
% sim('slidemodecontrol',[0 2000]);
% delta(1,5)=yout(end,4)-solution.phase.state(end,4);
% delta(2,5)=yout(end,1)-solution.phase.state(end,1);
% delta(3,5)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,5)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,5)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,5)=calcu_R(yout(end,2),yout(end,3));
% 
% delta_l=-0.05;
% r0=Re+100000;
% lon0=0;
% lat0=0;
% V0=7900;
% fpa0=-2*pi/180;
% azi0=10*pi/180;
% sim('slidemodecontrol',[0 2000]);
% delta(1,6)=yout(end,4)-solution.phase.state(end,4);
% delta(2,6)=yout(end,1)-solution.phase.state(end,1);
% delta(3,6)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
% delta(4,6)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
% delta(5,6)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
% delta(6,6)=calcu_R(yout(end,2),yout(end,3));

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

constant_sim;

delta_d=0.08;
r0=Re+100000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('slidemodecontrol',[0 2000]);
delta(1,1)=yout(end,4)-solution.phase.state(end,4);
delta(2,1)=yout(end,1)-solution.phase.state(end,1);
delta(3,1)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,1)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
delta(5,1)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
delta(6,1)=calcu_R(yout(end,2),yout(end,3));


delta_d=0.059;
r0=Re+100000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('slidemodecontrol',[0 2000]);
delta(1,2)=yout(end,4)-solution.phase.state(end,4);
delta(2,2)=yout(end,1)-solution.phase.state(end,1);
delta(3,2)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,2)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
delta(5,2)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
delta(6,2)=calcu_R(yout(end,2),yout(end,3));


delta_d=0.04;
r0=Re+100000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('slidemodecontrol',[0 2000]);
delta(1,3)=yout(end,4)-solution.phase.state(end,4);
delta(2,3)=yout(end,1)-solution.phase.state(end,1);
delta(3,3)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,3)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
delta(5,3)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
delta(6,3)=calcu_R(yout(end,2),yout(end,3));


delta_d=-0.038;
r0=Re+100000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('slidemodecontrol',[0 2000]);
delta(1,4)=yout(end,4)-solution.phase.state(end,4);
delta(2,4)=yout(end,1)-solution.phase.state(end,1);
delta(3,4)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,4)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
delta(5,4)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
delta(6,4)=calcu_R(yout(end,2),yout(end,3));


delta_d=-0.06;
r0=Re+100000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('slidemodecontrol',[0 2000]);
delta(1,5)=yout(end,4)-solution.phase.state(end,4);
delta(2,5)=yout(end,1)-solution.phase.state(end,1);
delta(3,5)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,5)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
delta(5,5)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
delta(6,5)=calcu_R(yout(end,2),yout(end,3));

delta_d=-0.079;
r0=Re+100000;
lon0=0;
lat0=0;
V0=7900;
fpa0=-2*pi/180;
azi0=10*pi/180;
sim('slidemodecontrol',[0 2000]);
delta(1,6)=yout(end,4)-solution.phase.state(end,4);
delta(2,6)=yout(end,1)-solution.phase.state(end,1);
delta(3,6)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
delta(4,6)=(yout(end,2)-solution.phase.state(end,2))*180/pi;
delta(5,6)=(yout(end,3)-solution.phase.state(end,3))*180/pi;
delta(6,6)=calcu_R(yout(end,2),yout(end,3));