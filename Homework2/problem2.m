clear all;
clc;

f{1} = @(x) (sin(x) - x - 1);
f{2} = @(x) (x*(1 - cos(x)));
f{3} = @(x) (exp(x) - x^2 + 3*x - 2);

df{1} = @(x) (cos(x) - 1);
df{2} = @(x) (x*sin(x) + 1 - cos(x));
df{3} = @(x) (exp(x) - 2*x + 3);


TOL = 10^-6;
MaxIter = 500;
a = -2;
b = 1;
p0 = 1;
p1 = 0.9;



for t = 1:3
  [root, numIters] = bisection(f{t},a,b,TOL,MaxIter);
  fprintf('Bisection for f%i root = %f and iterations = %i\n',...
          t, root,numIters)

  [root, numIters] = falsepos(f{t},a,b,TOL,MaxIter);
  fprintf('FalsePos for f%i root = %f and iterations = %i\n',...
          t,root,numIters)

  [root, numIters] = newton(f{t},df{t},p0,TOL,MaxIter);
  fprintf('Newtons for f%i root = %f and iterations = %i\n',...
          t,root,numIters)

  [root, numIters] = secant(f{t},p0,p1,TOL,MaxIter);
  fprintf('Secant for f%i root = %f and iterations = %i\n',...
          t,root,numIters)
end