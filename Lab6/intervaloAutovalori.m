%Intervalo. Esta función recibe el índice del i-ésimo autovalor asociado a la 
% i-ésima fila de la matriz, y devuelve los valores a,b del intervalo [a,b] tal 
% que el el autovalor asociado a la fila i. 
  function [a,b] = intervaloAutovalori(A,i)
  S = sum(abs(A(i,:))) - abs(A(i,i));
  a = A(i,i) - S;
  b = A(i,i) + S;
endfunction
