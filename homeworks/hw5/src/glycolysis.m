function dudt = glycolysis(t,u)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Evaluates du/dt for the glycolysis model
%
%      du1/dt = -u1 + a u2 + u1^2 u2
%      du2/dt =  b  - a u2 - u1^2 u2.
%
% Inputs:  t = time
%          u = system vector (2x1 array) where
%              u(1)=u1=x, u(2)=u2=y.
%
% Output:  dudt = derivative of system vector (2x1 array),
%                 where dudt(1)=du1/dt, dudt(2)=du2/dt.
%
% Note: Matlab's ODE solvers require us to include the
% variable t in the argument list of our function F even
% though it might not be used to evaluate dudt.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Access global constants from main prog
global a b ;

% Initialize output array dudt
dudt = zeros(2,1) ;

% Evaluate dudt for given t and u
dudt(1) = -u(1) + a*u(2) + (u(1)^2)*u(2) ;
dudt(2) =   b   - a*u(2) - (u(1)^2)*u(2) ;
