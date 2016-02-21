% -*- mode: octave -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program 4.
%
% A Matlab program that uses the built-in ODE solver
% 'ode45' (4th/5th order Runge-Kutta method) to solve
% the relationship model.
%
% Here's how to get started:
%
%   1) Copy program4.m (this file) and lovehate.m
%      into your working directory.
%
%   2) Invoke Matlab by typing "matlab" at the
%      Linux prompt.
%
%   3) Type "program4" in the Matlab window to
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
% Note2: The relationship model must be written in
%        the general first-order form
%                 du1/dt = F1(t,u1,u2)
%                 du2/dt = F2(t,u1,u2)
%        where u1=x, u2=y.  In vector notation,
%        this is du/dt = F(t,u), where u=(u1,u2),
%        F=(F1,F2).  This system is defined in the
%        file lovehate.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pkg load odepkg

% Define global constants
global a b c d ;

% Define initial condition u0 (fill in values later)
u0 = zeros(2,1); %2x1 array

% Define initial and final times
t0 = 0 ;  tf = 8  ;

% Set value of constants
a = -4 ; b = 3 ; c = 3 ; d = -4 ;

% Define number and values of (x0,y0) points
Npoints = 4 ;
x0 = [1.0, -1.1, -2.3, 1.5] ;
y0 = [0.8,  1.7, -0.9, -1.1] ;

% Define and clear figures
figure(1) ; clf ; hold on ;
figure(2) ; clf ; hold on ;
figure(3) ; clf ; hold on ;

% Solve system for each initial condition and
% plot results

minu=100000;
maxu=-100000;

for i=1:Npoints
  u0(1) = x0(i) ; u0(2) = y0(i) ;
  [tsoln,usoln]=ode45(@lovehate,[t0 tf],u0) ;
  figure(1) ;
  plot(tsoln,usoln(:,1),'b--') ; %plot u1 versus t
  figure(2) ;
  plot(tsoln,usoln(:,2),'k-.') ; %plot u2 versus t
  figure(3) ;
  plot(usoln(:,1),usoln(:,2),'r-')  ; %plot u2 versus u1
  hold on;
  minu = min(minu, min(min(usoln(:,1)), min(usoln(:,2))));
  maxu = max(maxu, max(max(usoln(:,1)), max(usoln(:,2))));
  clear tsoln usoln ;
end
hold off;
ustep= (maxu-minu)/20;
[x,y] = meshgrid(minu:ustep:maxu);
quiver(x, y, a*x+b*y, c*x+d*y);
hold off;

figure(1) ; xlabel('t') ; ylabel('x') ;
figure(1) ; title('Time view: x vs t for various (x0,y0)') ;
print -f1 -dpdf prog4_fig1.pdf ; %print figure to a file

figure(2) ; xlabel('t') ; ylabel('y') ;
figure(2) ; title('Time view: y vs t for various (x0,y0)') ;
print -f2 -dpdf prog4_fig2.pdf ; %print figure to a file

figure(3) ; xlabel('x') ; ylabel('y') ;
figure(3) ; title('Phase view: y vs x for various (x0,y0)') ;
print -f3 -dpdf prog4_fig3.pdf ; %print figure to a file
