%procedimiento uno, sistema Az=y con yi= 1 o -1 aleatoriamente; esta función 
% recibe la factorización L,U de de una matriz A y  devuelve una 
%matriz 2xn donde en la primera fila están las normas inf de las soluciones
% obtenidas :
function [C,M,Z] = randomSol2Exp(L,U,iteraciones)
    %{
  n: el tamaño de A
  C: las normas ||z||/||y||; C(1,i) es la norma infinita de la solución i, C(2,i)
     es la norma en norma 1
  %}
  n = length(L);
  C = ones(2,iteraciones);
  for i = 1:1:iteraciones
    y = -1*ones(n,1);
    for j =1:1:n
      y(j,1) = y(j,1)^randi(10,1);
    endfor
    M(:,i) = y;
    z = resLU(L,U,y);
    C(1,i) = norm(z,"inf")/norm(y,"inf");
    C(2,i) = norm(z,1)/norm(y,1);
    Z(:,i) = z;
  endfor
  A = L*U;
  C(1,:) = norm(A,inf)*C(1,:);
  C(2,:) = norm(A,1)*C(2,:);
endfunction
