function [fitresult, gof] = createFit_CD(alpha, Ma, C_D)
%CREATEFIT(ALPHA,MA,C_D)
%  Create a fit.
%
%  Data for 'calcu_CL' fit:
%      X Input : alpha
%      Y Input : Ma
%      Z Output: C_D
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 21-Mar-2018 18:59:55 自动生成


%% Fit: 'calcu_CL'.
[xData, yData, zData] = prepareSurfaceData( alpha, Ma, C_D );

% Set up fittype and options.
ft = 'thinplateinterp';

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, 'Normalize', 'on' );



