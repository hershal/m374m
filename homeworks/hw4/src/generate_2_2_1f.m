#!/usr/bin/env octave
# -*- mode: octave -*-

f_2_2_1f = @(t, u) [-2*u(1)-3*u(2), 3*u(1)-2*u(2)];
problem = "2.2.1f";
generate(f_2_2_1f, problem);
