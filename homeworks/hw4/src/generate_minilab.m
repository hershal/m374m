#!/usr/bin/env octave
# -*- mode: octave -*-

pkg load odepkg;
vopt = odeset ("InitialStep", 1e-2, "MaxStep", 1e-2, "RelTol", 1e-3, "AbsTol", 1e-3);

## figure(1); clf; hold on;
## figure(2); clf; hold on;
## figure(3); clf; hold on;

function dumpMinilab(prob, subprob)
  u0 = zeros(2,1);
  t0 = 0 ;  tf = 10 ;

  Npoints = 4 ;
  x0 = [1.0, -1.1, -2.3, 1.5] ;
  y0 = [0.8,  1.7, -0.9, -1.1] ;

  vopt = odeset ("InitialStep", 1e-1, "MaxStep", 1e-1, "RelTol", 1e-1, "AbsTol", 1e-1);
  for i=1:Npoints
    u0(1) = x0(i) ; u0(2) = y0(i) ;
    [tsoln,usoln]=ode45(@lovehate,[t0 tf],u0,vopt);
    ## figure(1); plot(tsoln,usoln(:,1),'b--') ; %plot u1 versus t
    u1 = [tsoln usoln(:,1) zeros(size(usoln,1),1)];
    dlmwrite(sprintf("minilab-%i-%i-x-%i.mat", prob, subprob, i), u1, " ", "precision", "%.5f");
    ## figure(2); plot(tsoln,usoln(:,2),'k-.') ; %plot u2 versus t
    u2 = [tsoln usoln(:,2) zeros(size(usoln,1),1)];
    dlmwrite(sprintf("minilab-%i-%i-y-%i.mat", prob, subprob, i), u2, " ", "precision", "%.5f");
    ## figure(3); plot(usoln(:,1),usoln(:,2),'r-')  ; %plot u2 versus u1
    uu = [usoln(:,1) usoln(:,2) zeros(size(usoln,1),1)];
    dlmwrite(sprintf("minilab-%i-%i-u-%i.mat", prob, subprob, i), uu, " ", "precision", "%.5f");
    clear tsoln usoln u1 u2 uu;
  end
endfunction

global a
global b
global c
global d

c1 = [0 3 -3 0, 1, 1];
c2 = [-4 3 3 -4, 2, 1];
c3 = [-2 3 3 -2, 2, 2];
configs = [c1; c2; c3];

for i=1:size(configs,1)
  cc = configs(i,:);
  a = cc(1);
  b = cc(2);
  c = cc(3);
  d = cc(4);
  dumpMinilab(cc(5),cc(6)); clear -globals
endfor
