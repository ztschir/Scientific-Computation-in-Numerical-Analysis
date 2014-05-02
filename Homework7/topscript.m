h = 10./[50 100 200 400 800 1600];
y0 = 1;
y_t = @(t) sqrt(1+t^2);
f = @(t,y) t/y;
a = 0;
b = 10;


error = 0;
for n = h
  [y_o,t_o] = Euler(f,a,b,y0,n);
  prev_error = error;
  error = abs(y_o(end) - y_t(b));
  error_ratio = prev_error/error;
  fprintf('Euler h = %f error = %f error ratio = %f\n', n, error, error_ratio);
end

error = 0;
for n = h
  [y_o,t_o] = RK2(f,a,b,y0,n);
  prev_error = error;
  error = abs(y_o(end) - y_t(b));
  error_ratio = prev_error/error;
  fprintf('RK2 h = %f error = %f error ratio = %f\n', n, error, error_ratio);
end

error = 0;
for n = h
  [y_o,t_o] = RK4(f,a,b,y0,n);
  prev_error = error;
  error = abs(y_o(end) - y_t(b));
  error_ratio = prev_error/error;
  fprintf('RK4 h = %f error = %f error ratio = %f\n', n, error, error_ratio);
end

error = 0;
for n = h
  [y_o,t_o] = AB4(f,a,b,y0,n);
  prev_error = error;
  error = abs(y_o(end) - y_t(b));
  error_ratio = prev_error/error;
  fprintf('AB4 h = %f error = %f error ratio = %f\n', n, error, error_ratio);
end

error = 0;
for n = h
  [y_o,t_o] = AMB4(f,a,b,y0,n);
  prev_error = error;
  error = abs(y_o(end) - y_t(b));
  error_ratio = prev_error/error;
  fprintf('AMB4 h = %f error = %f error ratio = %f\n', n, error, error_ratio);
end