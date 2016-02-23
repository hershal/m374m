#!/usr/bin/env octave
# -*- mode: octave -*-

f_2_2_5 = @(t, u) [-2*u(1)+3*u(2), 2*u(1)-(3+4)*u(2)];
problem = "2.2.5";
generate(f_2_2_5, problem);
