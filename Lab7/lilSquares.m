%lilSquares.m
%Esta función calcula los coeficientes (a0, a1...an) de un polinomio de grado
% n mediante el método de mínimos cuadrados. Devuelve un vector de coeficientes
% y recibe un vector de preimagenes Xi y uno de imagenes Yi.
function Ai = lilSquares(X,Y,n)
  %Inicialización:
  A = zeros(n+1,n+1);
  Ai = ones(n+1,1);
  b = ones(n+1,1);
  
  for i = 0:1:n
    A(1,i+1) = sum(X.^i);
    b(i+1) = (Y.')*(X.^i);
  endfor
  
  %Ahora vamos a calcular desde la fila 2 hasta la n+1:
  for i = 2:1:n+1
    %Primero inicializamos la fila con la fila anterior:
    A(i,1:n) = A(i-1,2:n+1);
    %Y luego calculamos el elemento quw falta se esa fila.
    A(i,n+1) = sum(X.^(n+i-1));
  endfor
  
  %Resolvemos el sistema obtenido
  Ai = A\b;
endfunction
