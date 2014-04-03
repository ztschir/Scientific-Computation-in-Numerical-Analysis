function p = eval_spline(x,C,z)

% Evaluate the polynomial
i = 1;
for n=1:length(z)
  while (z(n)>x(i+1))
    i = i + 1;
  end  
  p(n) = C(1,i) + ...
         C(2,i) * (z(n)-x(i)) + ...
         C(3,i) * (z(n)-x(i))^2 + ...
         C(4,i) * (z(n)-x(i))^3;
end
end