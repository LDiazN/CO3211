%Prepa Jean 9:

%{
El polinomio de newton:
  Es el que usa una base rara y usamos para el lab, lo único que tienes que saber
  es que necesitas un horner específico para este.
%}
function c = Newton(X,Y)
  c = Y;
  n = length(X);
  for j = 2:n
    for i = n:-1:j
      c(i) = (c(i)- c(i-1))/(X(i) - X(i-j+1));
    endfor
  endfor
endfunction
