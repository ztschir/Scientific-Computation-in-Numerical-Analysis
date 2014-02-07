%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% False Position Method %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [root, numIters] = falsepos(f,a,b,TOL,MaxIter)
numIters = 2;
q0 = f(a);
q1 = f(b);

while (numIters < MaxIter)
  root = b - q1*((b - a)/(q1 - q0));
  
  abs(root - prevroot)/abs(prevroot)
  
  if (abs(root - prevroot)/abs(prevroot) < TOL)
    return;
  end
  
  numIters = numIters + 1;
  prevroot = f(root);
  
  if(prevroot*q1 < 0)
    a = b;
    q0 = q1;
  end
  
  b = root;
  q1 = prevroot;
  
end

fprintf('Method failed after %i iterations\n',numIters)

end
