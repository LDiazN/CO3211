%newtVal.m: Esta función recibe un polinomio de newton y un conjunto de 
%preimágenes, y devuelve un vector con las evaluaciones de esas imágenes en el 
%polinomio de newton.
function Y = newtVal (C,PreX, X)
  n = length(X);
  
  for t = 1:1:n
    Y(t) = C(length(C));
    for i = length(C)-1:-1:1
      Y(t) = Y(t)*(X(t) - PreX(i)) + (C(i));
    endfor
  endfor
endfunction
