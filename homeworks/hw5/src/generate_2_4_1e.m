#!/usr/bin/env octave
# -*- mode: octave -*-

f_2_4_1e = @(t, u) [u(1)^2+u(2)^2-4, u(2)-2*u(1)];
prob0 = "2.4.1e-1";
prob1 = "2.4.1e-2";
ep = 0.01;
sp = 0.2;
z0 = [2/sqrt(5), 4/sqrt(5)];
z1 = [-2/sqrt(5), -4/sqrt(5)];
p0 = [z0(1)+ep, z0(1)+ep, z0(1)-ep, z0(1)-ep
      z0(2)+ep, z0(2)-ep, z0(2)-ep, z0(2)+ep];
p1 = [z1(1)+sp, z1(1)+sp, z1(1)-sp, z1(1)-sp
      z1(2)+sp, z1(2)-sp, z1(2)-sp, z1(2)+sp];
generate_inorder(f_2_4_1e, prob0, p0, [3 3 3 3]);
generate_inorder(f_2_4_1e, prob1, p1, [1.1 .7 1.05 .7]);
