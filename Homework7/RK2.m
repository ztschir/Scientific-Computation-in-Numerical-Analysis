function [y,t] = RK2(f,a,b,y0,h)
t = a:h:b;
y(1) = y0;
for i=1:length(t)-1
  k1 = h*f(t(i), y(i));
  k2 = h*f(t(i) + .5*h, y(i) + .5*k1);
  y(i+1) = y(i) + k2;
end
end