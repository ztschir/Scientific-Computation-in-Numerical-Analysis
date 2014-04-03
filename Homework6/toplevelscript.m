
%% Problem 3 %%

f = @(x) exp(-x.^2);
g = @(x) 1./(2 + cos(x));
h = @(x) exp(x).*cos(4.*x);

fprintf('exp(-x^2)\n');
for k = 1:9
  n = 2^k;
  trap = compositetrapezoid(f,0,1,n);
  simp = compositesimpson(f,0,1,n);
  fprintf('n = %d trap = %.9f simp = %.9f\n',n,trap,simp);
end

fprintf('1/(2 + cos(x))\n');
for k = 1:9
  n = 2^k;
  trap = compositetrapezoid(g,0,2*pi,n);
  simp = compositesimpson(g,0,2*pi,n);
  fprintf('n = %d trap = %.10f simp = %.10f\n',n,trap,simp);
end

fprintf('exp(x)*cos(4*x)\n');
for k = 1:9
  n = 2^k;
  trap = compositetrapezoid(g,0,pi,n);
  simp = compositesimpson(g,0,pi,n);
  fprintf('n = %d trap = %.10f simp = %.10f\n',n,trap,simp);
end


%% Problem 4 A %%
fprintf('\n\nPart A\n');
j = @(x) sin(1./x);
p = 2;
tol = 1;
prev = romberg(j,.1,10,p-1);
current = romberg(j,.1,10,p);
while (abs(prev - current) > .00001)
  p = p + 1;
  prev = current;
  current = romberg(j,.1,10,p);
end
fprintf('p required is %d, smallest h is %f\n', p, (10-.1)/(2^p))

%% Part B %%
fprintf('\n\nPart B\n');
n = 2;
trap = compositetrapezoid(j,.1,10,n);
while (abs(trap - current) > .00001)
  n = n*2;
  trap = compositetrapezoid(j,.1,10,n);
end
fprintf('n required is %d\n', n);

%% Part C %%
fprintf('\n\nPart C\n');
p = 1;
TOL = 10^-p;
adpsmp = adaptivesimp(j,.1,10,TOL);
while (abs(adpsmp - current) > .00001)
  p = p + 1;
  TOL = 10^-p;
  adpsmp = adaptivesimp(j,.1,10,TOL);
end
fprintf('p required is %d\n', p);



