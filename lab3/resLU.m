%resLU; Una función auxiliar para resolver sistemas mediante sustitución LU:
function x = resLU(A,b)
  [L,U] = LUfact(A);
  y = sustfor(L,b);
  x = sustback(U,y);
endfunction
