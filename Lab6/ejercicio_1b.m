%Esta función calcula el mayor autovalor para varios valores de epsilon

function x = ejercicio_1b()
  x = ones(3,4);
  for i = 1:1:3
    e = -2^i;
    A = [1 1 0; 0 1 10^e ; 0 10^e 1];
    X = ones(3,1);
    [v,x(2,i+1),x(1,i+1)] =  potencia(A,10^-12,X,5000);
    x(3,i+1) = norm(x(1,i+1)-max(eig(A)),"inf")/norm(max(eig(A)),"inf");
  endfor
  X = ones(3,1);
  A = [1 1 0; 0 1 1 ; 0 1 1];
  [v,x(2,1),x(1,1)] =  potencia(A,10^-12,X,5000);
  x(3,1) = norm(x(1,i+1)-max(eig(A)),"inf")/norm(max(eig(A)),"inf");
endfunction
