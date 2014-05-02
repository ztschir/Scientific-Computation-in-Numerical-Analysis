function [y,t] = RK4(f,a,b,y0,h)
t = a:h:b;
y(1) = y0;
for i=1:length(t)-1
  k1 = h*f(t(i), y(i));
  k2 = h*f(t(i) + .5*h, y(i) + .5*k1);
  k3 = h*f(t(i) + .5*h, y(i) + .5*k2);
  k4 = h*f(t(i) + h, y(i) + k3);
  y(i+1) = y(i) + (1/6)*k1 + (1/3)*k2 + (1/3)*k3 + (1/6)*k4;
end
end