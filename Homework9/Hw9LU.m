function [L U P] = Hw9LU(A)
N = size(A);
N = N(1);
L = eye(N);
U = A;
P = eye(N);
for c=1:(N-1)
  [m,i] = max(abs(U(c:end,c)));
  i = i+c-1;
  U([c i],:) = U([i c],:);
  P([c i],:) = P([i c],:);
  for r =(c+1):N
    k = U(r,c)/U(c,c);
    U(r,c:end) = U(r,c:end)-k*U(c,c:end);
    L(r,c) = k;
  end
end 
end
