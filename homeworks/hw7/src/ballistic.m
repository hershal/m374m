# -*- mode: octave -*-
function dudt = ballistic(t,u)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Evaluates du/dt for the ballistic model
%
%      du1/dt = u3
%      du2/dt = u4
%      du3/dt = -eps u3^2
%      du4/dt = -eps u3 u4 - g.
%
% Inputs:  t = time
%          u = system vector (4x1 array) where
%              u(1)=x, u(2)=y, u(3)=dx/dt, u(4)=dy/dt.
%
% Output:  dudt = derivative of system vector (4x1 array),
%                 where dudt(1)=du1/dt, etc.
%
% Note: Matlab's ODE solvers require us to include the
% variable t in the argument list of our function F even
% though it might not be used to evaluate dudt.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Access global constants from main prog
global g eps ;

% Initialize output array dudt
dudt = zeros(4,1) ;

% Evaluate dudt for given t and u
dudt(1) = u(3) ;
dudt(2) = u(4) ;
dudt(3) = -eps*u(3)*u(3) ;
dudt(4) = -eps*u(3)*u(4) - g ;
