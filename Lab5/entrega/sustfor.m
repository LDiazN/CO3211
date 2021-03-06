%sustfor
%Sustitución hacia adelante

function x = sustfor(A,b)
  n = length(A);
  %Despejamos la X1
  x = ones(n,1);
  x(1) = b(1)/A(1,1);
  
  for i = 2:1:n
    %Esta es la suma de las X anteriormente encontradas
    suma = 0;
    for j = 1:1:i-1
      suma = suma + A(i,j)*x(j);
    endfor
    %El despeje de la Xi
    x(i) = (b(i) -suma)/A(i,i);
  endfor
endfunction