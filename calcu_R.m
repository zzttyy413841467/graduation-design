function R_togo=calcu_R(lambda,phi)
lambdaf=72.5/180*pi;
phif=0/180*pi;

Re = 6371393; 
R_togo=Re*acos(sin(phif)*sin(phi)+cos(phif)*cos(phi)*cos(lambdaf-lambda));

end