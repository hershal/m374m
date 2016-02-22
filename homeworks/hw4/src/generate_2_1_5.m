#!/usr/bin/octave
# -*- mode: octave -*-

pkg load odepkg;
## \addplot3[gray, quiver={u={}, v={}, scale arrows=0.1}, -stealth,samples=15]{0};
f_2_1_5 = @(t, u) [u(2)-u(1), -u(2)+(5*u(1)^2)/(4+u(1)^2)];
vopt = odeset ("InitialStep", 1e-1, "MaxStep", 1e-1, "RelTol", 1e-3, "AbsTol", 1e-3);
x0 = [-0.5, 0, 0.5, 2, 3, 5, 7];
y0 = [-0.5, 0, 0.5, 2, 3, 5, 7];

## figure(1); clf; hold on;
for i=1:length(x0)
  for j=1:length(y0)
    [t, u] = ode45(f_2_1_5, [0,3], [x0(i), y0(j)], vopt);
    ## plot(u(:,1),u(:,2));
    u = [u zeros(size(u,1),1)];
    dlmwrite(sprintf("../resources/2.1.5-%i-%i.mat", i, j), u, " ");
    clear t, u;
  endfor
endfor
