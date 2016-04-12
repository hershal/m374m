function dudx = F(x,u)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Evaluates du/dx for the meniscus ODE
%
%      du1/dx = u2
%      du2/dx = (rho*g/sigma) u1 (1+u2^2)^(3/2)
%
% Inputs:  x = horizontal coordinate for meniscus curve
%          u = system vector (2x1 array) where u(1)=y, 
%              u(2)=dy/dx.
%
% Output:  dudx = derivative of system vector (2x1 array), 
%                 where dudx(1)=du1/dx, etc.
%
% Note: Matlab's solvers require us to include the
% variable x in the argument list of our function F 
% even though it might not be used to evaluate dudx.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Access global constants from main prog
global sigma rho g ;        

% Initialize output array dudx
dudx = zeros(2,1) ; 

% Evaluate dudx for given x and u
dudx(1) = u(2) ;
dudx(2) = (rho*g/sigma)*u(1)*(1 + u(2)^2)^(3/2) ;
 
