#!/usr/bin/env octave
# -*- mode: octave -*-

f_2_4_1e = @(t, u) [u(1)^2+u(2)^2-4, u(2)-2*u(1)];
prob0 = "2.4.1e";
prob1 = "2.4.1e";
ep = 0.01;
z0 = [2/sqrt(5), 4/sqrt(5)];
z1 = [-2/sqrt(5), -4/sqrt(5)];
p0 = [z0(1)+ep, z0(1)+ep, z0(1)-ep, z0(1)-ep
      z0(2)+ep, z0(2)-ep, z0(2)-ep, z0(2)+ep];
p1 = [z1(1)+ep, z1(1)+ep, z1(1)-ep, z1(1)-ep
      z1(2)+ep, z1(2)-ep, z1(2)-ep, z1(2)+ep];
generate_inorder(f_2_4_1e, prob0, p0, [3 3 3 3]);
generate_inorder(f_2_4_1e, prob1, p1, [1 0.75 1 0.75]);