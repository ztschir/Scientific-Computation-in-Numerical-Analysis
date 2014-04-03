function I = adaptivesimp(f,a,b,TOL)
  w = (abs(b - a) / 6) * (f(a) + 4*f((a + b) / 2) + f(b));
  l = (abs((a+b)/2 - a) / 6) * (f(a) + 4*f((a + (a+b)/2) / 2) + f((a+b)/2));
  r = (abs(b - (a+b)/2) / 6) * (f((a+b)/2) + 4*f(((a+b)/2 + b) / 2) + f(b));
  
  if (abs(l + r - w) < 15*TOL)
    I = l + r + (l + r - w)/15;
  else
    I = adaptivesimp(f,(a+b)/2,b,TOL/2) + adaptivesimp(f,a,(a+b)/2,TOL/2);
end

