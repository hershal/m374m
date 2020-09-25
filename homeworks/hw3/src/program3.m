% -*- mode: octave -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program 3.
%
% A Matlab program that uses the built-in ODE solver
% 'ode45' (4th/5th order Runge-Kutta method) to solve
% the plant-herbivore model.
%
% Here's how to get started:
%
%   1) Copy program3.m (this file) and plant.m
%      into your working directory.
%
%   2) Invoke Matlab by typing "matlab" at the
%      Linux prompt.
%
%   3) Type "program3" in the Matlab window to
%      run the program.
%
%   4) To complete the homework, use a plain text
%      editor to modify the program as necessary.
%      Once modified, simply re-save the file and
%      re-run as in Step 3.
%
% Note1: The output figures will be saved to your
%        working directory.
%
% Note2: The plant-herbivore model must be written
%        in the general form
%                 du/dt = F(t,u)
%        where u is the population variable. This
%        system is defined in the file plant.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define global constants
global c h ;

% Set time interval
t0 = 0 ;  tf = 50 ;

% Set value of constants
c = 4 ;  h = 3 ;

% Set number (spacing) of curves for portrait
nplots = 50 ; delta = 1/nplots ;

% Solve and plot for equally-spaced u0 in [0,1]
figure(1) ; clf ; hold on ;
## for i=1:(nplots+1)
  ## u0 = (i-1)*delta ;
u0 = 1/4;
  [tsoln,usoln]=ode45(@plant,[t0 tf],u0) ;
  plot(tsoln,usoln)  ; %plot u versus t
## end

xlabel('$\tau$') ;
ylabel('$u$') ;
title('Solution curves for different initial conditions, $h=0.8$') ;
print -f1 -dtex prog3_fig1.tex ; %print figure to a file
