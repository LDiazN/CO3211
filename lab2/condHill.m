%condHill.m
%Esta función devuelve el condicionamiento de una matriz de Hillbert de tamaño n
function c = condHill(n)
  [H,b] = hillbert(n);
  c = cond(H,1);
endfunction
