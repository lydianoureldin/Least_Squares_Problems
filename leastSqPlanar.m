function [ R, t, RMSerror] = leastSqPlanar( P, Q )
% Lydia Noureldin
% This function estimates the translation vector and rotation matrix
% that transformed points in P to points in Q. 
% The algorithm used here is based on "Planar Displacements –
% Least-Squares Solution" notes (class 33) provided by Dr. Randy E. Ellis.
% PARAMETERS: P (original points)
%             Q (transformed points)
% RETURN: R (estimated rotation matrix)
%         t (estimated translation vector) 
%         RMSerror (root mean squared error)

% get the means 
Pmean = mean(P, 2); 
Qmean = mean(Q, 2); 

% P and Q have the same dimentions 
[n, m] = size(Q); 

% get zero means  
A = P - Pmean * ones(1, m); 
B = Q - Qmean * ones(1, m); 

% convert to complex vectors such that
% x is the real part and y is the imaginary part
rowA = A(1, :) + i * A(2, :); 
rowB = B(1, :) + i * B(2, :); 

% get r Phi (complex number) 
rphi = rowB * rowA'; 
% normalize it
if rphi == 0
    % do this check to avoid dividing by 0
    r = 0; 
else 
    r = rphi / norm(rphi); 
end 

% get R, the rotation matrix 
% get real part
rreal = real(r); 
% get imaginary part 
rimag = imag(r); 
R = [rreal, -1 * rimag; rimag, rreal];
% get t, the translation vector
t = Qmean - R * Pmean; 

% get RMS error
RMSerror=0; 
for j=1:m 
    x = Q(:,j) - (R * P(:,j) + t); 
    RMSerror = RMSerror + dot(x ,x); 
end 
RMSerror = sqrt(RMSerror / m); 

end

