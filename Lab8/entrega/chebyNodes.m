%chebyNodes.m: recibe los valores a,b,n, donde a y b definen el intervalo [a,b],
% n e es la cantidad de puntos de chebyshev que queremos.

function X = chebyNodes (a,b,n)
  X = ones(n,1);
  for i = n:-1:1 
    X(i) = (1/2)*(a+b) + (1/2) * (b-a) * cos(((2*i-1)/(2*n))*pi); 
  endfor
endfunction
