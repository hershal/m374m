% -*- mode: octave -*-
function dudt = rtank_approx(t,u)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Evaluates du/dt for the reaction tank model
%
%      du/dt = (eta/V)*(cin - u) - gamma*u^2.
%
% Inputs:  t = time
%          u = concentration.
%
% Output:  dudt = derivative of concentration.
%
% Note: Matlab's ODE solvers require us to include the
% variable t in the argument list of our function F even
% though it might not be used to evaluate dudt.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 % Access global constants from main prog
  global cin eta V gamma ;

 % Initialize output variable dudt
  dudt = 0 ;

 % Evaluate dudt for given t and u
  dudt = 1 - u - ((V*gamma*cin)/eta)*u^2 ;
