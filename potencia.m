%{
Método de la potencia:
Necesitas:
  a) Que hay un autovalor máximo estrico
  b) los autovectores son linealmente independientes. Esto es, los 
  autovectores son una base para R^n
 
Los métodos de la potencia son sólo para calcular autovalores y autovectores
máximos y mínimos.
En la función tienes que r es el máximo autovalor de A, x, es el autovector, k 
la máxima cantidad de operaciones
Esta función calcula el máximo autovalor de la matriz A, su 
%}

function [x,k,r] = potencia(A,error,x,itMax)
  for k = 1:1:itMax
    y = A*x;
    r = y(1)/x(1);
      if norm(x-(y/norm(y,inf)),inf) < error
      return
    endif
    x = y/norm(y,inf);
  endfor
endfunction
