%Factorización LU; esta función recibe una matriz A y devuelve las matrices L y 
%U de la factorización de A.
function [L,U] = LUfact(A)
  n = length(A);
  L = eye(n);
  U = A;
  for i = 1:1:n-1

    %Ahora pondremos 0's en la columna bajo el pivote
    pivote = U(i,i);
    
    for j = i+1:1:n
      alpha = U(j,i)/pivote;
      L(j,i) = alpha;
      U(j,:) = U(j,:) - alpha.*U(i,:);

    endfor
  endfor 
endfunction
