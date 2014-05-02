clear all;
clc;

%%%%%%%%%%%%%%%%%
%%% Problem 2 %%%
%%%%%%%%%%%%%%%%%

deltaz = 1/1000;
h = 0.1;
x = 0:h:1;
y = cos(3*pi*x);
z = 0:deltaz:1;

figure('Name','cos(3*pi*x) for natural spline');
plot(z,eval_spline(x,natural_spline(x,y),z),z,cos(3*pi.*z));

prev_error = 0;
for hk = [.1, .05, .025, .0125, .00625]
  xk         = 0:hk:1;
  yk         = cos(3*pi*xk);
  if (hk ~= 0.1)
    prev_error = error;
  end
  error      = max(abs(eval_spline(xk,...
                              natural_spline(xk,yk),z) - cos(3*pi*z)));
  fprintf('cos(3pix) Natural h = %d error is %.10f and error ratio is %f\n',...
          hk,error,prev_error/error);          
end

%%%%%%%%%%%%%%%%%
%%% Problem 3 %%%
%%%%%%%%%%%%%%%%%

figure('Name','cos(3*pi*) for not a knot spline');
plot(z,eval_spline(x,notAknot_spline(x,y),z),...
     z,cos(3*pi*z));

prev_error = 0;
for hk = [.1, .05, .025, .0125, .00625]
  xk         = 0:hk:1;
  yk         = cos(3*pi.*xk);
  if (hk ~= 0.1)
    prev_error = error;
  end
  error      = max(abs(eval_spline(xk,...
                   notAknot_spline(xk,yk),z) - cos(3*pi.*z)));
  fprintf('cos(3pix) NotAknot h = %d error is %.10f and error ratio is %f\n',...
          hk,error,prev_error/error);          
end
     
%%%%%%%%%%%%%%%%%
%%% Problem 4 %%%
%%%%%%%%%%%%%%%%%

y = sin(4*pi*x);
C = natural_spline(x,y);
figure('Name','sin(4*pi*x) for a natural spline');
plot(z,eval_spline(x,natural_spline(x,y),z),...
     z,sin(4*pi.*z));

prev_error = 0;
for hk = [.1, .05, .025, .0125, .00625]
  xk         = 0:hk:1;
  yk         = cos(3*pi.*xk);
  if (hk ~= 0.1)
    prev_error = error;
  end
  error      = max(abs(eval_spline(xk,...
                   natural_spline(xk,yk),z) - sin(4*pi.*z)));
  fprintf('sin(4pix) Natural h = %d error is %.10f and error ratio is %f\n',...
          hk,error,prev_error/error);          
end

%%%%%%%%%%%%%%%%%
%%% Problem 5 %%%
%%%%%%%%%%%%%%%%%

z = -1:deltaz:1;

for hk = [.1, .0125]
  xk  = -1:hk:1;
  yk  = 1 ./ (1 + 25.*xk.^2);
  str = sprintf('1/(1+25x^2) notAknot with h = %f error',hk);
  figure('Name',str);
  plot(z,eval_spline(xk,...
       notAknot_spline(xk,yk),z) - 1 ./ (1 + 25.*z.^2));
end

%%%%%%%%%%%%%%%%%
%%% Problem 6 %%%
%%%%%%%%%%%%%%%%%

for hk = [.1, .0125]
  xk  = -1:hk:1;
  yk  = (xk >= 0);
  %y   = 1 ./ (1 + 25.*x.^2);
  str = sprintf('1 if x>=0 0 otherwise notAknot with h = %f error',hk);
  figure('Name',str);
  plot(z,eval_spline(xk,notAknot_spline(xk,yk),z) - 1 ./ (1 + 25.*z.^2));
end

%%%%%%%%%%%%%%%%%
%%% Problem 7 %%%
%%%%%%%%%%%%%%%%%

T   = 0:10:100;
rho = [1000 1000 998 996 992 988 983 978 972 965 958];
c   = [1402 1474 1482 1509 1529 1542 1551 1553 1554 1550 1543];

rho_36 = eval_spline(T,notAknot_spline(T,rho),36)
c_36   = eval_spline(T,notAknot_spline(T,c),36)

rho_68 = eval_spline(T,notAknot_spline(T,rho),68)
c_68   = eval_spline(T,notAknot_spline(T,c),68)

rho_96 = eval_spline(T,notAknot_spline(T,rho),96)
c_96   = eval_spline(T,notAknot_spline(T,c),96)

