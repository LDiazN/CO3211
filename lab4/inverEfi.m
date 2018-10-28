%inverEfi, del ejercicio4; una función que calcula la inversa eficientemente.

function inv = inverEfi(A)
  %Vimos que la descomposición LU es más rápida y precisa, así que la usaremos 
  %Para calcular la inversa usando sistemas de ecuaciones
  n = length(A);
  inv = [];
  
  for i = 1:1:n
    e = 0 * ones(n,1);
    e(i) = 1;
    x = resLU(A,e);
    inv = [inv,x];
  endfor
endfunction