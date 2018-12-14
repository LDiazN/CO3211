
#esta funcion toma un intervalo [a, b] y una cantidad de puntos "cuantos"
#y genera un vector X con los nodos de Chebyshev en dicho intervalo.
function X = Chebyshev(a,b, cuantos)
  g = @(x) (1/2)*(a+b) + (1/2)*(b-a)*cos((2*x -1)*(pi/(2*cuantos)));
  X = zeros(cuantos, 1);
  for i =1: cuantos
    X(i) = g(i);
  endfor
 
endfunction
