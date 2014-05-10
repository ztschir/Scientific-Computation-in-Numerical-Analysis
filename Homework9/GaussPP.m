function x = GaussPP(A,b)
N = size(A);
N = N(1);
for c=1:(N-1)
  [m,i] = max(abs(A(c:end,c)));
  i = i+c-1;
  A([c i],:) = A([i c],:);
  b([c i]) = b([i c]);
  for r =(c+1):N
    k = A(r,c)/A(c,c);
    A(r,c:end) = A(r,c:end)-k*A(c,c:end);
    b(r) = b(r)-k*b(c);
  end
end 
for r=N:-1:1
x(r) = b(r);
  for i=(r+1):N
    x(r)=x(r)-A(r,i)*x(i);
  end
x(r) = x(r)/A(r,r);
end
end
