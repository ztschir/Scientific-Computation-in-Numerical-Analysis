function C = notAknot_spline(x,y)

% Create h values
for n=1:length(x)-1
  h(n) = x(n+1) - x(n);
end

% Create delta values
delta = diff(y) ./ (y(2:end)-x(1:end-1));

A(1,1)                   = h(2);
A(1,2)                   = h(1) + h(2);
A(length(x),length(x))   = h(length(x)-2);
A(length(x),length(x)-1) = h(length(x)-1) + h(length(x)-2);
for n=2:length(x)-1
  A(n,n-1) = h(n);
  A(n,n)   = 2*(h(n) + h(n-1));
  A(n,n+1) = h(n-1);
end

% Build r vector
r(1)         = 0;
r(length(x)) = 0;
for n=2:length(x)-1
  r(n) = 3 * (h(n-1)*delta(n) + h(n)*delta(n-1));
end

c = A\r';

% Find coeff b and d
for n=1:length(x)-1
  b(n) = ((y(n+1)-y(n)) / h(n)) - (h(n) / 3) * (2*c(n) + c(n+1));
  d(n) = (c(n+1)-c(n)) / (3*h(n));
end

% set C values
for n=1:length(x)-1
  C(1,n) = y(n);
  C(2,n) = b(n);
  C(3,n) = c(n);
  C(4,n) = d(n);
end
