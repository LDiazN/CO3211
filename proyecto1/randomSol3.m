%procedimiento uno, sistema Az=y con yi= 1 o -1 aleatoriamente; esta función 
% recibe la factorización L,U de de una matriz A y  devuelve una 
%matriz 2xn donde en la primera fila están las normas inf de las soluciones
% obtenidas :
function x1 = randomSol3(L,U,iteraciones)
  n = length(L);
  b = (1/n).*ones(n,1);
  x = resLU(L,U,b);
  %construimos el y:
  y = ones(1,n);
  for i = 1:1:n
    if x(i)>=0
      y(i) = 1;
    else
      y(1,i) = -1;
    endif
  endfor
  z = resLU(U.',L.',y);
  k = 1;
  for i = 1:1:n
    if abs(z(i))>abs(z(k))
      k = i;
    endif
  endfor
  b1 = 0*ones(n,1);
  b1(k) = 1;
  x1 = norm(L*U,1)*norm(resLU(L,U,b1),1);
endfunction
