%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Problem 6 Script %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

n = 1:100000;
xn = 1 - cos(pi./n);
yn = 2*sin(pi./(2.*n)).^2;
abserr = abs(xn - yn);
relerr = abs(xn - yn)./abs(yn);
subplot(2,1,1);
plot(n,abserr);
title('Absolute error between xn and yn');
subplot(2,1,2);
plot(n,relerr);
title('Relative error between xn and yn');

