#!/usr/bin/env octave
# -*- mode: octave -*-

f_2_1_5 = @(t, u) [u(2)-u(1), -u(2)+(5*u(1)^2)/(4+u(1)^2)];
problem = "2.1.5";
generate(f_2_1_5, problem)
