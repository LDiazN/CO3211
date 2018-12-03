%potenciaInversa: calcula el minimo autovalor.
function [x,k,r] = potenciaInversa(A,error,x,itMax)
  [L,U] = LUfact(A);
  for k = 1:1:itMax
    y = resLU(L,U,x);
    r = y(1)/x(1);
  if norm(x-(y/norm(y,inf)),inf) < error
    r = 1/r;
    return
  endif
  x = y/norm(y,inf);
  endfor
  r = 1/r;
  
endfunction
