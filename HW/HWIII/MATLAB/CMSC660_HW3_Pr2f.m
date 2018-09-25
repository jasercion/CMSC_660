%*****************************
% CMSC660 HW3 Problem 2f
% Joe Asercion
%***************************** 

% Set Markov chain transition matrix constants
lambda = 1;
mu = 4;

% Time constant
t = 1;

% Iterations
n = 4;

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

L = R^(-1);

for k = 1:n
    lam = Lam(:,k);
    l = L(:,k);
    n = l.*lam-A*l;
    k = num2str(k);
    disp([newline,'Al_{k}, k=',k newline]);
    disp(A*l);
    disp([newline,'l_{k}lambda_{k}, k=',k newline]);
    disp(l.*lam);
    disp([newline,'Norm lambda_{k}-Al_{l}, k=',k newline]);
    disp(norm(n));
end
