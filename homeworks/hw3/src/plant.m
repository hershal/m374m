
function dudt = F(t,u)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Evaluates du/dt for the plant-herbivore model
%
%      du/dt = u*(1-u) - h*u/(1+c*u).
%
% Inputs:  t = time
%          u = plant population.
%
% Output:  dudt = derivative of population.
%
% Note: Matlab's ODE solvers require us to include the
% variable t in the argument list of our function F even
% though it might not be used to evaluate dudt.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Access global constants from main prog
global c h ;        

% Initialize output variable dudt
dudt = 0 ; 

% Evaluate dudt for given t and u
dudt = u*(1-u) - h*u/(1+c*u) ;
 
