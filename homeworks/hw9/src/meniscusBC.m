% -*- mode: octave -*-
function Gvals = meniscusBC(ua,ub)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Evaluates the meniscus model BC functions Ga and Gb,
% defined by the desired boundary conditions
%
%      Ga(u1,u2) = 0  at  x=a
%      Gb(u1,u2) = 0  at  x=b.
%
% Inputs:  ua = value of u at x=a, where u(1)=y,
%               u(2)=dy/dx.
%          ub = value of u at x=b, where u(1)=y,
%               u(2)=dy/dx.
%
% Output:  Ga = value of BC function given u=ua
%          Gb = value of BC function given u=ub
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Access global constants from main prog
global gamma ;

% Define BC parameters at x=a and x=b
dydxBCa = 0 ;
dydxBCb = tan(gamma) ;

% Evaluate BC functions at x=a and x=b
Ga = ua(2) - dydxBCa ;
Gb = ub(2) - dydxBCb ;

% Return values in vector form
Gvals = [Ga Gb] ;
