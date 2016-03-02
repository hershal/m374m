#!/usr/bin/env octave
# -*- mode: octave -*-

mu = -1;
f_2_4_4f = @(t,u) [u(2), u(1)^2-u(1)+mu*u(2)];
prob0 = "2.4.4f-1"
[x, y] = meshgrid (-3:0.1:3);
figure(1); clf; hold on; axis([-3 3 -3 3]);
quiver(x, y, y, x.^2-x+mu.*y);
