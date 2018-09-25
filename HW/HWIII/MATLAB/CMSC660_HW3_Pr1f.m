%*****************************
% CMSC660 HW3 Problem 1f
% Joe Asercion
%***************************** 

% Set iteration step size
delta_x=.001;

% Total number of steps
n=(1/delta_x);

% Vector to hold F(x) function values
F=ones(n-1,1);

% Constant for Eigenvector F(x) case
k=1;

% Populate F(x) vector
for j = 1:(n-1)
    % Define function to populate F(x) with here:
    F(j)=sin(k*pi*(j*delta_x));
end

% 'A' Transformation Matrix
A = (1/2)*(1/(delta_x)^2)*gallery('tridiag',n-1,1,-2,1);

% Solution for AU=F using MATLAB backslash operator
U = A\F;

% Vector consisting of steps for plot
X = 0+delta_x:delta_x:1-delta_x;

% Plot delta_x vs U(x)
scatter(X,U)