#!/usr/bin/env octave
# -*- mode: octave -*-

function generate(f, problem, points = [-2, 0, 2; -2, 0, 2])
  pkg load odepkg;

  vopt = odeset ("InitialStep", 1e-1, "MaxStep", 1e-2, "RelTol", 1e-3, "AbsTol", 1e-3);
  x0 = points(1, :);
  y0 = points(2, :);
  t0 = 0;
  tf = 6;

  for i=1:length(x0)
    for j=1:length(y0)
      [t, u] = ode45(f, [t0, tf], [x0(i), y0(j)], vopt);
      u = [u zeros(size(u,1),1)];
      dlmwrite(sprintf("%s-%i-%i.mat", problem, i, j), u, " ", "precision", "%.5f");
      clear t, u;
    endfor
  endfor
endfunction
