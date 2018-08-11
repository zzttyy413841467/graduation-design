k=40;
N=k+1;
nvar=2*k+6*N+2;

alphamin=0*ones(1,k);
alphamax=1*ones(1,k);
sigmamin=-pi/2*ones(1,k);
sigmamax=pi/2*ones(1,k);
hmin=20000*ones(1,k+1);
hmax=80000*ones(1,k+1);
thetamin=-1.5*ones(1,k+1);
thetamax=1.5*ones(1,k+1);
phimin=-0.5*ones(1,k+1);
phimax=0.5*ones(1,k+1);
vmin=500*ones(1,k+1);
vmax=8000*ones(1,k+1);
gammamin=-0.5*ones(1,k+1);
gammamax=0.5*ones(1,k+1);
psaimin=-0.5*ones(1,k+1);
psaimax=0.5*ones(1,k+1);
l=[hmin thetamin phimin vmin gammamin psaimin alphamin sigmamin 0 1000];
u=[hmax thetamax phimax vmax gammamax psaimax alphamax sigmamax 0 2000];
l(1)=79248;
u(1)=79248;
l(N)=24383;
u(N)=24384;
l(N+1)=0;
l(2*N+1)=0;
l(3*N+1)=6492;
u(N+1)=0;
u(2*N+1)=0;
u(3*N+1)=6492;
l(4*N)=762;
u(4*N)=762;
l(4*N+1)=-1.5/57.3;
l(5*N)=-10/57.3;
l(5*N+1)=0;
u(4*N+1)=-1.5/57.3;
u(5*N)=-10/57.3;
u(5*N+1)=0;

point=GetLGR(k);
tau=[point;1];
h0=interp1([-1 1],[79248 24384],tau.');
v0=interp1([-1 1],[6492 762],tau.');
init=[h0 zeros(1,2*N) v0 zeros(1,2*N+2*k) 0 1500];


t0=optimresults.x(nvar-1);
tf=optimresults.x(nvar);
time=((tf+t0)+tau*(tf-t0))/2;

% [xx,fval]=ga(@fitfun,nvar,[],[],[],[],l,u,@nonlcons);


% options=gaoptimset('PopulationSize',1000,'PopInitRange',[0.7;1.2],'StallGenLimit',50);
% [xx,fval]=gamultiobj(@fitfun,nvar,[],[],[],[],l,u,@yueshufunc,options);

% options=gaoptimset('PopulationSize',2000,'PopInitRange',[0.7;1.2],'StallGenLimit',5); 
% [xx,fval]=gamultiobj(@fitfun2,nvar,[],[],[],[],l,u,@yueshufunc2,options);

