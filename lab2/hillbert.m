%hillbert

function [A,x] = hillbert(n)
  A = ones(n,n);
  x = ones(n,1);
  for i = 1:1:n
    x(i) = 1;
    for j = 1:1:n 
      A(i,j) = 1/(i+j-1);
    endfor
  endfor
endfunction
