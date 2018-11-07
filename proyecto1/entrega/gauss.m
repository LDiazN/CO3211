%gauss.m
%{
Primero creamos nuestra matriz A de 5x5 con solución utilizando 
magic(5). Luego forzamos una b de solución que se corresponda con una solución que 
nosotros conozcamos. Para ello hacemos A*x donde x es un vector solución que nosotros 
conocemos, en este caso de unos. Usamos x para comparar las soluciones. A\b te devuelve las 
soluciones del sistema.
%}

function [A,b] = gauss(A,b)
  [m,n] = size(A);
  for k = 1:1:n-1
      for i = k+1:1:n
        alpha = A(i,k)/A(k,k);
        for j = k:1:n
          A(i,j) = A(i,j) - alpha*A(k,j);
        endfor
        b(i) = b(i) - alpha*b(k);
      endfor
  endfor
  
  