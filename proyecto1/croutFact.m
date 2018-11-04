%croutFact.m
function [L,U] = croutFact(A)
  n = length(A);
  U = eye(n);
  L = eye(n);
  contador = 0
  %inicializamos L, su primera columna es igual a la primera columna de A
  for i = 1:1:n
    L(i,1) = A(i,1);
  endfor
  %inicializamos U, su primera fila es igual a la primera fila de A1,j/L11 
  %salvo en U(1,1)
  for i = 2:1:n
    U(1,i) = A(1,i)/L(1,1);
  endfor
  %LLenamos el resto de las matrices:
  for k = 2:1:n
    %Para la diagonal:
    suma = 0;
    for s = 1:1:k-1
      suma = suma + L(k,s)*U(s,k);
    endfor
    L(k,k) = A(k,k) - suma;
    %Para U:
    for j = k+1:1:n
      suma = 0;
      for s = 1:1:k-1
        suma = suma + L(k,s)*U(s,j);
      endfor
      U(k,j) = (A(k,j) - suma)/L(k,k);
    endfor
    
    %Para L:
    for i = k+1:1:n
      suma = 0;
      for s = 1:1:k-1
        suma = suma + (L(i,s)*U(s,k));
      endfor
      L(i,k) = (A(i,k) - suma);
    endfor
    contador = contador + 1
  endfor
endfunction
