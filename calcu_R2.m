function R_togo=calcu_R2(lambda_delta,phi_delta)
lambdaf=48/180*pi;
phif=60/180*pi;
lambda=lambdaf+lambda_delta/180*pi;
phi=phif+phi_delta/180*pi;
Re = 6371393; 
R_togo=Re*acos(sin(phif)*sin(phi)+cos(phif)*cos(phi)*cos(lambdaf-lambda))/1000;

end