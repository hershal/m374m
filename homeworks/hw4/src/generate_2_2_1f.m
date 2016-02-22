#!/usr/bin/env octave
# -*- mode: octave -*-

pkg load odepkg;
f_2_2_1f = @(t, u) [-2*u(1)-3*u(2), 3*u(1)-2*u(2)];
vopt = odeset ("InitialStep", 1e-1, "MaxStep", 1e-2, "RelTol", 1e-3, "AbsTol", 1e-3);
x0 = [-1, 1];
y0 = [-1, 1];

figure(1); clf; hold on;
axis([-1, 1, -1, 1]);
for i=1:length(x0)
  for j=1:length(y0)
    [t, u] = ode45(f_2_2_1f, [0,2.0], [x0(i), y0(j)], vopt);
    plot(u(:,1),u(:,2));
    u = [u zeros(size(u,1),1)];
    dlmwrite(sprintf("../resources/2.2.1f-%i-%i.mat", i, j), u, " ");
    clear t, u;
  endfor
endfor
