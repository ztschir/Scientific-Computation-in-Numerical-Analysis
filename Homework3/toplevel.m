%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Top level script %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

%%%%% 11 values %%%%%
x_n = linspace(-pi,pi,11); 
f_n = sin(x_n);
j = 0:50; 
z = -pi + pi*(j/25);
P = EvalNewton(x_n,DivDiff(x_n,f_n),z);
plot(z,sin(z) - P);


%%%%% 21 values %%%%%
x_n = linspace(-pi,pi,21); 
f_n = sin(x_n);
j = 0:50; 
z = -pi + pi*(j/25);
P = EvalNewton(x_n,DivDiff(x_n,f_n),z);
plot(z,sin(z) - P);


%%%%% 11 values %%%%%
x_n = linspace(-1,1,11); 
f_n = (1./(1+(25.*(x_n.^2)))); 
j = 0:50; 
z = -1 + (j/25);
P = Neville(x_n,f_n,z);
plot(z,(1 ./ (1 + (25.*z.^2))) - P);


%%%%% 21 values %%%%%
x_n = linspace(-1,1,21); 
f_n = (1./(1+(25.*(x_n.^2)))); 
j = 0:50; 
z = -1 + (j/25);
P = Neville(x_n,f_n,z);
plot(z,(1 ./ (1 + (25.*z.^2))) - P);

