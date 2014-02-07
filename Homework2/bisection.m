%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Bisection Method %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [root, numIters] = bisection(f,a,b,TOL,MaxIter)

numIters = 1;
FA = f(a);
prevroot = FA;

while (numIters < MaxIter)

  root = a + (b - a)/2;

  
  if (abs(f(root) - f(prevroot))/abs(prevroot) < TOL)
    return;
  end
  prevroot = f(root);
  
  numIters = numIters + 1;
  
  if (FA*prevroot > 0)
    a = root;
    FA = prevroot    
  else
    b = root;
  end

end

fprintf('Method failed after %i iterations.\n', numIters);
end