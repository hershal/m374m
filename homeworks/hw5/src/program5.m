% -*- mode: octave -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program 5.
%
% A Matlab program that uses the built-in ODE solver
% 'ode45' (4th/5th order Runge-Kutta method) to solve
% the glycolysis model.
%
% Here's how to get started:
%
%   1) Copy program5.m (this file) and glycolysis.m
%      into your working directory.
%
%   2) Invoke Matlab by typing "matlab" at the
%      Linux prompt.
%
%   3) Type "program5" in the Matlab window to
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
% Note2: The glycolysis model must be written in
%        the general first-order form
%                 du1/dt = F1(t,u1,u2)
%                 du2/dt = F2(t,u1,u2)
%        where u1=x, u2=y.  In vector notation,
%        this is du/dt = F(t,u), where u=(u1,u2),
%        F=(F1,F2).  This system is defined in the
%        file glycolysis.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pkg load odepkg;

% Define global constants
global a b ;

% Define initial condition u0 (fill in values later)
u0 = zeros(2,1); %2x1 array

% Define initial and final times
t0 = 0 ;  tf = 40  ;

% Set value of constants
a = 0.1 ; b = 0.50 ;

% Define number and values of (x0,y0) points
Npoints = 4 ;
x0 = [0.4,  1.1,  0.3, 0.5] ;
y0 = [1.4,  1.7,  1.9, 0.1] ;

% Define and clear figures
figure(1) ; clf ; hold on ;
figure(2) ; clf ; hold on ;
figure(3) ; clf ; hold on ;

% Solve system for each initial condition and
% plot results

for i=1:Npoints
  u0(1) = x0(i) ; u0(2) = y0(i) ;
  [tsoln,usoln]=ode45(@glycolysis,[t0 tf],u0) ;
  figure(1) ;
  plot(tsoln,usoln(:,1),'b--') ; %plot u1 versus t
  figure(2) ;
  plot(tsoln,usoln(:,2),'k-.') ; %plot u2 versus t
  figure(3) ;
  plot(usoln(:,1),usoln(:,2),'r-')  ; %plot u2 versus u1
  clear tsoln usoln ;
end

figure(1) ; xlabel('t') ; ylabel('x') ;
figure(1) ; title('Time view: x vs t for various (x0,y0)') ;
print -f1 -dpdf prog5_fig1.pdf ; %print figure to a file

figure(2) ; xlabel('t') ; ylabel('y') ;
figure(2) ; title('Time view: y vs t for various (x0,y0)') ;
print -f2 -dpdf prog5_fig2.pdf ; %print figure to a file

figure(3) ; xlabel('x') ; ylabel('y') ;
figure(3) ; title('Phase view: y vs x for various (x0,y0)') ;
print -f3 -dpdf prog5_fig3.pdf ; %print figure to a file
