%inversa
function Inv = inversa(A)
  n = length(A);
  e = ones(n,1);
  Inv = [];
  for k = 1:1:n
    e = 0*ones(n,1);
    e(k) = 1;
    x = sistemaLU(A,e);
    Inv = [Inv,x];
  endfor
endfunction
