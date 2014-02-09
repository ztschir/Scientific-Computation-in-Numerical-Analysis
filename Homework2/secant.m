%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% Secant Method %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [root, numIters] = secant(f,p0,p1,TOL,MaxIter)

numIters = 2;
q0 = f(p0);
q1 = f(p1);
if (p1 == 0) 
  fprintf('p1 can not be zero'); 
  return; 
end
  
while (numIters < MaxIter)
  root = p1 - q1*((p1 - p0)/(q1 - q0));
  
  if (abs(p1 - p0)/abs(p0) < TOL)
    return;
  end

  numIters = numIters + 1;
  p0 = p1;
  q0 = q1;
  p1 = root;
  q1 = f(root);
  
end

fprintf('Method failed after %i iterations\n',numIters)

end