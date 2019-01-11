function evaluacion = Horner(coef, x)
  xLength = length(x);
  n = length(coef);
  for k = 1:1:xLength
    
    evaluacion(k) = coef(1);
    for i = 2: 1: n
      evaluacion(k) = (evaluacion(k)*x) + coef(i);
    endfor
  endfor
endfunction