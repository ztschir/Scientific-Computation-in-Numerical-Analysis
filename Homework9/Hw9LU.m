function [L U P] = Hw9LU(A)
N = length(b);
for c=1:(N-1)
  [k,index] = max(abs(A(c:end,c)));
  index = index+c-1;
  temp = A(c,:);
  A(c,:) = A(index,:);
  A(index,:)  = temp;
  temp = b(c);
  b(c) = b(index);
  b(index) = temp;
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