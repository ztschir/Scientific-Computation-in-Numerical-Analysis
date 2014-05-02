function [y,t] = Euler(f,a,b,y0,h)
t = a:h:b;
y(1) = y0;Xk
for i=1:length(t)-1
  y(i+1) = y(i) + h*f(t(i),y(i));
end
end