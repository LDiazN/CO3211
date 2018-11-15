%Esta función sirve para encontrar el autovalor que más se acerque a un número

function [x,k,r] = potenciaInversaDez(A,error,u, itMax)
  n = length(A);
  x = ones(n,1);
  despla = u*eye(n,n);
  A = A - despla;
  [L,U] = LUfact(A);
  for k = 1:1:itMax
    y = resLU(L,U,x);
    r = y(1)/x(1);
    disp(norm(x-(y/norm(y,inf)),inf))
  if norm(x-(y/norm(y,inf)),inf) < error
    r = 1/r;
    return
  endif
  x = y/norm(y,inf);
  endfor
  r = (1/r) + u;  
endfunction
