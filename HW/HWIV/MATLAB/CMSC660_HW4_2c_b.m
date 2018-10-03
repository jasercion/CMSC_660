%*****************************
% CMSC660 HW4 Problem 2c
% Joe Asercion
%***************************** 

% Set iteration step size
delta_x=.1;

% Total number of steps
n=(1/delta_x);

diagSum = 0;
offdiagSum = 0;

% 'A' Transformation Matrix
A = -(1/2)*(1/(delta_x)^2)*gallery('tridiag',n-1,1,-2,1);

A = full(A);

L = zeros(size(A));

% Calculate L(1,1)
L(1,1) = sqrt(A(1,1));

% Use L(1,1) to obtain L(x,1)
for i = 2:n-1
    L(i,1) = A(i,1)/L(1,1);
end

%Calculate L(2,2)
L(2,2) = sqrt(A(2,2)-L(2,1)*L(2,1));

for i = 3:n-1
    for j = i-1:i
        if j == i
            L(j,j) = sqrt(A(j,j)-L(j,j-1)*L(j,j-1));
        else
        L(i,j) = A(i,j)/L(i-1,j);
        end
    end
end



