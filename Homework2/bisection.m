%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Bisection Method %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [root, numIters] = bisection(f,a,b,TOL,MaxIter)

numIters = 1;
FA = f(a);
prevroot = a;
if (a == 0) prevroot = b; end;

while (numIters < MaxIter)

  root = a + (b - a)/2;
  FROOT = f(root);
  
  if (abs(root - prevroot)/abs(prevroot) < TOL)
    return;
  end

  numIters = numIters + 1;
  prevroot = root;
  
  if (FA*FROOT > 0)
    a = root;
    FA = FROOT;
  else
    b = root;
  end

end

fprintf('Method failed after %i iterations.\n', numIters);
end