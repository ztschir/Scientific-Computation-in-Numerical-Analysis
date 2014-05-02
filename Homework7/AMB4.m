function [y,t] = AMB4(f,a,b,y0,h)
t = a:h:b;
y = RK4(f,a,a+3*h,y0,h);
for i=4:length(t)-1
  y_pred = y(i) + (h/24)*(55*f(t(i),y(i)) - 59*f(t(i-1),y(i-1)) + ...
                          37*f(t(i-2),y(i-2)) - 9*f(t(i-3),y(i-3)));
  y(i+1) = y(i) + (h/24)*(9*f(t(i+1),y_pred) + 19*f(t(i),y(i)) - ...
                     5*f(t(i-1),y(i-1)) + f(t(i-2),y(i-2)));
end
end