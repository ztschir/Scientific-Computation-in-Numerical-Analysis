%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Problem 5 Script %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

x = -2:0.01:2;
y = exp(sin(x));
T1 = 1 + x;
T2 = 1 + x + (x.^2)./2;
T4 = 1 + x + (x.^2)./2 - (x.^4)./8;
plot(x,y,x,T1,'-o',x,T2,'--',x,T4,':');
legend('exp(sin(x))', 'T1(x)', 'T2(x)', 'T4(x)');
xlabel('x axis');
ylabel('y(x)');


