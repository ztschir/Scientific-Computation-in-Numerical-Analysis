%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% DivDiff Method %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [c] = DivDiff(x_n,f_n)

F(:,1) = f_n;
c(1) = F(1,1);

for i = 1: (length(x_n) - 1)
  for j = 1:i
    F(i+1,j+1) = (F(i+1,j) - F(i,j)) / (x_n(i+1) - x_n(i-j+1));
    if(i == j) 
      c(i+1) = F(i+1,j+1);
    end
  end
end

end