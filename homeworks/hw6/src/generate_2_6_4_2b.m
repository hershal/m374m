#!/usr/bin/env octave
# -*- mode: octave -*-

eta = 2;
lambda = 3;

f_2_6_4_2b = @(t, u) [lambda*u(2)*(1-u(1)), eta*u(1)*(1-u(2))-u(2)];
problem = "2.6.4.2b";
points = [1.5 1.5 .5 .75 -1  -2
          -1  2   -1 -1  .75  1.75];
tols = [5 5 1.1 5 5 5];
generate_inorder(f_2_6_4_2b, problem, points, tols);
