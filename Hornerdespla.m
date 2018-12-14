function evaluation = Hornerdespla(coef,x,X)
  n = length(coef);
  evaluation = coef(n);
  
  for i = n-1: -1: 1
    evaluation = (evaluation * (x - X(i))) + coef(i);
  endfor
  
endfunction
