
function dudt = F(t,u)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Evaluates du/dt for the Mercury model
%
%      du1/dt = u2
%      du2/dt = -u1 + (1/rho) + (gamma*u1^2/rho)
%
% Inputs:  t = theta
%          u = system vector (2x1 array) where
%              u(1)=(umerc), u(2)=d(umerc)/dtheta.
%
% Output:  dudt = derivative of system vector (2x1 array), 
%                 where dudt(1)=du1/dt, etc.
%
% Note: Matlab's ODE solvers require us to include the
% variable t in the argument list of our function F even
% though it might not be used to evaluate dudt.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Access global constants from main prog
global rho gamma c ;        

% Initialize output array dudt
dudt = zeros(2,1) ; 

% Evaluate dudt for given t and u
dudt(1) = u(2) ;
dudt(2) = -u(1) + (1/rho) + (gamma*u(1)*u(1)/rho) ;
 
