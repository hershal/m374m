#!/usr/bin/env octave
# -*- mode: octave -*-

f_2_4_1e = @(t, u) [u(1)^2+u(2)^2-4, u(2)-2*u(1)];
problem = "2.4.1e";
points = [-2, 0, 2;
          -2, 0, 2];
generate_inorder(f_2_4_1e, problem, points, [2 1 0.5]);
## generate(f_2_4_1e, problem);
