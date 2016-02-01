% -*- mode: octave -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program 1.
%
% A Matlab program that uses the built-in ODE solver
% 'ode45' (4th/5th order Runge-Kutta method) to solve
% the pendulum system.
%
% Here's how to get started:
%
%   1) Copy program1.m (this file) and pendulum.m
%      into your working directory.
%
%   2) Invoke Matlab by typing "matlab" at the
%      Linux prompt.
%
%   3) Type "program1" in the Matlab window to
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
% Note2: The pendulum system must be written in the
%        general first-order form
%                 du1/dt = F1(t,u1,u2)
%                 du2/dt = F2(t,u1,u2)
%        where u1=theta, u2=dtheta/dt.  In vector
%        notation, this is du/dt = F(t,u), where
%        u=(u1,u2), F=(F1,F2).  This system is
%        defined in the file pendulum.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pkg load odepkg

% Define global constants
global g  L ;

% Define initial condition vector u0
u0 = zeros(2,1); %initialize 2x1 array
u0(1) = 3*pi/8 ; %1st component is theta0
u0(2) = 0 ;      %2nd component is dtheta0/dt

% Define initial and final times for simulation
t0 = 0 ;  tf = 2.5  ;


% Set value of constants, solve the ODE system and
% store results in the arrays tsolnA and usolnA
g = 10 ; L = 0.25  ;
[tsolnA,usolnA]=ode45(@pendulum,[t0 tf],u0) ;


% Set value of constants, solve the ODE system and
% store results in the arrays tsolnB and usolnB
g = 10 ; L = 0.50  ;
[tsolnB,usolnB]=ode45(@pendulum,[t0 tf],u0) ;

% Set value of constants, solve the ODE system and
% store results in the arrays tsolnC and usolnC
g = 10 ; L = 1  ;
[tsolnC,usolnC]=ode45(@pendulum,[t0 tf],u0) ;

% Plot u1-values versus t-values for each case
figure(1) ; %open figure
clf ; % clear figure
hold on ; % hold figure for multiple plots
plot(tsolnA.*sqrt(g/0.25),usolnA(:,1),'b-')  ; %plot u1 versus t
plot(tsolnB.*sqrt(g/0.5),usolnB(:,1),'k--') ; %plot u1 versus t
plot(tsolnC.*sqrt(g/1),usolnC(:,1),'r-.') ; %plot u1 versus t
xlabel('t')          ; %label x axis
ylabel('theta')      ; %label y axis
title('L=0.25 (blue,solid), 0.5 (black,dash), 1 (red,dashdot)') ;
print -f1 -dtex prog1_fig1.tex;
## print -f1 -dpdf prog1_fig1.pdf ; %print figure to a file

% Rescale t values by a constant factor c
c = 0.37 ;
tsolnAc = tsolnA*c ;

% Plot u1-values versus rescaled t-values
figure(2) ;
clf ;
plot(tsolnAc,usolnA(:,1),'b-')  ;
xlabel('t*c')        ;
ylabel('theta')      ;
print -f2 -dtex prog1_fig2.tex;
