#!/usr/bin/octave
# -*- mode: octave -*-

pkg load odepkg;
vopt = odeset ("InitialStep", 1e-1, "MaxStep", 1e-1, "RelTol", 1e-1, "AbsTol", 1e-3);

function dumpMinilab(prob, subprob, abcd)
  a = abcd(1);
  b = abcd(2);
  c = abcd(3);
  d = abcd(4);

  u0 = zeros(2,1);
  t0 = 0 ;  tf = 8  ;

  Npoints = 4 ;
  x0 = [1.0, -1.1, -2.3, 1.5] ;
  y0 = [0.8,  1.7, -0.9, -1.1] ;

  vopt = odeset ("InitialStep", .8, "MaxStep", .8, "RelTol", 1e-2, "AbsTol", 1e-2);
  for i=1:Npoints
    u0(1) = x0(i) ; u0(2) = y0(i) ;
    [tsoln,usoln]=ode45(@lovehate,[t0 tf],u0, vopt);
    l = length(usoln);
    ## plot(tsoln,usoln(:,1),'b--') ; %plot u1 versus t
    u1 = [tsoln usoln(:,1) zeros(size(usoln,1),1)];
    ## u1(l, :)
    dlmwrite(sprintf("../resources/minilab-%i-%i-x-%i.mat", prob, subprob, i), u1, " ");
    ## plot(tsoln,usoln(:,2),'k-.') ; %plot u2 versus t
    u2 = [tsoln usoln(:,2) zeros(size(usoln,1),1)];
    dlmwrite(sprintf("../resources/minilab-%i-%i-y-%i.mat", prob, subprob, i), u2, " ");
    ## plot(usoln(:,1),usoln(:,2),'r-')  ; %plot u2 versus u1
    uu = [usoln(:,1) usoln(:,2) zeros(size(usoln,1),1)];
    dlmwrite(sprintf("../resources/minilab-%i-%i-u-%i.mat", prob, subprob, i), uu, " ");
    clear tsoln usoln u1 u2 uu;
  end
endfunction

c1 = [0 3 -4 0];
dumpMinilab(1,1,c1);
## dumpMinilab(2,1,[-4 3 -4 3]);
## dumpMinilab(2,2,[-2 3 -4 2]);
