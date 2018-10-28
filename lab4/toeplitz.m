%Toeplitz
function T = toeplitz(v)
  %el vector v tiene tamaño 2*n + 1
  n = floor(length(v)/2);
  T = eye(n+1); 
  
  %Cambiamos la primera fila de T
  T(1,:) = v(n+1:2*n+1);
  for i = 1:1:n
    T(i+1,:) = v(n+1-i:2*n+1-i);
  endfor
  
endfunction
