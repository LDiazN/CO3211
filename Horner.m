function evaluacion = Horner(coef, x)
  n = length(coef);
  evaluacion = coef(1);
  for i = 2: 1: n
    evaluacion = (evaluacion*x) + coef(i);
  endfor
endfunction