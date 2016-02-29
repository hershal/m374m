#!/usr/bin/env octave
# -*- mode: octave -*-

function generate_inorder(f, problem, points = [], tf = [])
  pkg load odepkg;

  vopt = odeset ("InitialStep", 1e-2, "MaxStep", 1e-2, "RelTol", 1e-3, "AbsTol", 1e-3);
  x0 = points(1, :);
  y0 = points(2, :);
  t0 = 0;

  assert(length(x0) == length(y0));

  ## figure(1); clf; hold on; axis([-1 1 -1 1])
  for i=1:length(x0)
    [t, u] = ode45(f, [t0, tf(i)], [x0(i), y0(i)], vopt);
    u = [u zeros(size(u,1),1)];
    ## plot(u(:, 1), u(:,2))
    dlmwrite(sprintf("%s-%i.mat", problem, i), u, " ", "precision", "%.5f");
    clear t, u;
  endfor
endfunction
