#!/usr/bin/env octave
# -*- mode: octave -*-

a = .2;
b = 3;
N = 20;
mu = b/2;
f_2_6_3_5 = @(t, u) [-a*u(1)*u(2)+mu*(N-u(1)-u(2)), a*u(1)*u(2)-b*u(2)];
problem = "2.6.3.5";
points = [1.5 1.5 .5 .75 -1  -2
           -1  2   -1 -1  .75  1.75];
tols = [3 4 3 3 4 5];
rets = generate_inorder(f_2_6_3_5, problem, points, tols);

figure(1); clf; hold on;
for i=1:size(rets)
  plot(rets{i}(:,1), rets{i}(:,2))
endfor
