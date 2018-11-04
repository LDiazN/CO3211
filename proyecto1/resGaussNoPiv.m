%resGaussNoPiv; Es una función auxiliar para resolver  sistemas de ecuaciones
%usando gauss sin pivoteo:
function x = resGaussNoPiv(A,b)
  [A1,b1] = gaussNoPiv(A,b);
  x = sustback(A1,b1);
endfunction
