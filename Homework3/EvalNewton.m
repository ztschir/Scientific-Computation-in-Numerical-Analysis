%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% EvalNewton Method %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [y] = EvalNewton(x_n,c,x)

for k = 1:length(x)
  P = c(1);
  for i = 2:length(c)  
    f = 1;
    for j = 1:(i-1)
      f = f * (x(k) - x_n(j));
    end
    P = P + c(i)*f;
  end
  y(k) = P;
end

end