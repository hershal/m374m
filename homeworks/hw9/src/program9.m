% -*- mode: octave -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program 9.
%
% A Matlab program that uses the built-in solver
% 'bvp4c' to solve the boundary-value problem
% for the liquid-gas meniscus or interface curve.
%
% Here's how to get started:
%
%   1) Copy program9.m (this file), meniscusODE.m
%      and meniscusBC.m into your working directory.
%
%   2) Invoke Matlab by typing "matlab" at the
%      Linux prompt.
%
%   3) Type "program9" in the Matlab window to
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
% Note2: The boundary-value problem must be written
%        in the general first-order form
%
%            du1/dx = F1(x,u1,u2) , a<=x<=b
%            du2/dx = F2(x,u1,u2) , a<=x<=b
%
%            Ga(u1,u2)=0 ,  at x=a  (BC)
%            Gb(u1,u2)=0 ,  at x=b  (BC)
%
%        where u1=y, u2=dy/dx.  In vector notation,
%        the differential equation is du/dx = F(x,u),
%        where u=(u1,u2), F=(F1,F2). This equation
%        is defined in the file meniscusODE.m.  In
%        vector notation, the two boundary conditions
%        are Ga(u)=0 and Gb(u)=0.  These equations
%        are defined in the file meniscusBC.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Define global constants
global sigma rho g gamma ;

% Set value of constants
sigma = 0.05 ; rho = 1000 ; g = 10 ;
L = 0.07 ; gamma = pi/3 ;

% Define x-interval [a,b] for problem
a = 0 ;  b = L ;

% Construct an initial guess of the solution
% u(x)=(y(x),y'(x)); this is required by the
% solver bvp4c.  One type of guess accepted
% by bvp4c is a constant function u(x)=const.
% We must also specify an initial grid of
% x-values in [a,b] to be used and adjusted
% by bvp4c.
yconst = 0 ; dydxconst = 0 ;
Nvals = 30 ;
xinit = linspace(a,b,Nvals) ;
uinit(1) = yconst ; uinit(2) = dydxconst ;
## BVPguess = bvpinit(xinit,uinit) ;
BVPguess.x = xinit;
BVPguess.y = uinit;

% Specify error tolerances for BVP solver
## options = odeset('AbsTol',1e-08,'RelTol',1e-06) ;

% Solve the BVP system using the initial guess
BVPsoln = bvp4c(@meniscusODE,@meniscusBC,BVPguess) ;

% Evaluate the BVP solution on a grid for plotting
Nplot = 100 ;
xplot = linspace(a,b,Nplot) ;
uplot = deval(BVPsoln,xplot) ;

% Plot results
figure(1) ; clf ; hold on ;
plot(xplot,uplot(1,:),'r-','LineWidth',1) ; %plot y versus x
xlabel('x') ; ylabel('y') ;
title('interface curve: y vs x') ;
print -f1 -dpdf prog9_fig1.pdf ; %print figure to a file
