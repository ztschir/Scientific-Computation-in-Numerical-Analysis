%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Neville's Method %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [y] = Neville(x_n,f_n,x)

for k = 1:length(x)
  Q(:,1) = f_n;
  for i = 1: (length(x_n) - 1)
    for j = 1:i
      Q(i+1,j+1) = ((x(k) - x_n(i-j+1))*Q(i+1,j) - (x(k) - x_n(i+1))*Q(i,j)) /...
          (x_n(i+1) - x_n(i-j+1));
    end
  end
  y(k) = Q(end,end);
end
end