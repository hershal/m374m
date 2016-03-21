#!/usr/bin/env octave
# -*- mode: octave -*-

function ret = generate(f, problem, points = [-2, 0, 2; -2, 0, 2], tf=6)
  pkg load odepkg;

  x0 = points(1, :);
  y0 = points(2, :);
  t0 = 0;

  ret = cell(length(x0),length(y0));
  for i=1:length(x0)
    for j=1:length(y0)
      vopt = odeset ("InitialStep", (tf-t0)/1e2, "MaxStep", (tf-t0)/1e2, "RelTol", 1e-3, "AbsTol", 1e-3);
      [t, u] = ode45(f, [t0, tf], [x0(i), y0(j)], vopt);
      u = [u zeros(size(u,1),1)];
      ret{i,j} = [u(:,1), u(:,2)];
      dlmwrite(sprintf("%s-%i-%i.mat", problem, i, j), u, " ", "precision", "%.5f");
      clear t, u;
    endfor
  endfor
endfunction
