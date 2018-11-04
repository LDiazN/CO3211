%RelError_N1; función auxiliar para calcular el error relativo en norma 1:
function error = RelError_N1(x,x1)
  %x es el valor correcto, x1 el valor perturbado
  error = norm(x1-x,1)/norm(x);
endfunction
