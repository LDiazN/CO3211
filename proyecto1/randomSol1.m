%procedimiento uno, sistema Az=y con y aleatorios; esta función 
% recibe la factorización L,U de de una matriz A y  devuelve una 
%matriz 2xn donde en la primera fila están las normas inf de las soluciones
% obtenidas :
function C = randomSol1(L,U,iteraciones)
  %{
  n: el tamaño de A
  C: las normas ||z||/||y||; C(1,i) es la norma infinita de la solución i, C(2,i)
     es la norma en norma 1
  %}
  n = length(L);
  C = ones(2,iteraciones);
  for i = 1:1:iteraciones
    y = 10*randn(n,1);
    z = resLU(L,U,y);
    C(1,i) = norm(z,"inf")/norm(y,"inf");
    C(2,i) = norm(z,1)/norm(y,1);
  endfor
  A = L*U;
  C(1,:) = norm(A,inf)*C(1,:);
  C(2,:) = norm(A,1)*C(2,:);
endfunction
