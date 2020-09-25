% -*- mode: octave -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program 6.
%
% A Matlab program that uses the built-in ODE solver
% 'ode45' (4th/5th order Runge-Kutta method) to solve
% the rigid body model.
%
% Here's how to get started:
%
%   1) Copy program6.m (this file) and rigidbody.m
%      into your working directory.
%
%   2) Invoke Matlab by typing "matlab" at the
%      Linux prompt.
%
%   3) Type "program6" in the Matlab window to
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
% Note2: The rigid body model must be written in
%        the general first-order form
%                 du1/dt = F1(t,u1,u2,u3)
%                 du2/dt = F2(t,u1,u2,u3)
%                 du3/dt = F3(t,u1,u2,u3).
%        In vector notation, this is du/dt = F(t,u),
%        where u=(u1,u2,u3), F=(F1,F2,F3).  This
%        system is defined in the file rigidbody.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define global constants
global m a b c ;

% Define initial condition u0 (fill in values later)
u0 = zeros(3,1); %3x1 array

% Define initial and final times
t0 = 0 ;  tf = 0.5  ;

% Set value of constants
m=2.0 ; a = 0.03 ; b = 0.16 ; c = 0.24 ;

% Define number and values of (u10,u20,u30) points.
% These will be normalized into unit vectors later.
Npoints = 4 ;
u10 = [0.08, -0.05,  0.03, -0.06] ;
u20 = [0.10, -0.04, -0.02,  0.07] ;
u30 = [1.00,  1.00,  1.00,  1.00] ;

% Define and clear figures
figure(1) ; clf ; hold on ;
figure(2) ; clf ; hold on ;
figure(3) ; clf ; hold on ;
figure(4) ; clf ; grid on; axis square ; view(115,25) ;
figure(4) ; axis([-1  1 -1  1 -1  1]); hold on ;

% Solve system for each initial condition and
% plot results

for i=1:Npoints
  u0(1) = u10(i) ; u0(2) = u20(i) ; u0(3) = u30(i) ;
  u0 = u0/sqrt(u0(1)^2 + u0(2)^2 + u0(3)^2) ;
  [tsoln,usoln]=ode45(@rigidbody,[t0 tf],u0) ;
  figure(1) ;
  plot(tsoln,usoln(:,1),'k-') ; %plot u1 versus t
  figure(2) ;
  plot(tsoln,usoln(:,2),'b-') ; %plot u2 versus t
  figure(3) ;
  plot(tsoln,usoln(:,3),'m-') ; %plot u3 versus t
  figure(4) ;
  plot3(usoln(:,1),usoln(:,2),usoln(:,3),'r-')  ; %3D plot (u1,u2,u3)
  clear tsoln usoln ;
end

figure(1) ; xlabel('t') ; ylabel('u1') ;
figure(1) ; title('Time view: u1 vs t for various (u10,u20,u30)') ;
print -f1 -dpdf prog6_fig1.pdf ; %print figure to a file

figure(2) ; xlabel('t') ; ylabel('u2') ;
figure(2) ; title('Time view: u2 vs t for various (u10,u20,u30)') ;
print -f2 -dpdf prog6_fig2.pdf ; %print figure to a file

figure(3) ; xlabel('t') ; ylabel('u3') ;
figure(3) ; title('Time view: u3 vs t for various (u10,u20,u30)') ;
print -f3 -dpdf prog6_fig3.pdf ; %print figure to a file

figure(4) ; xlabel('u1') ; ylabel('u2') ; zlabel('u3') ;
figure(4) ; title('Phase view: u1 vs u2 vs u3 for various (u10,u20,u30)') ;
print -f4 -dpdf prog6_fig4.pdf ; %print figure to a file
