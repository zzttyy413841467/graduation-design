constant_sim;
n=1000;
r_0=Re+100000+unifrnd(-5000,5000,n,1);
V_0=normrnd(7900,25,n,1);
theta_0=normrnd(-2/180*pi,0.16/180*pi,n,1);
rho_0=normrnd(1.225,1.225*0.03,n,1);
delta_l0=normrnd(0,0.03,n,1);
delta_d0=normrnd(0,0.03,n,1);

clear delta

clear delta_sm
delta=zeros(6,n);
delta_sm=zeros(6,n);

kk=0;
for ii=1:n
    r0=r_0(ii);
    V0=V_0(ii);
    lon0=0;
    lat0=0;
    fpa0=theta_0(ii);
    azi0=90/180*pi;
    rho0=rho_0(ii);
    delta_l=delta_l0(ii);
    delta_d=delta_d0(ii);
    kk=kk+1;    fprintf('%d',kk);
    try
        sim('slidemodecontrol',[0 2000]);
    catch
        continue;
    end
    delta(1,ii)=yout(end,4)-solution.phase.state(end,4);
    delta(2,ii)=yout(end,1)-solution.phase.state(end,1);
    delta(3,ii)=(yout(end,5)-solution.phase.state(end,5))*180/pi;
    delta(4,ii)=(yout(end,2)-72.5/180*pi)*180/pi;
    delta(5,ii)=(yout(end,3)-0)*180/pi;
    delta(6,ii)=calcu_R(yout(end,2),yout(end,3));
end
jj=1;
for ii=1:n
    if(delta(1,ii)~=0)
        delta_sm(:,jj)=delta(:,ii);
        jj=jj+1;
    end
end

