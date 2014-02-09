%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Modified Newton's Method %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [root, numIters] = modifiednewton(f,df,p0,m,TOL,MaxIter)

numIters = 1;
if (p0 == 0) 
  fprintf('p0 can not be zero'); 
  return; 
end
  
while (numIters < MaxIter)
  root = p0 - m*(f(p0)/df(p0));
  
  if (abs(root - p0)/abs(p0) < TOL)
    return;
  end

  numIters = numIters + 1;
  
  p0 = root;
  
end

fprintf('Method failed after %i iterations\n',numIters)

end