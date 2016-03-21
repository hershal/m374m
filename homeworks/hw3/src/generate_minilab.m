#!/usr/bin/env octave
# -*- mode: octave -*-

pkg load odepkg;

function dumpMinilab(prob)
  u0 = 0;
  t0 = 0; tf = 50;

  vopt = odeset ("InitialStep", tf/1e2, "MaxStep", tf/1e2, "RelTol", 1e-3, "AbsTol", 1e-3);

  nplots = 50 ; delta = 1/(nplots-1) ;

  ## figure(1); clf; hold on;
  for i=1:(nplots)
    u0 = (i-1)*delta ;
    [tsoln,usoln]=ode45(@plant, [t0, tf], u0, vopt) ;
    s = [tsoln usoln(:,1) zeros(size(usoln,1),1)];
    dlmwrite(sprintf("minilab-%i-%i.mat", prob, i), s, " ", "precision", "%.5f");
    ## plot(tsoln,usoln)  ; %plot u versus t
  end
endfunction

global c h
configs = [4, 0.8;
           4, 1.0;
           4, 1.5;
           4, 1.6;
           4, 2.0];

for i=1:size(configs,1)
  cc = configs(i,:);
  c = cc(1);
  h = cc(2);
  dumpMinilab(i); clear -globals
endfor
