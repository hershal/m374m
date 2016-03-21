# -*- mode: octave -*-
function dudt = rigidbody(t,u)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Evaluates du/dt for the rigid body model
%
%      du1/dt = eta1 u2 u3
%      du2/dt = eta2 u3 u1
%      du3/dt = eta3 u1 u2.
%
% Inputs:  t = time
%          u = system vector (3x1 array) where
%              u(1)=u1, u(2)=u2, u(3)=u3.
%
% Output:  dudt = derivative of system vector (3x1 array),
%                 where dudt(1)=du1/dt, etc.
%
% Note: Matlab's ODE solvers require us to include the
% variable t in the argument list of our function F even
% though it might not be used to evaluate dudt.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Access global constants from main prog
global m a b c ;

% Initialize output array dudt
dudt = zeros(3,1) ;

% Assemble constants
alpha = 12/(m*a^2 + m*c^2) ;
beta  = 12/(m*a^2 + m*b^2) ;
gamma = 12/(m*b^2 + m*c^2) ;
eta1  = gamma - beta  ;
eta2  = alpha - gamma ;
eta3  = beta - alpha ;

% Evaluate dudt for given t and u
dudt(1) = eta1*u(2)*u(3) ;
dudt(2) = eta2*u(3)*u(1) ;
dudt(3) = eta3*u(1)*u(2) ;
