function [fitresult, gof] = createFit_CL(alpha, Ma, C_L)
%CREATEFIT(ALPHA,MA,C_L)
%  Create a fit.
%
%  Data for 'calcu_CL' fit:
%      X Input : alpha
%      Y Input : Ma
%      Z Output: C_L
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  ������� FIT, CFIT, SFIT.

%  �� MATLAB �� 21-Mar-2018 18:59:20 �Զ�����


%% Fit: 'calcu_CL'.
[xData, yData, zData] = prepareSurfaceData( alpha, Ma, C_L );

% Set up fittype and options.
ft = 'thinplateinterp';

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, 'Normalize', 'on' );



