% ----------- Reusable Launch Vehicle Entry Example ------------%
% This example is taken verbatim from the following reference:  %
% Betts, J. T., Practical Methods for Optimal Control Using     %
% Nonlinear Programming, SIAM Press, Philadelphia, 2009.        %
% --------------------------------------------------------------%
%close all
clear all
clc

    

auxdata.Re = 6318745;              % Equatorial Radius of Earth (m)
auxdata.S  = 95;                % Vehicle Reference Area (m^2)
auxdata.cl(1) = -0.2074;                  % Parameters for lift coefficient
auxdata.cl(2) = 0.029244*57.3;       
auxdata.cd(1) = 0.06304;       
auxdata.cd(2) = 0.6214;       

auxdata.H     = 7320;              % Density Scale Height (m)
auxdata.rho0  = 1.225;% Sea Level Atmospheric Density (slug/ft^3)
auxdata.mu    = auxdata.Re^2*9.81;     % Earth Gravitational Parameter (ft^^3/s^2) 
auxdata.mass  = 20000; 

% inital conditions
t0 = 0;
alt0 = 120000;
rad0 = alt0+auxdata.Re;
lon0 = -85.64*pi/180;
lat0 = 4.79*pi/180;
speed0 = 7800;
fpa0   = -0.92*pi/180;
azi0   = 51.9*pi/180;



% terminal conditions
altf = 25000;
radf = altf+auxdata.Re;
speedf = 760;
lonf   = -5.15*pi/180;
latf   = 43.81*pi/180;

%----------------------------------------------------%
% Lower and Upper Limits on Time, State, and Control %
%----------------------------------------------------%
tfMin = 0;            tfMax = 3000;
radMin = auxdata.Re;  radMax = rad0;
lonMin = -pi;         lonMax = -lonMin;
latMin = -70*pi/180;  latMax = -latMin;
speedMin = 10;        speedMax = 45000;
fpaMin = -80*pi/180;  fpaMax =  80*pi/180;
aziMin = -180*pi/180; aziMax =  180*pi/180;
aoaMin = -90*pi/180;  aoaMax = -aoaMin;
bankMin = -90*pi/180; bankMax =   90*pi/180;

bounds.phase.initialtime.lower = t0;
bounds.phase.initialtime.upper = t0;
bounds.phase.finaltime.lower = tfMin;
bounds.phase.finaltime.upper = tfMax;
bounds.phase.initialstate.lower = [rad0, lon0, lat0, speed0, fpa0, azi0];
bounds.phase.initialstate.upper = [rad0, lon0, lat0, speed0, fpa0, azi0];
bounds.phase.state.lower = [radMin, lonMin, latMin, speedMin, fpaMin, aziMin];
bounds.phase.state.upper = [radMax, lonMax, latMax, speedMax, fpaMax, aziMax];
bounds.phase.finalstate.lower = [radf, lonf, latf, speedf, fpaMin, aziMin];
bounds.phase.finalstate.upper = [radf, lonf, latf, speedf, fpaMax, aziMax];
bounds.phase.control.lower = [aoaMin, bankMin];
bounds.phase.control.upper = [aoaMax, bankMax];
bounds.phase.integral.lower = 0;
bounds.phase.integral.upper = 1e14;
bounds.phase.path.lower = [0,0,0];
bounds.phase.path.upper = [12000;2.5;1.15e10];
%----------------------%
% Set up Initial Guess %
%----------------------%
tGuess = [0; 1000];
radGuess = [rad0; radf];
lonGuess = [lon0; lonf];
latGuess = [lat0; latf];
speedGuess = [speed0; speedf];
fpaGuess = [fpa0; fpa0];
aziGuess = [azi0; azi0];
aoaGuess = [0; 0];
bankGuess = [0; 0];

guess.phase.state   = [radGuess, lonGuess, latGuess, speedGuess, fpaGuess, aziGuess];
guess.phase.control = [aoaGuess, bankGuess];
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
% setup.nlp.solver = 'snopt';
setup.nlp.solver = 'ipopt';
setup.derivatives.supplier = 'sparseCD';
setup.derivatives.derivativelevel = 'second';
setup.scales.method = 'automatic-bounds';
% setup.method = 'RPMintegration';
setup.mesh.method = 'hp1';
setup.mesh.tolerance = 1e-6; % default 1e-3
setup.mesh.colpointsmin = 4;
setup.mesh.colpointsmax = 12;

%----------------------------------%
% Solve Problem Using OptimalPrime %
%----------------------------------%
output = gpops2(setup);
