% -*- mode: octave -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program 7.
%
% A Matlab program that uses the built-in ODE solver
% 'ode45' (4th/5th order Runge-Kutta method) to solve
% the ballistic model.
%
% Here's how to get started:
%
%   1) Copy program7.m (this file) and ballistic.m
%      into your working directory.
%
%   2) Invoke Matlab by typing "matlab" at the
%      Linux prompt.
%
%   3) Type "program7" in the Matlab window to
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
% Note2: The ballistic model must be written in
%        the general first-order form
%                 du1/dt = F1(t,u1,u2,u3,u4)
%                 du2/dt = F2(t,u1,u2,u3,u4)
%                 du3/dt = F3(t,u1,u2,u3,u4)
%                 du4/dt = F4(t,u1,u2,u3,u4)
%        where u1=x, u2=y, u3=dx/dt and u4=dy/dt.
%        In vector notation, this is du/dt = F(t,u),
%        where u=(u1,u2,u3,u4), F=(F1,F2,F3,F4). This
%        system is defined in the file ballistic.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Define global constants
global g eps ;

% Define initial condition array (fill in values later)
uinit = zeros(4,1); %4x1 array

% Define initial and final times
t0 = 0 ;  tf = 1.0  ;

% Set value of constants
g = 10 ; eps = 0.0 ;

% Define initial condition.
x0 = 0 ; y0 = 0 ; xdot0 = 500 ; ydot0 = 0 ;
uinit = [x0, y0, xdot0, ydot0] ;

% Define and clear figures
figure(1) ; clf ; hold on ;
figure(2) ; clf ; hold on ;
figure(3) ; clf ; hold on ;

% Solve system and plot results
[tsoln,usoln]=ode45(@ballistic,[t0 tf],uinit) ;
figure(1) ;
plot(tsoln,usoln(:,1),'k-') ; %plot u1 versus t
figure(2) ;
plot(tsoln,usoln(:,2),'b-') ; %plot u2 versus t
figure(3) ;
plot(usoln(:,1),usoln(:,2),'r-')  ; %plot u2 versus u1

figure(1) ; xlabel('t') ; ylabel('x') ;
figure(1) ; title('Time view: x vs t') ;
print -f1 -dpdf prog7_fig1.pdf ; %print figure to a file

figure(2) ; xlabel('t') ; ylabel('y') ;
figure(2) ; title('Time view: y vs t') ;
print -f2 -dpdf prog7_fig2.pdf ; %print figure to a file

figure(3) ; xlabel('x') ; ylabel('y') ;
figure(3) ; title('Phase view: y vs x') ;
print -f3 -dpdf prog7_fig3.pdf ; %print figure to a file
