%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Problem 4 C %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

ivec = 1:156;

for i = ivec
  [modroot(i), numIters] = ...
      modifiednewton(@(x) exp(-x^2)*(x-10)^5,...
                     @(x) -exp(-x^2)*((x-10)^4)*(2*x^2-20*x-5),3,5,10^-6,i+1);
    [root(i), numIters] = ...
        newton(@(x) exp(-x^2)*(x-10)^5,...
               @(x) -exp(-x^2)*((x-10)^4)*(2*x^2-20*x-5),3,10^-6,i+1);
end



semilogy(ivec, abs(root - 10), ivec, abs(modroot - 10));


