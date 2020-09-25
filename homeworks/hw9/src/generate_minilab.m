#!/usr/bin/env octave
# -*- mode: octave -*-

function generate_minilab()
  global sigma
  global rho
  global g
  global gamma

  c1 = [0.05, 1000, 10, pi/3];
  configs = [c1;];

  for i=1:size(configs,1)
    cc = configs(i,:);
    sigma = cc(1);
    rho = cc(2);
    g = cc(3);
    gamma = cc(4);
    dumpMinilab(); clear -globals
  endfor
endfunction

function dumpMinilab()
  L = 0.07;
  a = 0;
  b = L;

  vopt = odeset ("InitialStep", 1e-3, "MaxStep", 1e-3, "RelTol", 1e-8, "AbsTol", 1e-6);

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
  ## uinit_1 = yconst ; uinit_2 = dydxconst ;
  uinit_1 = zeros(1, Nvals+1);
  uinit_2 = 0*uinit_1;

  uinit = [uinit_1; uinit_2];

  BVPguess.x = xinit; BVPguess.y = uinit ;

  % Specify error tolerances for BVP solver
  options = odeset('AbsTol',1e-08,'RelTol',1e-06) ;

  % Solve the BVP system using the initial guess
  BVPsoln = bvp4c(@meniscusODE,@meniscusBC,BVPguess,options) ;

  % Evaluate the BVP solution on a grid for plotting
  Nplot = 100 ;
  xplot = linspace(a,b,Nplot) ;
  uplot = deval(BVPsoln,xplot) ;

  uexpected = [xplot uplot(:,1) zeros(size(uplot,1),1)];
  dlmwrite("minilab-expected.mat", uexpected, " ", "precision", "%.5f");
endfunction
