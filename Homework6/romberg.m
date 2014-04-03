function I = romberg(f,a,b,p)
h = b-a;
R = zeros(p+1);
R(1,1) = h/2*(f(a)+f(b));
for k = 2:p+1
  R(k,1) = 0;
  for i = 1:2^(k-2)
    R(k,1) = R(k,1)+f(a+(2*i-1)*h/2^(k-1)); 
  end
  R(k,1) = (R(k-1,1)+h/2^(k-2)*R(k,1))/2;
end
for k=2:p+1
  for j=k:p+1
    R(j,k) = (4^(k-1)*R(j,k-1)-R(j-1,k-1))/(4^(k-1)-1); 
  end
end
I = R(p+1,p+1);
end
