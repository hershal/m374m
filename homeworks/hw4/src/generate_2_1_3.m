#!/usr/bin/env octave
# -*- mode: octave -*-

f_2_1_3 = @(t, u) [u(2)^2, -2/3*u(1)];
problem = "2.1.3";
## does not work
generate_inorder(f_2_1_3, problem);
