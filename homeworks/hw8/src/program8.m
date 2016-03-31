%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program 8.
%
% A Matlab program that uses the built-in ODE solver 
% 'ode45' (4th/5th order Runge-Kutta method) to solve 
% the relativistic model for Mercury's orbit.
%
% Here's how to get started:
%
%   1) Copy program8.m (this file) and mercury.m 
%      into your working directory.
%
%   2) Invoke Matlab by typing "matlab" at the 
%      Linux prompt.
%
%   3) Type "program8" in the Matlab window to 
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
% Note2: The Mercury model must be written in 
%        the general first-order form
%                 du1/dt = F1(t,u1,u2)
%                 du2/dt = F2(t,u1,u2)
%        where t=theta, u1=(umerc), u2=d(umerc)/dt.  
%        In vector notation, this is du/dt = F(t,u), 
%        where u=(u1,u2), F=(F1,F2). This system is 
%        defined in the file mercury.m.  Here umerc 
%        is the inverse radius variable.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Define global constants
global rho gamma c ; 

% Define initial condition array (fill in values later)
uinit = zeros(2,1); %2x1 array

% Define initial and final theta 
n = 10 ;  
t0 = pi/4 ;  tf = t0 + 2*n*pi ; 

% Set value of constants
rho = 1 ; gamma = 0.0 ;  c = 0.7 ;

% Define initial condition.
umerc0 = (1+c)/rho ; umercdot0 = 0 ;
uinit = [umerc0, umercdot0] ;

% Specify error tolerances for ODE solver
options = odeset('AbsTol',1e-08,'RelTol',1e-06) ;

% Solve system 
[tsoln,usoln]=ode45(@mercury,[t0 tf],uinit,options) ; 

% Compute (x,y)-values for each theta-value 
N = length(tsoln) ;
xsoln = zeros(1,N) ;
ysoln = zeros(1,N) ;
for i=1:N
  theta = tsoln(i) ;
  umerc = usoln(i,1) ;
  r = 1/umerc ;
  xsoln(i) = r*cos(theta) ;
  ysoln(i) = r*sin(theta) ;
end

% Plot results
figure(1) ; clf ; hold on ;
plot(xsoln,ysoln,'r-','LineWidth',1)  ; %plot y versus x
axis([-3.5 1.5 -3.5 1.5]) ; axis equal ;
xlabel('x') ; ylabel('y') ;
title('Orbit curve: y vs x') ;
xsun=0 ; ysun=0 ;
text(xsun,ysun,'SUN','HorizontalAlignment','left') ;
print -f1 -dpdf prog8_fig1.pdf ; %print figure to a file

