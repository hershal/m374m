#!/usr/bin/env octave
# -*- mode: octave -*-

f_2_1_3 = @(t, u) [u(2)^2, -2/3*u(1)];
problem = "2.1.3";
points = [-1, -0.5, 0.001, -1, -1;
          -1, -1, -0.001, -0.5, -0.75];
tf = [50, 2, 40, 6, 8];
generate_inorder(f_2_1_3, problem, points, tf);
