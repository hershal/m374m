#!/usr/bin/env octave
# -*- mode: octave -*-

pkg load odepkg;

## figure(1); clf; hold on;
## figure(2); clf; hold on;
## figure(3); clf; hold on;

function dumpMinilab(prob, subprob)
  u0 = zeros(3,1);
  t0 = 0 ;  tf = 0.5 ;

  Npoints = 4 ;
  u10 = [0.08, -0.05,  0.03, -0.06] ;
  u20 = [0.10, -0.04, -0.02,  0.07] ;
  u30 = [1.00,  1.00,  1.00,  1.00] ;

  vopt = odeset ("InitialStep", 1e-3, "MaxStep", 1e-3, "RelTol", 1e-3, "AbsTol", 1e-3);
  for i=1:Npoints
    u0(1) = u10(i) ; u0(2) = u20(i) ; u0(3) = u30(i) ;
    u0 = u0/sqrt(u0(1)^2 + u0(2)^2 + u0(3)^2) ;
    [tsoln,usoln]=ode45(@rigidbody,[t0 tf],u0,vopt) ;
    ## figure(1) ;
    ## plot(tsoln,usoln(:,1),'k-') ; %plot u1 versus t
    u1 = [tsoln usoln(:,1) zeros(size(usoln,1),1)];
    dlmwrite(sprintf("minilab-%i-%i-u1-%i.mat", prob, subprob, i), u1, " ", "precision", "%.5f");

    ## figure(2) ;
    ## plot(tsoln,usoln(:,2),'b-') ; %plot u2 versus t
    u2 = [tsoln usoln(:,2) zeros(size(usoln,1),1)];
    dlmwrite(sprintf("minilab-%i-%i-u2-%i.mat", prob, subprob, i), u2, " ", "precision", "%.5f");

    ## figure(3) ;
    ## plot(tsoln,usoln(:,3),'m-') ; %plot u3 versus t
    u3 = [tsoln usoln(:,3) zeros(size(usoln,1),1)];
    dlmwrite(sprintf("minilab-%i-%i-u3-%i.mat", prob, subprob, i), u3, " ", "precision", "%.5f");

    ## figure(4) ;
    ## plot3(usoln(:,1),usoln(:,2),usoln(:,3),'r-')  ; %3D plot (u1,u2,u3)
    uu = [usoln(:,1) usoln(:,2) usoln(:,3)];
    dlmwrite(sprintf("minilab-%i-%i-uu-%i.mat", prob, subprob, i), uu, " ", "precision", "%.5f");
    clear tsoln usoln ;
  endfor
endfunction

global m
global a
global b
global c

c1 = [2.0, 0.03, 0.16, 0.24, 1, 1];
configs = [c1;];

for i=1:size(configs,1)
  cc = configs(i,:);
  m = cc(1);
  a = cc(2);
  b = cc(3);
  c = cc(4);
  dumpMinilab(cc(5),cc(6)); clear -globals
endfor
