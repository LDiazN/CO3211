%sistemaLU
function x = sistemaLU(A,b)
  n = length(A);
  Lu = LUredox(A);
  L = tril(Lu,-1) + eye(n);
  U = triu(Lu);
  y = sustfor(L,b);
  x = sustat(U,y);
endfunction
