function evaluacion = Lagrange(X, Y, x)
  n = length(X);
  Q = NaN(n, n);
  for i=1:1:n
    Q(i,1) = Y(i);
  endfor
  
  for i=2:1:n
    for j = 2:1:i
      Q(i, j) = ((x - X(i-j+1))*Q(i, j-1) - (x - X(i))*Q(i-1,j-1))/(X(i)-X(i-j+1));
    endfor
  endfor

  evaluacion = Q(n, n);
endfunction  