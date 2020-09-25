% -*- mode: octave -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program 2.
%
% A Matlab program that uses the built-in ODE solver
% 'ode45' (4th/5th order Runge-Kutta method) to solve
% the reaction tank model.
%
% Here's how to get started:
%
%   1) Copy program2.m (this file) and rtank.m
%      into your working directory.
%
%   2) Invoke Matlab by typing "matlab" at the
%      Linux prompt.
%
%   3) Type "program2" in the Matlab window to
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
% Note2: The reaction model must be written in the
%        general form
%                 du/dt = F(t,u)
%        where u is the concentration variable.
%        This system is defined in the file rtank.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define global constants
global cin eta V gamma ;


%%% Set value of constants for Scenario One %%%
## cin=10^(-2) ; eta=10^(-2) ; V = 10 ; gamma = 10^(-1) ;
cin=10^(-2) ; eta=10^(-1) ; V = 1 ; gamma = 10^(-1) ;

% Define initial condition u0
u0 = 0 ; %this is c0

% Define initial and final times for simulation
t0 = 0 ;  tf = 10*V/eta  ;

% Solve ODE system (1) and store results in the
% arrays tsolnOne1 and usolnOne1
[tsolnOne1,usolnOne1]=ode45(@rtank,[t0 tf],u0) ;
[tsolnOne1Approx,usolnOne1Approx]=ode45(@rtank_approx,[t0 tf*eta/V],u0) ;

% Solve ODE system (2) [set gamma=0] and store
% results in the arrays tsolnOne2 and usolnOne2f
gamma = 0 ;
[tsolnOne2,usolnOne2]=ode45(@rtank,[t0 tf],u0) ;
[tsolnOne2Approx,usolnOne2Approx]=ode45(@rtank_approx,[t0 tf*eta/V],u0) ;


% Plot u-values versus t-values for each system
figure(1) ; %open figure
clf ; % clear figure
hold on ; % hold figure for multiple plots
plot(tsolnOne1,usolnOne1,'b-')  ; %plot u versus t
plot(tsolnOne2,usolnOne2,'r--') ; %plot u versus t
## plot(tsolnOne1Approx,usolnOne1Approx,'b-')  ; %plot u versus t
## plot(tsolnOne2Approx,usolnOne2Approx,'p--')  ; %plot u versus t
xlabel('t')      ; %label x axis
ylabel('c')      ; %label y axis
title('Scenario One: Ode 1 (blue,solid), Ode 2 (red,dash)') ;
print -f1 -dtex prog2_fig1.tex ; %print figure to a file
