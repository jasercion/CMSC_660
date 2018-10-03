%*****************************
% CMSC660 HW4 Problem 2c
% Joe Asercion
%***************************** 

% Set iteration step size
delta_x=.1;

% Total number of steps
n=(1/delta_x);

% 'A' Transformation Matrix
A = (1/2)*(1/(delta_x)^2)*gallery('tridiag',n-1,1,-2,1);

% Note: Leaving A as a sparse matrix speeds up chol('lower') execution
L = chol(-A,'lower');