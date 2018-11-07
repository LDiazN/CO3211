%Sustitución hacia atrás:

function x = sustback(A,b) 
  n = length(A);
  x = ones(n,1);
  %El valor de la incógnita Xn, lo usaremos para conseguir las incógnitas anteriores:
  x(n) = b(n)/A(n,n);
  
  for i = n-1:-1:1
    %La suma de las Xi conocidas.
    suma = 0;
    for j = i+1:1:n
      suma = suma + A(i,j)*x(j);
    endfor
    %Cálculo de Xi
    x(i) = (b(i) - suma)/A(i,i);
  endfor
endfunction