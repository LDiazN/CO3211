%condi.m
%condicionamiento de hillbert
function condicionamiento = condi(n)
  [A,x] = hillbert(n);
  condicionamiento = cond(A,inf);
endfunction
