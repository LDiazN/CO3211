%resGaussPiv; Una función auxiliar para resolver rápidamente un sistema con 
% gauss de pivoteo:
function x = resGaussPiv(A,b)
  [A1,b1] = gaussPiv(A,b);
  x = sustback(A1,b1);
endfunction
