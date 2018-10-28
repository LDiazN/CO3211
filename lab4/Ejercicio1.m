%Ejercicio1; Luis diaz, 15-10420:

%Primero vamos a construir la matriz y el vector dados:

n = 1000;
A = -500000*eye(n);
b = (1:1:n).';

for i = 1:1:n
  for j = 1:1:n
    if i != j
      A(i,j) = min(i,j);
    endif
  endfor
endfor

%Calculamos el determinante para saber si el sistema tiene solución:
detA = det(A)

%Es diferente de 0, así que tiene solución

% a) Calculamos nuestra solución con gauss sin  pivoteo y tomamos tiempo.

tic
[Ag,bg] = gaussNoPiv(A,b);
x_GaussNoPiv = sustback(Ag,bg);
tGauss = toc
%El tiempo obtenido fue de 99 segundos.

% b) Comparamos calculando el tiempo solucionando el sistema con LU de crout
tic
[L,U] = croutFact1(A);
x_CroutLU = resLU(L,U,b);
tCrout = toc
%El tiempo obtenido fue de 117 segundos.

%En conclusión, dadas las implementaciones utilizadas para cada algoritmo,
%el más eficiente para calcular el sistema de ecuaciones fue Gauss sin pivoteo.
  

