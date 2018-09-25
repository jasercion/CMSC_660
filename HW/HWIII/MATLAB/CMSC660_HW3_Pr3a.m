%*****************************
% CMSC660 HW3 Problem 3a
% Joe Asercion
%***************************** 

% Constants
n = 20;
s = .1;
lambda = 1;
mu = 4;

% Create matrix B
B = zeros(n);
B(1, 1) = -1;
B(1, n) = 1;

% Create MCT matrix
lambda = 1;
A = gallery('tridiag',n,mu,-(lambda+mu),lambda);
A(1, 1) = -lambda;
A(n, n) = -mu;

A(1, 1) = -lambda;
A(n, n) = -mu;
A = full(A);

% Compute the eigenvalues of the A(s) function
Y = A + s*B;
Lam = eig(Y);


    