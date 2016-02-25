#!/usr/bin/env octave
# -*- mode: octave -*-

pkg load odepkg;

function dumpMinilab(config)
  global g
  global L
  vopt = odeset ("InitialStep", 1e-2, "MaxStep", 1e-2, "RelTol", 1e-3, "AbsTol", 1e-3);
  u0 = zeros(2,1); %initialize 2x1 array
  u0(1) = 3*pi/8 ; %1st component is theta0
  u0(2) = 0 ;      %2nd component is dtheta0/dt
  % Define initial and final times for simulation
  t0 = 0 ;  tf = 2.5;

  % Set value of constants, solve the ODE system and
  % store results in the arrays tsolnA and usolnA
  [tsoln,usoln]=ode45(@pendulum,[t0 tf],u0, vopt) ;
  tu1 = [tsoln, usoln(:, 1)];
  tu2 = [tsoln*(sqrt(g/L)), usoln(:, 1)];
  dlmwrite(sprintf("minilab-1-%i.mat", config), tu1, " ", "precision", "%.5f");
  dlmwrite(sprintf("minilab-2-%i.mat", config), tu2, " ", "precision", "%.5f");
endfunction

global g
global L

c1 = [10, 0.25];
c2 = [10, 0.5];
c3 = [10, 1];
configs = [c1;c2;c3];

for i=1:size(configs,1)
  cc = configs(i,:);
  g = cc(1);
  L = cc(2);
  dumpMinilab(i); clear -globals
endfor
