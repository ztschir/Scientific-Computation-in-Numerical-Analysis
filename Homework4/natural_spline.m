%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Natural Spline %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function C = natural_spline(x,y)
a = y;
h = diff(x);
n = length(x);

l(1) = 1;
mu(1) = 0;
z(1) = 0;

l(n) = 1;
z(n) = 0;
c(n) = 0;

for i = 2:n-1
  alpha(i) = (3/h(i))*(a(i+1) - a(i)) - (3/h(i-1))*(a(i) - a(i-1));
end

for i = 2:n-1
  l(i) = 2*(x(i+1) - x(i-1)) - h(i-1)*mu(i-1);
  mu(i) = h(i)/l(i);
  z(i) = (alpha(i) - h(i-1)*z(i-1))/l(i);
end

for j = n-1:1
  c(j) = z(j) - mu(j)*c(j+1);
  b(j) = (a(j+1) - a(j))/h(j) - h(j)*(c(j+1) + 2*c(j))/3;
  d(j) = (c(j+1) - c(j))/(3*h(j));
end

for i = 1:n
  C(i,1) = a(i);
  C(i,2) = b(i);
  C(i,3) = c(i);
  C(i,4) = d(i);
end
  
end