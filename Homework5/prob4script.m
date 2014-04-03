%%%%% Problem 2 %%%%%

f = @(x) exp(x);
%dd_f = @(x,h) (-f(x + 2*h) + 16*f(x+h) - 30*f(x) + 16*f(x-h))/(12* ...
%                                                  h^2);
dd_f = @(x,h) (0*f(x + 2*h) + 12*f(x+h) - 24*f(x) + 12*f(x-h))/(12);

error = abs( f(0) - dd_f(0,0.1));
for p = 1:5
  h = (0.1) ./ (2.^p);
  prev_error = error;
  error = abs( f(0) - dd_f(0,h) );
  fprintf('prob2 h = %g error is %g  and error ratio %f \n', h, error, error / prev_error);
end



%%%%% Problem 3 %%%%%

f = @(x) exp(x);
dd_f = @(x,h) (2*f(3*h/2) - 2*f(h/2) + f(2*h) - f(h))/(3*h);

error = abs( f(0) - dd_f(0,0.1));
for p = 1:5
  h = (0.1) ./ (2.^p);
  prev_error = error;
  error = abs( f(0) - dd_f(0,h) );
  fprintf('prob3 h = %g error is %g  and error ratio %f \n', h, error, error / prev_error);
end



