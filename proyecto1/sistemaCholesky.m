%sistemaCholesky
function x = sistemaCholesky(A,b)
  L = cholesky(A);
  U = L.';
  y = sustfor(L,b);
  x = sustback(U,y);
endfunction
