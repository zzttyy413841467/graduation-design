clear;clc;
lb=[0 0 5500 2000];
ub=[30 30 7000 5500];
% options=gaoptimset('Display','iter','Generations',50,'PopulationSize',50);
% [x,val]=ga(@flight_sim,4,[],[],[],[],lb,ub,[],options);




u0=[30 10 6000 4500];
options=optimset('Algorithm','SQP','Display','iter','MaxFunEvals',8000,'MaxIter',500);
[u,fval]=fmincon(@flight_sim,u0,[],[],[],[],lb,ub,@flight_sim_con,options);

