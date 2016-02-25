#!/usr/bin/env octave
# -*- mode: octave -*-

f_2_2_1a = @(t, u) [u(1)-3*u(2), -3*u(1)+u(2)];
problem = "2.2.1a";
points = [-2, -0.67, -0.33, 0.33,  0.67, 2;
          -2, -0.67, -0.33, 0.33,  0.67, 2;];
generate(f_2_2_1a, problem, points);
