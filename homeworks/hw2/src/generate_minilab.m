#!/usr/bin/env octave
# -*- mode: octave -*-

pkg load odepkg;

function dumpMinilab(prob)
  global V eta gamma
  u0 = 0;
  t0 = 0; tf = 10*V/eta;

  vopt = odeset ("InitialStep", tf/1e3, "MaxStep", tf/1e3, "RelTol", 1e-3, "AbsTol", 1e-3);

  % Solve ODE system (1)
  [tsoln1,usoln1] = ode45(@rtank,[t0 tf], u0, vopt);
  s1 = [tsoln1 usoln1(:,1) zeros(size(usoln1,1),1)];
  dlmwrite(sprintf("minilab-%i-1.mat", prob), s1, " ", "precision", "%.5f");

  % Solve ODE system (2) [set gamma=0]
  gamma = 0;
  [tsoln2,usoln2] = ode45(@rtank, [t0 tf], u0, vopt);
  s2 = [tsoln2 usoln2(:,1) zeros(size(usoln2,1),1)];
  dlmwrite(sprintf("minilab-%i-2.mat", prob), s2, " ", "precision", "%.5f");

  ## figure(1); clf; hold on;
  ## plot(tsoln1,usoln1,'b-')  ; %plot u versus t
  ## plot(tsoln2,usoln2,'r--') ; %plot u versus t
endfunction

global cin eta V gamma
c1 = [10^(-2), 10^(-2), 10, 10^(-1)];
c2 = [10^(-2), 10^(-1), 1, 10^(-1)];
configs = [c1; c2];

for i=1:size(configs,1)
  cc = configs(i,:);
  cin = cc(1);
  eta = cc(2);
  V = cc(3);
  gamma = cc(4);
  dumpMinilab(i); clear -globals
endfor
