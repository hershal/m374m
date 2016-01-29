function dudt = pendulum(t,u)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Evaluates du/dt for the pendulum system
%
%      du1/dt =  u2
%      du2/dt = -(g/L)*sin(u1).
%
% Inputs:  t = time
%          u = system vector (2x1 array) where
%              u(1)=u1=theta, u(2)=u2=dtheta/dt.
%
% Output:  dudt = derivative of system vector (2x1 array),
%                 where dudt(1)=du1/dt, dudt(2)=du2/dt.
%
% Note: Matlab's ODE solvers require us to include the
% variable t in the argument list of our function F even
% though it might not be used to evaluate dudt.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Access global constants from main prog
global g L ;

% Initialize output array dudt
dudt = zeros(2,1) ;

% Evaluate dudt for given t and u
dudt(1) = u(2)             ;
dudt(2) = -(g/L)*sin(u(1)) ;
