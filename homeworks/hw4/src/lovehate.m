# -*- mode: octave -*-
function dudt = lovehate(t,u)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Evaluates du/dt for the relationship model
%
%      du1/dt = a u1 + b u2
%      du2/dt = c u1 + d u2.
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
global a b c d ;

% Initialize output array dudt
dudt = zeros(2,1) ;

% Evaluate dudt for given t and u
dudt(1) = a*u(1) + b*u(2) ;
dudt(2) = c*u(1) + d*u(2) ;
