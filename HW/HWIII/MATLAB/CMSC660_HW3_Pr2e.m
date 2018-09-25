%*****************************
% CMSC660 HW3 Problem 2e
% Joe Asercion
%***************************** 

% Set Markov chain transition matrix constants
lambda = 1;
mu = 4;

% Time constant
t = 1;

% Iterations
n = 4;
k = 20;

% Preallocate matrices to store the eigenvalues and eigenvectors returned 
% by eig[A]
R = zeros(n);
Lam = zeros(n);

% Build the MCT matrix.  Call a test tridiag matrix of size n-1 and change
% elements [1, 1] and [n, n] to their correct values.
A = gallery('tridiag',n,mu,-(lambda+mu),lambda);
A(1, 1) = -lambda;
A(n, n) = -mu;

% Convert sparse matrix A to a full matrix so that eig can be called
A = full(A);

% Call eig to calculate eigenvalues/right eigenvectors
[R,Lam] = eig(A);

for k = 1:n
    l = Lam(:,k);
    r = R(:,k);
    n = l.*r-A*r;
    k = num2str(k);
    disp([newline,'Ar_{k}, k=',k newline]);
    disp(A*r);
    disp([newline,'lambda_{k}r_{k}, k=',k newline]);
    disp(l.*r);
    disp([newline,'Norm lambda_{k}r_{k}-Ar_{k}, k=',k newline]);
    disp(norm(n));
end
    
