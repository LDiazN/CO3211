%poliNewton.m; esta función recibe un vector de preimágenes y uno de imágenes,
% y devuelve uno de coeficientes calculador por el método de diferencia dividida
% de Newton

function C = poliNewtonDiv (X, Y)
  n = length(X);
  C = Y(1:n);

  for j = 2:1:n
    for i = n:-1:j
      C(i) = (C(i)-C(i-1))/(X(i)-X(i-j+1));
      
    endfor
  endfor
endfunction
