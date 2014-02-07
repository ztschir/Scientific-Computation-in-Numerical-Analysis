%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% False Position Method %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [root, numIters] = falsepos(f,a,b,TOL,MaxIter)
numIters = 2;
q0 = f(a);
q1 = f(b);
prevroot = a;
if (a == 0) prevroot = b; end;
  
while (numIters < MaxIter)
  root = b - q1*((b - a)/(q1 - q0));
  
  if (abs(root - prevroot)/abs(prevroot) < TOL)
    return;
  end
  
  numIters = numIters + 1;
  q = f(root);
  prevroot = root;
  
  if(q*q1 < 0)
    a = b;
    q0 = q1;
  end
  
  b = root;
  q1 = q;
  
end

fprintf('Method failed after %i iterations\n',numIters)

end
