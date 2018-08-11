
%close all
clear all
clc
% calcu_Cl_Cd;
    

auxdata.Re = 6371393;              % Equatorial Radius of Earth (m)
auxdata.S  = 0.484;                % Vehicle Reference Area (m^2)

% auxdata.cl = createFit_CL(alpha, Ma, C_L);                  % Parameters for lift coefficient
% auxdata.cd = createFit_CD(alpha, Ma, C_D);       

auxdata.cl(1) = -0.2317;                  % Parameters for lift coefficient
auxdata.cl(2) = 0.0513*57.3;
auxdata.cl(3) = 0.2945;
auxdata.cl(4) = -0.1028/340;


auxdata.cd(1) = 0.024;       
auxdata.cd(2) = 7.24e-4*57.3^2; 
auxdata.cd(3) = 0.406; 
auxdata.cd(4) = -0.323/340;


auxdata.H     = 7320;              % Density Scale Height (m)
auxdata.rho0  = 1.225;% Sea Level Atmospheric Density (slug/ft^3)
auxdata.mu    = auxdata.Re^2*9.81;     % Earth Gravitational Parameter (ft^^3/s^2) 
auxdata.mass  = 907.2; 

% inital conditions
t0 = 0;
alt0 = 100000;
rad0 = alt0+auxdata.Re;
lon0 = 0*pi/180;
lat0 = 0*pi/180;
speed0 = 7200;
fpa0   = -2*pi/180;
azi0   = 0*pi/180;



% terminal conditions
altf = 2e4;
radf = altf+auxdata.Re;
speedf = 1000;
lonf   = 98*pi/180;
latf   = 20*pi/180;
fpaf   = -5*pi/180;

%----------------------------------------------------%
% Lower and Upper Limits on Time, State, and Control %
%----------------------------------------------------%
tfMin = 500;            tfMax = 3000;
radMin = auxdata.Re;  radMax = rad0;
lonMin = -1*pi;         lonMax = -lonMin;
latMin = -80*pi/180;  latMax = -latMin;
speedMin = 10;        speedMax = 45000;
fpaMin = -89*pi/180;  fpaMax =  89*pi/180;
aziMin = -180*pi/180; aziMax =  180*pi/180;
aoaMin = 0*pi/180;  aoaMax = 50*pi/180;
bankMin = -50*pi/180; bankMax = 50*pi/180;

bounds.phase.initialtime.lower = t0;
bounds.phase.initialtime.upper = t0;
bounds.phase.finaltime.lower = tfMin;
bounds.phase.finaltime.upper = tfMax;
bounds.phase.initialstate.lower = [rad0, lon0, lat0, speed0, fpa0, azi0];
bounds.phase.initialstate.upper = [rad0, lon0, lat0, speed0, fpa0, azi0];
bounds.phase.state.lower = [radMin, lonMin, latMin, speedMin, fpaMin, aziMin];
bounds.phase.state.upper = [radMax, lonMax, latMax, speedMax, fpaMax, aziMax];
bounds.phase.finalstate.lower = [radf, lonf, latf, speedf, fpaf, aziMin];
bounds.phase.finalstate.upper = [radf, lonf, latf, speedf, fpaf, aziMax];
% bounds.phase.control.lower = [aoaMin, bankMin];
% bounds.phase.control.upper = [aoaMax, bankMax];

bounds.phase.control.lower = [bankMin];
bounds.phase.control.upper = [bankMax];

bounds.phase.integral.lower = 0;
bounds.phase.integral.upper = 1e15;
bounds.phase.path.lower = [0,0,0,0];
bounds.phase.path.upper = [5e5,4,1e6,1e5];
%----------------------%
% Set up Initial Guess %
%----------------------%
tGuess = [0; 1500];
radGuess = [rad0; radf];
lonGuess = [lon0; lonf];
latGuess = [lat0; latf];
speedGuess = [speed0; speedf];
fpaGuess = [fpa0; fpaf];
aziGuess = [azi0; azi0];
aoaGuess = [20/57.3; 10/57.3];



bankGuess = [0; 0];

guess.phase.state   = [radGuess, lonGuess, latGuess, speedGuess, fpaGuess, aziGuess];
% guess.phase.control = [aoaGuess, bankGuess];

guess.phase.control = [bankGuess];

guess.phase.time    = tGuess;
guess.phase.integral= 0;

%---------------------%
% Set up Initial Mesh %
%---------------------%
meshphase.colpoints = 4*ones(1,10);
meshphase.fraction = 0.1*ones(1,10);

setup.name = 'Reusable-Launch-Vehicle-Entry-Problem';
setup.functions.continuous = @rlvEntryContinuous;
setup.functions.endpoint   = @rlvEntryEndpoint;
setup.auxdata = auxdata;
setup.mesh.phase = meshphase;
setup.bounds = bounds;
setup.guess = guess;
setup.nlp.solver = 'snopt';
% setup.nlp.solver = 'ipopt';
setup.derivatives.supplier = 'sparseCD';


setup.derivatives.derivativelevel = 'second';
setup.scales.method = 'automatic-bounds';

% setup.method = 'RPMintegration';
setup.mesh.method = 'hp1';
setup.mesh.tolerance = 5e-3; % default 1e-3
setup.mesh.colpointsmin = 6;
setup.mesh.colpointsmax = 16;
setup.mesh.maxiterations= 25;
setup.nlp.ipoptoptions.tolerance=1e-6;
setup.nlp.ipoptoptions.maxiterations=2000;
setup.nlp.snoptoptions.tolerance=1e-6;
setup.nlp.snoptoptions.maxiterations=2000;
%----------------------------------%
% Solve Problem Using OptimalPrime %
%----------------------------------%
output = gpops2(setup);
