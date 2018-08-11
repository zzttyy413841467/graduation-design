function lambda=calcu_c(phi)
phi=phi/180*pi;
lambdaf=72.5/180*pi;
phif=0/180*pi;
R_togo=50000;
Re = 6371393; 
lambda=180/pi*(lambdaf-acos((cos(R_togo/Re)-sin(phif).*sin(phi))./(cos(phif).*cos(phi))));

end